// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {Neuron} from "../src/Neuron.sol";
import {MergingPool} from "../src/MergingPool.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {GameItems} from "../src/GameItems.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
import {StakeAtRisk} from "../src/StakeAtRisk.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract StakeAtRiskTest is Test {
    /*//////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/

    uint8[][] internal _probabilities;
    address internal constant _DELEGATED_ADDRESS = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address internal constant _GAME_SERVER_ADDRESS = 0x7C0a2BAd62C664076eFE14b7f2d90BF6Fd3a6F6C;
    address internal _ownerAddress;
    address internal _treasuryAddress;
    address internal _neuronContributorAddress;

    /*//////////////////////////////////////////////////////////////
                             CONTRACT INSTANCES
    //////////////////////////////////////////////////////////////*/

    FighterFarm internal _fighterFarmContract;
    RankedBattle internal _rankedBattleContract;
    VoltageManager internal _voltageManagerContract;
    GameItems internal _gameItemsContract;
    AiArenaHelper internal _helperContract;
    Neuron internal _neuronContract;
    MergingPool internal _mergingPoolContract;
    StakeAtRisk internal _stakeAtRiskContract;

    function getProb() public {
        _probabilities.push([25, 25, 13, 13, 9, 9]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 10]);
        _probabilities.push([25, 25, 13, 13, 9, 23]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 3]);
    }

    function setUp() public {
        _ownerAddress = address(this);
        _treasuryAddress = vm.addr(1);
        _neuronContributorAddress = vm.addr(2);
        getProb();

        _fighterFarmContract = new FighterFarm(_ownerAddress, _DELEGATED_ADDRESS, _treasuryAddress);

        _helperContract = new AiArenaHelper(_probabilities);

        _gameItemsContract = new GameItems(_ownerAddress, _treasuryAddress);

        _voltageManagerContract = new VoltageManager(_ownerAddress, address(_gameItemsContract));

        _neuronContract = new Neuron(_ownerAddress, _treasuryAddress, _neuronContributorAddress);

        _rankedBattleContract = new RankedBattle(
            _ownerAddress, _GAME_SERVER_ADDRESS, address(_fighterFarmContract), address(_voltageManagerContract)
        );

        _mergingPoolContract =
            new MergingPool(_ownerAddress, address(_rankedBattleContract), address(_fighterFarmContract));

        _stakeAtRiskContract =
            new StakeAtRisk(_ownerAddress, _treasuryAddress, address(_neuronContract), address(_rankedBattleContract));

        _voltageManagerContract.adjustAllowedVoltageSpenders(address(_rankedBattleContract), true);

        _neuronContract.addStaker(address(_rankedBattleContract));
        _neuronContract.addMinter(address(_rankedBattleContract));

        _rankedBattleContract.instantiateNeuronContract(address(_neuronContract));
        _rankedBattleContract.instantiateMergingPoolContract(address(_mergingPoolContract));
        _rankedBattleContract.setStakeAtRiskAddress(address(_stakeAtRiskContract));

        _fighterFarmContract.addStaker(address(_rankedBattleContract));
        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
        _fighterFarmContract.instantiateAIArenaHelperContract(address(_helperContract));
        _fighterFarmContract.instantiateNeuronContract(address(_neuronContract));
    }

    /// @notice Test the rankedBattle contract calling setNewRound to set the roundId and check if it was set correctly.
    function testSetNewRoundWithNoStakeAtRisk() public {
        vm.prank(address(_rankedBattleContract));
        _stakeAtRiskContract.setNewRound(1);
        assertEq(_stakeAtRiskContract.roundId() == 1, true);
    }

    /// @notice Test that only the rankedBattle contract can call setNewRound.
    function testSetNewRoundFromNonRankedBattle() public {
        vm.expectRevert();
        _stakeAtRiskContract.setNewRound(1);
        assertEq(_stakeAtRiskContract.roundId(), 0);
    }

    /// @notice Test the rankedBattle contract calling setNewRound to set the roundId and check if it was set correctly and if stake at risk was swept.
    function testSetNewRoundWithStakeAtRisk() public {
        address player = vm.addr(3);
        uint256 stakeAmount = 3_000 * 10 ** 18;
        uint256 expectedStakeAtRiskAmount = (stakeAmount * 100) / 100000;
        _mintFromMergingPool(player);
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(stakeAmount, 0);
        assertEq(_rankedBattleContract.amountStaked(0), stakeAmount);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        // loses battle
        _rankedBattleContract.updateBattleRecord(0, 50, 2, 1500, true);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, 0), expectedStakeAtRiskAmount);
        vm.prank(address(_rankedBattleContract));
        _stakeAtRiskContract.setNewRound(1);
        assertEq(_stakeAtRiskContract.roundId(), 1);
        assertEq(_stakeAtRiskContract.amountLost(player), expectedStakeAtRiskAmount);
    }

    /// @notice Test the rankedBattle contract calling reclaimNRN to reclaim NRN tokens that are  at risk for a fighter.
    function testReclaimNRN() public {
        address player = vm.addr(3);
        uint256 stakeAmount = 3_000 * 10 ** 18;
        uint256 expectedStakeAtRiskAmount = (stakeAmount * 100) / 100000;
        _mintFromMergingPool(player);
        uint256 tokenId = 0;
        assertEq(_fighterFarmContract.ownerOf(tokenId), player);
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(stakeAmount, 0);
        assertEq(_rankedBattleContract.amountStaked(0), stakeAmount);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        // loses battle
        _rankedBattleContract.updateBattleRecord(0, 50, 2, 1500, true);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, 0), expectedStakeAtRiskAmount);
        vm.prank(address(_rankedBattleContract));
        _stakeAtRiskContract.reclaimNRN(expectedStakeAtRiskAmount, tokenId, player);
        assertEq(_stakeAtRiskContract.amountLost(player), 0);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, tokenId), 0);
    }

    /// @notice Test the rankedBattle contract updating the stakeAtRisk amount for a players fighter.
    function testUpdateAtRiskRecords() public {
        address player = vm.addr(3);
        uint256 stakeAmount = 3_000 * 10 ** 18;
        uint256 expectedStakeAtRiskAmount = (stakeAmount * 100) / 100000;
        uint256 newStakeAtRiskAmount = 1000 * 10 ** 18;
        uint256 newTotlaStakeAtRiskAmount = newStakeAtRiskAmount + expectedStakeAtRiskAmount;
        uint256 tokenId = 0;

        // player gets fighter
        _mintFromMergingPool(player);
        assertEq(_fighterFarmContract.ownerOf(tokenId), player);

        // player gets NRN
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        // player stakes NRN
        _rankedBattleContract.stakeNRN(stakeAmount, 0);
        assertEq(_rankedBattleContract.amountStaked(0), stakeAmount);

        // player battles
        vm.prank(address(_GAME_SERVER_ADDRESS));
        // loses battle
        _rankedBattleContract.updateBattleRecord(0, 50, 2, 1500, true);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, 0), expectedStakeAtRiskAmount);

        // ranked battle contracts updates at risk amount for players fighter
        vm.prank(address(_rankedBattleContract));
        _stakeAtRiskContract.updateAtRiskRecords(newStakeAtRiskAmount, tokenId, player);
        assertEq(_stakeAtRiskContract.amountLost(player), newTotlaStakeAtRiskAmount);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, tokenId), newTotlaStakeAtRiskAmount);
    }

    /// @notice Test getting the stake at risk for a players fighter that has stake at risk.
    function testGetStakeAtRisk() public {
        address player = vm.addr(3);
        uint256 stakeAmount = 3_000 * 10 ** 18;
        uint256 expectedStakeAtRiskAmount = (stakeAmount * 100) / 100000;
        uint256 tokenId = 0;

        // player gets fighter
        _mintFromMergingPool(player);
        assertEq(_fighterFarmContract.ownerOf(tokenId), player);

        // player gets NRN
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        // player stakes NRN
        _rankedBattleContract.stakeNRN(stakeAmount, 0);
        assertEq(_rankedBattleContract.amountStaked(0), stakeAmount);

        // player battles
        vm.prank(address(_GAME_SERVER_ADDRESS));
        // loses battle
        _rankedBattleContract.updateBattleRecord(0, 50, 2, 1500, true);
        assertEq(_stakeAtRiskContract.stakeAtRisk(0, 0), expectedStakeAtRiskAmount);
        assertEq(_stakeAtRiskContract.getStakeAtRisk(tokenId), expectedStakeAtRiskAmount);
    }

    /*//////////////////////////////////////////////////////////////
                               HELPERS
    //////////////////////////////////////////////////////////////*/

    /// @notice Helper function to mint an fighter nft to an address.
    function _mintFromMergingPool(address to) internal {
        vm.prank(address(_mergingPoolContract));
        _fighterFarmContract.mintFromMergingPool(to, "_neuralNetHash", "original", [uint256(1), uint256(80)]);
    }

    /// @notice Helper function to fund an account with 4k $NRN tokens.
    function _fundUserWith4kNeuronByTreasury(address user) internal {
        vm.prank(_treasuryAddress);
        _neuronContract.transfer(user, 4_000 * 10 ** 18);
        assertEq(4_000 * 10 ** 18 == _neuronContract.balanceOf(user), true);
    }

    function onERC721Received(address, address, uint256, bytes memory) public pure returns (bytes4) {
        // Handle the token transfer here
        return this.onERC721Received.selector;
    }
}
