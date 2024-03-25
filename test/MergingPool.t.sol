// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {Neuron} from "../src/Neuron.sol";
import {AAMintPass} from "../src/AAMintPass.sol";
import {MergingPool} from "../src/MergingPool.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {GameItems} from "../src/GameItems.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract MergingPoolTest is Test {
    /*//////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/

    uint8[][] internal _probabilities;
    address internal constant _DELEGATED_ADDRESS = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address internal _ownerAddress;
    address internal _treasuryAddress;
    address internal _neuronContributorAddress;

    /*//////////////////////////////////////////////////////////////
                             CONTRACT INSTANCES
    //////////////////////////////////////////////////////////////*/

    FighterFarm internal _fighterFarmContract;
    AAMintPass internal _mintPassContract;
    MergingPool internal _mergingPoolContract;
    RankedBattle internal _rankedBattleContract;
    VoltageManager internal _voltageManagerContract;
    GameItems internal _gameItemsContract;
    AiArenaHelper internal _helperContract;
    Neuron internal _neuronContract;

    function getProb() public {
        _probabilities.push([25, 25, 13, 13, 9, 9]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 10]);
        _probabilities.push([25, 25, 13, 13, 9, 23]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 3]);
    }

    /*//////////////////////////////////////////////////////////////
                                SETUP
    //////////////////////////////////////////////////////////////*/

    function setUp() public {
        _ownerAddress = address(this);
        _treasuryAddress = vm.addr(1);
        _neuronContributorAddress = vm.addr(2);
        getProb();

        _fighterFarmContract = new FighterFarm(_ownerAddress, _DELEGATED_ADDRESS, _treasuryAddress);

        _helperContract = new AiArenaHelper(_probabilities);

        _mintPassContract = new AAMintPass(_ownerAddress, _DELEGATED_ADDRESS);
        _mintPassContract.setFighterFarmAddress(address(_fighterFarmContract));
        _mintPassContract.setPaused(false);

        _gameItemsContract = new GameItems(_ownerAddress, _treasuryAddress);

        _voltageManagerContract = new VoltageManager(_ownerAddress, address(_gameItemsContract));

        _neuronContract = new Neuron(_ownerAddress, _treasuryAddress, _neuronContributorAddress);

        _rankedBattleContract = new RankedBattle(
            _ownerAddress, address(_fighterFarmContract), _DELEGATED_ADDRESS, address(_voltageManagerContract)
        );

        _rankedBattleContract.instantiateNeuronContract(address(_neuronContract));

        _mergingPoolContract =
            new MergingPool(_ownerAddress, address(_rankedBattleContract), address(_fighterFarmContract));

        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
        _fighterFarmContract.instantiateAIArenaHelperContract(address(_helperContract));
        _fighterFarmContract.instantiateMintpassContract(address(_mintPassContract));
        _fighterFarmContract.instantiateNeuronContract(address(_neuronContract));
        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
    }

    /// @notice Test owner transferring ownership and new owner calling only owner functions.
    function testTransferOwnershipFromOwner() public {
        _mergingPoolContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _mergingPoolContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_mergingPoolContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test transferring ownership from an non owner account.
    function testTransferOwnershipFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _mergingPoolContract.transferOwnership(msg.sender);
    }

    /// @notice Test adjusting admin access from owner.
    function testAdjustAdminAccessFromOwner() public {
        _mergingPoolContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_mergingPoolContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test adjusting admin access from a non owner account failing.
    function testAdjustAdminAccessFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _mergingPoolContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_mergingPoolContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test of admin updating winners per period.
    function testUpdateWinnersPerPeriodFromAdmin() public {
        _mergingPoolContract.updateWinnersPerPeriod(3);
        assertEq(_mergingPoolContract.winnersPerPeriod(), 3);
    }

    /// @notice Test of a non admin updating winners per period failing.
    function testUpdateWinnersPerPeriodFromNonAdmin() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _mergingPoolContract.updateWinnersPerPeriod(3);
        assertEq(_mergingPoolContract.winnersPerPeriod(), 2);
    }

    /// @notice Test of admin picking winners.
    function testpickWinners() public {
        _mintFromMergingPool(_ownerAddress);
        _mintFromMergingPool(_DELEGATED_ADDRESS);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(1), _DELEGATED_ADDRESS);
        uint256[] memory _winners = new uint256[](2);
        _winners[0] = 0;
        _winners[1] = 1;
        _mergingPoolContract.pickWinners(_winners);
        assertEq(_mergingPoolContract.isSelectionComplete(0), true);
        assertEq(_mergingPoolContract.winnerAddresses(0, 0) == _ownerAddress, true);
        assertEq(_mergingPoolContract.winnerAddresses(0, 1) == _DELEGATED_ADDRESS, true);
    }

    /// @notice Test of admin picking winners with wrong length.
    function testpickWinnersRevertWrongLength() public {
        _mintFromMergingPool(_ownerAddress);
        _mintFromMergingPool(_DELEGATED_ADDRESS);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(1), _DELEGATED_ADDRESS);
        uint256[] memory _winners = new uint256[](1);
        _winners[0] = 0;
        vm.expectRevert("Incorrect number of winners");
        _mergingPoolContract.pickWinners(_winners);
        assertEq(_mergingPoolContract.isSelectionComplete(0), false);
    }

    /// @notice Test of winners claiming rewards for multiple rounds and checking if unclaimed rewards is updating correctly.
    function testClaimRewardsForWinnersOfMultipleRoundIds() public {
        _mintFromMergingPool(_ownerAddress);
        _mintFromMergingPool(_DELEGATED_ADDRESS);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(1), _DELEGATED_ADDRESS);
        uint256[] memory _winners = new uint256[](2);
        _winners[0] = 0;
        _winners[1] = 1;
        // winners of roundId 0 are picked
        _mergingPoolContract.pickWinners(_winners);
        assertEq(_mergingPoolContract.isSelectionComplete(0), true);
        assertEq(_mergingPoolContract.winnerAddresses(0, 0) == _ownerAddress, true);
        // winner matches ownerOf tokenId
        assertEq(_mergingPoolContract.winnerAddresses(0, 1) == _DELEGATED_ADDRESS, true);
        string[] memory _modelURIs = new string[](2);
        _modelURIs[0] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";
        _modelURIs[1] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";
        string[] memory _modelTypes = new string[](2);
        _modelTypes[0] = "original";
        _modelTypes[1] = "original";
        uint256[2][] memory _customAttributes = new uint256[2][](2);
        _customAttributes[0][0] = uint256(1);
        _customAttributes[0][1] = uint256(80);
        _customAttributes[1][0] = uint256(1);
        _customAttributes[1][1] = uint256(80);
        uint32 _totalRoundsToConsider = 1;
        // winners of roundId 1 are picked
        _mergingPoolContract.pickWinners(_winners);
        // winner claims rewards for previous roundIds
        _mergingPoolContract.claimRewards(_modelURIs, _modelTypes, _customAttributes, _totalRoundsToConsider);
        // other winner claims rewards for previous roundIds
        vm.prank(_DELEGATED_ADDRESS);
        _mergingPoolContract.claimRewards(_modelURIs, _modelTypes, _customAttributes, _totalRoundsToConsider);
        uint256 numRewards = _mergingPoolContract.getUnclaimedRewards(_DELEGATED_ADDRESS);
        emit log_uint(numRewards);
        assertEq(numRewards, 1); //was 0
    }

    /// @notice Test getting the unclaimed amount for an address owning 2 fighters that's been included in 2 rounds of picked winners.
    function testGetUnclaimedRewardsForWinnerOfMultipleRoundIds() public {
        _mintFromMergingPool(_ownerAddress);
        _mintFromMergingPool(_ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(1), _ownerAddress);
        uint256[] memory _winners = new uint256[](2);
        _winners[0] = 0;
        _winners[1] = 1;
        _mergingPoolContract.pickWinners(_winners);
        assertEq(_mergingPoolContract.isSelectionComplete(0), true);
        assertEq(_mergingPoolContract.winnerAddresses(0, 0) == _ownerAddress, true);
        assertEq(_mergingPoolContract.winnerAddresses(0, 1) == _ownerAddress, true);
        // winners of roundId 1 are picked
        _mergingPoolContract.pickWinners(_winners);
        uint256 numRewards = _mergingPoolContract.getUnclaimedRewards(_ownerAddress);
        emit log_uint(numRewards);
        // since the owner has 2 fighters and 2 rounds have picked winners, the numRewards should be 4
        assertEq(numRewards, 4);
    }

    /// @notice Test the rankedBattle contract calling the addPoints function and check if totalPoints was updated correctly.
    function testAddPointsFromRankedBattle() public {
        // owner mints a fighter by claiming
        _mintFromMergingPool(_ownerAddress);
        // rankedeBattle contract adds points
        vm.prank(address(_rankedBattleContract));
        // maybe check if token exists in addPoints function
        _mergingPoolContract.addPoints(0, 100);
        assertEq(_mergingPoolContract.totalPoints(), 100);
    }

    /// @notice Test that only the rankedBattle contract is authorized to call this function and that totalPoints was not updated.
    function testAddPointsFromNonRankedBattle() public {
        vm.expectRevert("Not Ranked Battle contract address");
        _mergingPoolContract.addPoints(0, 100);
        assertEq(_mergingPoolContract.totalPoints(), 0);
    }

    /// @notice Test getting the fighter points of fighter that has been added points to and if it reverts if incorrect maxId is passed.
    function testGetFighterPoints() public {
        // owner mints a fighter by claiming
        _mintFromMergingPool(_ownerAddress);
        address owner = _fighterFarmContract.ownerOf(0);
        assertEq(owner, _ownerAddress);

        // rankedeBattle contract adds points
        vm.prank(address(_rankedBattleContract));
        _mergingPoolContract.addPoints(0, 100);
        assertEq(_mergingPoolContract.totalPoints(), 100);
        // getFighterPoints for owners fighter
        uint256[] memory fighterPoints = _mergingPoolContract.getFighterPoints(1);
        assertEq(fighterPoints.length >= 1 && fighterPoints[0] == 100, true);
        // getFighterPoints for non existent fighter
        vm.expectRevert(stdError.indexOOBError);
        _mergingPoolContract.getFighterPoints(1000);
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
