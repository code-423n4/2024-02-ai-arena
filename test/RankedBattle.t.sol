// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {Neuron} from "../src/Neuron.sol";
import {AAMintPass} from "../src/AAMintPass.sol";
import {MergingPool} from "../src/MergingPool.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {GameItems} from "../src/GameItems.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
import {StakeAtRisk} from "../src/StakeAtRisk.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract RankedBattleTest is Test {
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
    AAMintPass internal _mintPassContract;
    MergingPool internal _mergingPoolContract;
    RankedBattle internal _rankedBattleContract;
    VoltageManager internal _voltageManagerContract;
    GameItems internal _gameItemsContract;
    AiArenaHelper internal _helperContract;
    Neuron internal _neuronContract;
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

        _mintPassContract = new AAMintPass(_ownerAddress, _DELEGATED_ADDRESS);
        _mintPassContract.setFighterFarmAddress(address(_fighterFarmContract));
        _mintPassContract.setPaused(false);

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

        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
        _fighterFarmContract.addStaker(address(_rankedBattleContract));
        _fighterFarmContract.instantiateAIArenaHelperContract(address(_helperContract));
        _fighterFarmContract.instantiateMintpassContract(address(_mintPassContract));
        _fighterFarmContract.instantiateNeuronContract(address(_neuronContract));
    }

    /// @notice Test owner transferring ownership and new owner calling only owner functions.
    function testTransferOwnershipFromOwner() public {
        _rankedBattleContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _rankedBattleContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_rankedBattleContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test transferring ownership from an non owner account.
    function testRevertTransferOwnershipFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.transferOwnership(msg.sender);
        assertEq(_rankedBattleContract.isAdmin(msg.sender), false);
    }

    /// @notice Test adjusting admin access from owner.
    function testAdjustAdminAccessFromOwner() public {
        _rankedBattleContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_rankedBattleContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test adjusting admin access from a non owner account failing.
    function testRevertAdjustAdminAccessFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_rankedBattleContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test owner setting the game server address.
    function testSetGameServerAddressFromOwner() public {
        _rankedBattleContract.setGameServerAddress(_GAME_SERVER_ADDRESS);
    }

    /// @notice Test a non owner setting the game server address reverting.
    function testRevertSetGameServerAddressFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.setGameServerAddress(_GAME_SERVER_ADDRESS);
    }

    /// @notice Test owner setting the StakeAtRisk address and instantiating the contract.
    function testSetStakeAtRiskAddressFromOwner() public {
        _rankedBattleContract.setStakeAtRiskAddress(address(_stakeAtRiskContract));
    }

    /// @notice Test an non owner calling setStakeAtRiskAddress reverting.
    function testRevertSetStakeAtRiskAddressFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.setStakeAtRiskAddress(address(_stakeAtRiskContract));
    }

    /// @notice Test owner instantiating the Neuron contract.
    function testInstantiateNeuronContractFromOwner() public {
        _rankedBattleContract.instantiateNeuronContract(address(_neuronContract));
    }

    /// @notice Test an non owner trying to instantiate Neuron contract reverts.
    function testRevertInstantiateNeuronContractFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.instantiateNeuronContract(address(_neuronContract));
    }

    /// @notice Test owner instantiating the MergingPool contract.
    function testInstantiateMergingPoolContractFromOwner() public {
        _rankedBattleContract.instantiateMergingPoolContract(address(_mergingPoolContract));
    }

    /// @notice Test an non owner trying to instantiate MergingPool contract reverts.
    function testRevertInstantiateMergingPoolContractFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.instantiateNeuronContract(address(_mergingPoolContract));
    }

    /// @notice Test an admin setting the distribution amount on Neuron for a round.
    function testSetRankedNrnDistributionFromAdmin() public {
        uint256 newDistribution = 2000;
        _rankedBattleContract.setRankedNrnDistribution(newDistribution);
        assertEq(_rankedBattleContract.rankedNrnDistribution(0), newDistribution * 10 ** 18);
    }

    /// @notice Test an non admin setting the distribution amount on Neuron for a round reverting.
    function testRevertSetRankedNrnDistributionFromNonAdmin() public {
        vm.startPrank(msg.sender);
        uint256 newDistribution = 2000;
        vm.expectRevert();
        _rankedBattleContract.setRankedNrnDistribution(newDistribution);
        assertEq(_rankedBattleContract.rankedNrnDistribution(0), 5000 * 10 ** 18);
    }

    /// @notice Test an admin setting the basis points lost per ranked match lost while in a point deficit.
    function testSetBpsLostPerLossFromAdmin() public {
        uint256 newBpsLostPerLoss = 15;
        _rankedBattleContract.setBpsLostPerLoss(newBpsLostPerLoss);
        assertEq(_rankedBattleContract.bpsLostPerLoss(), newBpsLostPerLoss);
    }

    /// @notice Test an non admin setting the basis points lost per ranked match lost while in a point deficit reverting.
    function testRevertSetBpsLostPerLossFromNonAdmin() public {
        uint256 defaultBpsLostPerLoss = _rankedBattleContract.bpsLostPerLoss();
        uint256 newBpsLostPerLoss = 15;
        vm.prank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.setBpsLostPerLoss(newBpsLostPerLoss);
        assertEq(_rankedBattleContract.bpsLostPerLoss(), defaultBpsLostPerLoss);
    }

    /// @notice Test an admin setting a new round, making claiming available for that round.
    function testSetNewRoundFromAdmin() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        _rankedBattleContract.setNewRound();
        assertEq(_rankedBattleContract.roundId(), 1);
    }

    /// @notice Test an non admin setting a new round reverting.
    function testRevertSetNewRoundFromNonAdmin() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _rankedBattleContract.setNewRound();
        assertEq(_rankedBattleContract.roundId(), 0);
    }

    /// @notice Test an admin setting a new round for a round with no accumulated points reverting.
    function testRevertSetNewRoundNoAccumulatedPoints() public {
        vm.expectRevert();
        _rankedBattleContract.setNewRound();
        assertEq(_rankedBattleContract.roundId(), 0);
    }

    /// @notice Test an account with a valid fighter and NRN balance staking.
    function testStakeNRN() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        assertEq(_neuronContract.balanceOf(staker) >= 4_000 * 10 ** 18, true);
        assertEq(_fighterFarmContract.ownerOf(0), staker);
        assertEq(_neuronContract.hasRole(keccak256("STAKER_ROLE"), address(_rankedBattleContract)), true);
        vm.prank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
    }

    /// @notice Test an account staking more than it's balance reverting.
    function testRevertStakeNRNStakeAmountExceedingBalance() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        assertEq(_neuronContract.balanceOf(staker) >= 4_000 * 10 ** 18, true);
        assertEq(_fighterFarmContract.ownerOf(0), staker);
        assertEq(_neuronContract.hasRole(keccak256("STAKER_ROLE"), address(_rankedBattleContract)), true);
        vm.prank(staker);
        vm.expectRevert("Stake amount exceeds balance");
        _rankedBattleContract.stakeNRN(5_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 0);
    }

    /// @notice Test an account staking a fighter they dont own reverting.
    function testRevertStakeNRNStakeNotOwnerOfFighter() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(_ownerAddress);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.prank(staker);
        vm.expectRevert("Caller does not own fighter");
        _rankedBattleContract.stakeNRN(5_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 0);
    }

    /// @notice Test an account staking in the same round after they already unstaked reverting.
    function testRevertStakeNRNAfterUnstakeInSameRound() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.startPrank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        _rankedBattleContract.unstakeNRN(3_000 * 10 ** 18, 0);
        vm.expectRevert("Cannot add stake after unstaking this round");
        _rankedBattleContract.stakeNRN(1_000 * 10 ** 18, 0);
    }

    /// @notice Test an account unstaking an already staked amount of NRN.
    function testUnstakeNRN() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.startPrank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        _rankedBattleContract.unstakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 0);
    }

    /// @notice Test an account unstaking with a fighter they don't own reverting.
    function testRevertUnstakeNRNNotOwnerOfFighter() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _mintFromMergingPool(_ownerAddress);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.startPrank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.expectRevert("Caller does not own fighter");
        _rankedBattleContract.unstakeNRN(3_000 * 10 ** 18, 1);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        assertEq(_rankedBattleContract.amountStaked(1), 0);
    }

    /// @notice Test an account unstaking an amount that exceeds it's balance and check if the function uses the correct amount of NRN in its balance.
    function testUnstakeNRNAmountExceedingBalance() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.startPrank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        _rankedBattleContract.unstakeNRN(4_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 0);
    }

    /// @notice Test 2 accounts staking, winning a battle, setting a new round and claiming NRN for the previous round.
    function testClaimNRN() public {
        address staker = vm.addr(3);
        _mintFromMergingPool(staker);
        _fundUserWith4kNeuronByTreasury(staker);
        vm.prank(staker);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);

        address claimee = vm.addr(4);
        _mintFromMergingPool(claimee);
        _fundUserWith4kNeuronByTreasury(claimee);
        vm.prank(claimee);
        _rankedBattleContract.stakeNRN(4_000 * 10 ** 18, 1);
        assertEq(_rankedBattleContract.amountStaked(1), 4_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        // 0 win
        // 1 tie
        // 2 loss
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(1, 20, 0, 1400, true);
        _rankedBattleContract.setNewRound();
        emit log_uint(_rankedBattleContract.accumulatedPointsPerAddress(staker, 0));
        emit log_uint(_rankedBattleContract.accumulatedPointsPerAddress(claimee, 0));
        emit log_uint(_rankedBattleContract.accumulatedPointsPerFighter(0, 0));
        emit log_uint(_rankedBattleContract.accumulatedPointsPerFighter(1, 0));
        vm.prank(staker);
        _rankedBattleContract.claimNRN(1);
        assertEq(_rankedBattleContract.amountClaimed(staker) > 0, true);
        vm.prank(claimee);
        _rankedBattleContract.claimNRN(1);
        assertEq(_rankedBattleContract.amountClaimed(claimee) > 0, true);
    }

    /// @notice Test a player staking NRN then winning a battle. After setting new round check if fighter has accumulated points for the previous roundId where they won.
    function testUpdateBattleRecordPlayerWonBattle() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        uint8 tokenId = 0;
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        _rankedBattleContract.setNewRound();
        assertEq(_rankedBattleContract.accumulatedPointsPerFighter(0, 0) > 0, true);
        (uint256 wins,,) = _rankedBattleContract.fighterBattleRecord(tokenId);
        assertEq(wins, 1);
    }

    /// @notice Test a player staking NRN. Battle result is a tie. After battle check to see the amount of battled tied is accurate.
    function testUpdateBattleRecordPlayerTiedBattle() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        uint8 tokenId = 0;
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 1, 1500, true);
        (, uint256 ties,) = _rankedBattleContract.fighterBattleRecord(tokenId);
        assertEq(ties, 1);
    }

    /// @notice Test a player staking NRN. Battle result is a loss. After battle check to see the amount of battled lossed is accurate.
    function testUpdateBattleRecordPlayerLossBattle() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        uint8 tokenId = 0;
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 2, 1500, true);
        (,, uint256 losses) = _rankedBattleContract.fighterBattleRecord(tokenId);
        assertEq(losses, 1);
    }

    /// @notice Test a player staking NRN. Battle result is a win. After battle check to see the battle record is accurate.
    function testGetBattleRecord() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        uint8 tokenId = 0;
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        (uint32 wins, uint32 ties, uint32 losses) = _rankedBattleContract.getBattleRecord(tokenId);
        assertEq(wins, 1);
        assertEq(ties, 0);
        assertEq(losses, 0);
    }

    /// @notice Test a player staking NRN. Battle result is a win. After battle check to see the battle record is accurate.
    function testGetCurrentStakingData() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        (uint256 roundId, uint256 rankedNrnDistribution, uint256 totalAccumulatedPoints) =
            _rankedBattleContract.getCurrentStakingData();
        assertEq(roundId, 0);
        assertEq(rankedNrnDistribution, 5000 * 10 ** 18);
        assertEq(totalAccumulatedPoints > 0, true);
    }

    /// @notice Test the amount of NRN distributed for a round.
    function testGetNrnDistribution() public {
        assertEq(_rankedBattleContract.getNrnDistribution(0), 5000 * 10 ** 18);
    }

    /// @notice Test the amount of unclaimed NRN for a player who has won a battle in previous rounds.
    function testgetUnclaimedNRN() public {
        address player = vm.addr(3);
        _mintFromMergingPool(player);
        uint8 tokenId = 0;
        _fundUserWith4kNeuronByTreasury(player);
        vm.prank(player);
        _rankedBattleContract.stakeNRN(3_000 * 10 ** 18, 0);
        assertEq(_rankedBattleContract.amountStaked(0), 3_000 * 10 ** 18);
        vm.prank(address(_GAME_SERVER_ADDRESS));
        _rankedBattleContract.updateBattleRecord(0, 50, 0, 1500, true);
        _rankedBattleContract.setNewRound();
        assertEq(_rankedBattleContract.accumulatedPointsPerFighter(0, 0) > 0, true);
        (uint256 wins,,) = _rankedBattleContract.fighterBattleRecord(tokenId);
        assertEq(wins, 1);
        uint256 unclaimedNRN = _rankedBattleContract.getUnclaimedNRN(player);
        assertEq(unclaimedNRN, 5000 * 10 ** 18);
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
