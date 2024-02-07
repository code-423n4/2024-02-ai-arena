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

contract NeuronTest is Test {
    /*//////////////////////////////////////////////////////////////
                                CONSTANTS
    //////////////////////////////////////////////////////////////*/
    address internal constant _DELEGATED_ADDRESS = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address internal _ownerAddress;
    address internal _treasuryAddress;
    address internal _neuronContributorAddress;

    /*//////////////////////////////////////////////////////////////
                             CONTRACT INSTANCES
    //////////////////////////////////////////////////////////////*/
    Neuron internal _neuronContract;

    /*//////////////////////////////////////////////////////////////
                                SETUP
    //////////////////////////////////////////////////////////////*/

    function setUp() public {
        _ownerAddress = address(this);
        _treasuryAddress = vm.addr(1);
        _neuronContributorAddress = vm.addr(2);
        _neuronContract = new Neuron(_ownerAddress, _treasuryAddress, _neuronContributorAddress);
    }

    /// @notice Test owner transferring ownership and new owner calling only owner functions.
    function testTransferOwnershipFromOwner() public {
        _neuronContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _neuronContract.addMinter(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("MINTER_ROLE"), _DELEGATED_ADDRESS), true);
    }

    /// @notice Test transferring ownership from an non owner account.
    function testRevertTransferOwnershipFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _neuronContract.transferOwnership(msg.sender);
    }

    /// @notice Test owner adding MINTER_ROLE to an address.
    function testAddMinterFromOwner() public {
        _neuronContract.addMinter(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("MINTER_ROLE"), _DELEGATED_ADDRESS), true);
    }

    /// @notice Test an non owner, adding MINTER_ROLE to an address failing.
    function testRevertAddMinterFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _neuronContract.addMinter(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("MINTER_ROLE"), _DELEGATED_ADDRESS), false);
    }

    /// @notice Test owner adding STAKER_ROLE to an address.
    function testAddStakerFromOwner() public {
        _neuronContract.addStaker(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("STAKER_ROLE"), _DELEGATED_ADDRESS), true);
    }

    /// @notice Test an non owner, adding STAKER_ROLE to an address failing.
    function testRevertAddStakerFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _neuronContract.addStaker(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("STAKER_ROLE"), _DELEGATED_ADDRESS), false);
    }

    /// @notice Test owner adding SPENDER_ROLE to an address.
    function testAddSpenderFromOwner() public {
        _neuronContract.addSpender(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("SPENDER_ROLE"), _DELEGATED_ADDRESS), true);
    }

    /// @notice Test an non owner, adding SPENDER_ROLE to an address failing.
    function testRevertAddSpenderFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _neuronContract.addSpender(_DELEGATED_ADDRESS);
        assertEq(_neuronContract.hasRole(keccak256("SPENDER_ROLE"), _DELEGATED_ADDRESS), false);
    }

    /// @notice Test adjusting admin access from owner.
    function testAdjustAdminAccessFromOwner() public {
        _neuronContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_neuronContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test adjusting admin access from a non owner account failing.
    function testAdjustAdminAccessFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _neuronContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_neuronContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test admin setting up airdrop and checking if the correct allowances were set.
    function testSetupAirdropFromAdmin() public {
        address[] memory recipients = new address[](2);
        recipients[0] = vm.addr(3);
        recipients[1] = vm.addr(4);
        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 1_000 * 10 ** 18;
        amounts[1] = amounts[0];
        _neuronContract.setupAirdrop(recipients, amounts);
        uint256 firstRecipient = _neuronContract.allowance(_treasuryAddress, recipients[0]);
        uint256 secondRecipient = _neuronContract.allowance(_treasuryAddress, recipients[1]);
        assertEq(firstRecipient, amounts[0]);
        assertEq(secondRecipient, amounts[0]);
    }

    /// @notice Test a non admin setting up airdrop reverting.
    function testRevertSetupAirdropFromNonAdmin() public {
        address[] memory recipients = new address[](1);
        recipients[0] = vm.addr(3);
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 1_000 * 10 ** 18;
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _neuronContract.setupAirdrop(recipients, amounts);
        uint256 allowance = _neuronContract.allowance(_treasuryAddress, recipients[0]);
        assertEq(allowance, 0);
    }

    /// @notice Test claiming an airdrop from an account that has an valid allowance.
    function testClamAirdropAccountWithAllowance() public {
        address[] memory recipients = new address[](1);
        recipients[0] = vm.addr(3);
        uint256[] memory amounts = new uint256[](1);
        amounts[0] = 1_000 * 10 ** 18;
        _neuronContract.setupAirdrop(recipients, amounts);
        uint256 allowance = _neuronContract.allowance(_treasuryAddress, recipients[0]);
        assertEq(allowance, amounts[0]);
        vm.prank(recipients[0]);
        _neuronContract.claim(amounts[0]);
        uint256 newAllowance = _neuronContract.allowance(_treasuryAddress, recipients[0]);
        assertEq(newAllowance, 0);
        uint256 neuronBalance = _neuronContract.balanceOf(recipients[0]);
        assertEq(neuronBalance, amounts[0]);
    }

    /// @notice Test claiming an airdrop from an account with an invalid allowance.
    function testRevertClamAirdropAccountWithNoAllowance() public {
        vm.expectRevert("ERC20: claim amount exceeds allowance");
        _neuronContract.claim(1_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 0);
        assertEq(_neuronContract.allowance(_treasuryAddress, _ownerAddress), 0);
    }

    /// @notice Test owner adding a minter and minter minting 100 million tokens.
    function testMintWithMinterRole() public {
        address minter = vm.addr(3);
        _neuronContract.addMinter(minter);
        vm.prank(minter);
        _neuronContract.mint(minter, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(minter), 100_000_000 * 10 ** 18);
    }

    /// @notice Test owner without MINTER_ROLE minting 100 million tokens.
    function testRevertMintWithoutMinterRole() public {
        vm.expectRevert("ERC20: must have minter role to mint");
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 0);
    }

    /// @notice Test owner with MINTER_ROLE minting max supply reverting.
    function testRevertMintWithMinterRoleExceedsMaxSupply() public {
        uint256 maxSupply = _neuronContract.MAX_SUPPLY();
        address minter = vm.addr(3);
        _neuronContract.addMinter(minter);
        vm.prank(minter);
        vm.expectRevert("Trying to mint more than the max supply");
        _neuronContract.mint(minter, maxSupply);
    }

    /// @notice Test owner minting 100 million tokens and burning 100 million tokens.
    function testBurn() public {
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.totalSupply(), 800_000_000 * 10 ** 18);
        _neuronContract.burn(100_000_000 * 10 ** 18);
        assertEq(_neuronContract.totalSupply(), 700_000_000 * 10 ** 18);
    }

    /// @notice Test owner burning more tokens than in it's balance.
    function testRevertBurnExceedsBalance() public {
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.totalSupply(), 800_000_000 * 10 ** 18);
        vm.expectRevert("ERC20: burn amount exceeds balance");
        _neuronContract.burn(200_000_000 * 10 ** 18);
        assertEq(_neuronContract.totalSupply(), 800_000_000 * 10 ** 18);
    }

    /// @notice Test owner approving a spender over an allowance.
    function testApproveSpenderWithSpenderRole() public {
        address spender = vm.addr(3);
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        _neuronContract.addSpender(spender);
        emit log_address(_ownerAddress);
        emit log_address(spender);
        vm.prank(spender);
        _neuronContract.approveSpender(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, spender), 100_000_000 * 10 ** 18);
    }

    /// @notice Test owner approving a spender over an allowance without having the SPENDER_ROLE.
    function testRevertApproveSpenderWithoutSpenderRole() public {
        address spender = vm.addr(3);
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        vm.prank(spender);
        vm.expectRevert("ERC20: must have spender role to approve spending");
        _neuronContract.approveSpender(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, spender), 0);
    }

    /// @notice Test owner approving a staker over an amount.
    function testApproveStakeWithStakerRole() public {
        address staker = vm.addr(3);
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        _neuronContract.addStaker(staker);
        vm.prank(staker);
        _neuronContract.approveStaker(_ownerAddress, staker, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, staker), 100_000_000 * 10 ** 18);
    }

    /// @notice Test owner approving a staker over an amount without having STAKER_ROLE.
    function testRevertApproveStakeWithoutStakerRole() public {
        address staker = vm.addr(3);
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        vm.prank(staker);
        vm.expectRevert("ERC20: must have staker role to approve staking");
        _neuronContract.approveStaker(_ownerAddress, staker, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, staker), 0);
    }

    /// @notice  Test owner approving a spender over an allowance.
    function testBurnFrom() public {
        address spender = vm.addr(3);
        _neuronContract.addMinter(_ownerAddress);
        _neuronContract.mint(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 100_000_000 * 10 ** 18);
        _neuronContract.addSpender(spender);
        emit log_address(_ownerAddress);
        emit log_address(spender);
        vm.prank(spender);
        _neuronContract.approveSpender(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, spender), 100_000_000 * 10 ** 18);
        vm.prank(spender);
        _neuronContract.burnFrom(_ownerAddress, 100_000_000 * 10 ** 18);
        assertEq(_neuronContract.allowance(_ownerAddress, spender), 0);
        assertEq(_neuronContract.balanceOf(_ownerAddress), 0);
    }
}
