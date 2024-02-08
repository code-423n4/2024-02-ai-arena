// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {Neuron} from "../src/Neuron.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {GameItems} from "../src/GameItems.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract VoltageManagerTest is Test {
    /*//////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/
    uint8[][] internal _probabilities;

    address internal constant _DELEGATED_ADDRESS = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address internal constant _GAME_SERVER_ADDRESS = 0x7C0a2BAd62C664076eFE14b7f2d90BF6Fd3a6F6C;
    address internal _ownerAddress;
    address internal _treasuryAddress;
    address internal _neuronContributorAddress;

    function getProb() public {
        _probabilities.push([25, 25, 13, 13, 9, 9]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 10]);
        _probabilities.push([25, 25, 13, 13, 9, 23]);
        _probabilities.push([25, 25, 13, 13, 9, 1]);
        _probabilities.push([25, 25, 13, 13, 9, 3]);
    }

    /*//////////////////////////////////////////////////////////////
                             CONTRACT INSTANCES
    //////////////////////////////////////////////////////////////*/

    VoltageManager internal _voltageManagerContract;
    GameItems internal _gameItemsContract;
    Neuron internal _neuronContract;
    RankedBattle internal _rankedBattleContract;
    FighterFarm internal _fighterFarmContract;
    AiArenaHelper internal _helperContract;

    function setUp() public {
        _ownerAddress = address(this);
        _treasuryAddress = vm.addr(1);
        _neuronContributorAddress = vm.addr(2);
        getProb();

        _fighterFarmContract = new FighterFarm(_ownerAddress, _DELEGATED_ADDRESS, _treasuryAddress);

        _helperContract = new AiArenaHelper(_probabilities);

        _gameItemsContract = new GameItems(_ownerAddress, _treasuryAddress);

        _neuronContract = new Neuron(_ownerAddress, _treasuryAddress, _neuronContributorAddress);

        _neuronContract.addSpender(address(_gameItemsContract));

        _voltageManagerContract = new VoltageManager(_ownerAddress, address(_gameItemsContract));

        _rankedBattleContract = new RankedBattle(
            _ownerAddress, _GAME_SERVER_ADDRESS, address(_fighterFarmContract), address(_voltageManagerContract)
        );

        _fighterFarmContract.addStaker(address(_rankedBattleContract));
        _fighterFarmContract.instantiateAIArenaHelperContract(address(_helperContract));
        _fighterFarmContract.instantiateNeuronContract(address(_neuronContract));

        _voltageManagerContract.adjustAllowedVoltageSpenders(address(_rankedBattleContract), true);

        _gameItemsContract.instantiateNeuronContract(address(_neuronContract));
        _gameItemsContract.createGameItem("Battery", "https://ipfs.io/ipfs/", true, true, 10_000, 1 * 10 ** 18, 10);
        _gameItemsContract.setAllowedBurningAddresses(address(_voltageManagerContract));
    }

    /// @notice Test owner transferring ownership and new owner calling only owner functions.
    function testTransferOwnershipFromOwner() public {
        _voltageManagerContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _voltageManagerContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test transferring ownership from an none owner account failing.
    function testTransferOwnershipFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _voltageManagerContract.transferOwnership(msg.sender);
        vm.expectRevert();
        _voltageManagerContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test adjusting admin access from owner.
    function testAdjustAdminAccessFromOwner() public {
        _voltageManagerContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test adjusting admin access from a non owner account failing.
    function testAdjustAdminAccessFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _voltageManagerContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test admin calling adjustAllowedVoltageSpenders.
    function testAdjustAllowedVoltageSpendersFromAdmin() public {
        _voltageManagerContract.adjustAllowedVoltageSpenders(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.allowedVoltageSpenders(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test that only an admin can call adjustAllowedVoltageSpenders.
    function testAdjustAllowedVoltageSpendersFromNonAdmin() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _voltageManagerContract.adjustAllowedVoltageSpenders(_DELEGATED_ADDRESS, true);
        assertEq(_voltageManagerContract.allowedVoltageSpenders(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test a player using a voltage battery and checks if the voltage was updated correctly.
    function testUseVolatgeBattery() public {
        address player = vm.addr(3);
        _mintGameItemForReceiver(player);
        uint256 currentVoltage = _voltageManagerContract.ownerVoltage(player);
        emit log_uint(currentVoltage);
        vm.prank(player);
        _voltageManagerContract.useVoltageBattery();
        assertEq(_voltageManagerContract.ownerVoltage(player), 100);
    }

    /// @notice Test a player using a voltage battery then spending voltage and check if the voltage balance updated correctly.
    function testSpendVoltage() public {
        address player = _ownerAddress;
        uint256 ownerVoltageReplenishTime = _voltageManagerContract.ownerVoltageReplenishTime(player);
        uint8 voltageSpendAmount = 1;
        _mintGameItemForReceiver(player);
        uint256 currentVoltage = _voltageManagerContract.ownerVoltage(player);
        // vm.startPrank(player);
        _voltageManagerContract.useVoltageBattery();
        emit log_uint(_voltageManagerContract.ownerVoltage(player));
        emit log_uint(currentVoltage);
        emit log_uint(ownerVoltageReplenishTime);
        _voltageManagerContract.spendVoltage(player, voltageSpendAmount);
        assertEq(_voltageManagerContract.ownerVoltage(player), 100 - voltageSpendAmount);
        emit log_uint(_voltageManagerContract.ownerVoltage(player));
    }

    /// @notice Test a player using a voltage battery then spending voltage and check if the voltage balance updated correctly.
    function testSpendVoltageTriggerReplenishVoltage() public {
        address player = _ownerAddress;
        uint256 ownerVoltageReplenishTime = _voltageManagerContract.ownerVoltageReplenishTime(player);
        uint8 voltageSpendAmount = 1;
        _mintGameItemForReceiver(player);
        uint256 currentVoltage = _voltageManagerContract.ownerVoltage(player);
        // vm.startPrank(player);
        // _voltageManagerContract.useVoltageBattery();
        emit log_uint(_voltageManagerContract.ownerVoltage(player));
        emit log_uint(currentVoltage);
        emit log_uint(ownerVoltageReplenishTime);
        skip(1);
        _voltageManagerContract.spendVoltage(player, voltageSpendAmount);
        assertEq(_voltageManagerContract.ownerVoltage(player), 100 - voltageSpendAmount);
        assertEq(_voltageManagerContract.ownerVoltageReplenishTime(player), 86402);
    }

    /*//////////////////////////////////////////////////////////////
                               HELPERS
    //////////////////////////////////////////////////////////////*/

    /// @notice Test minting a game items and paying with $NRN.
    function _mintGameItemForReceiver(address receiver) internal {
        _fundUserWith4kNeuronByTreasury(receiver);
        vm.prank(receiver);
        _gameItemsContract.mint(0, 2); //paying 2 $NRN for 2 batteries
        assertEq(_gameItemsContract.balanceOf(receiver, 0) >= 2, true);
    }

    /// @notice Helper function to fund an account with 4k $NRN tokens.
    function _fundUserWith4kNeuronByTreasury(address user) internal {
        vm.prank(_treasuryAddress);
        _neuronContract.transfer(user, 4_000 * 10 ** 18);
        assertEq(4_000 * 10 ** 18 == _neuronContract.balanceOf(user), true);
    }

    function onERC1155Received(address, address, uint256, uint256, bytes memory) public pure returns (bytes4) {
        return this.onERC1155Received.selector;
    }
}
