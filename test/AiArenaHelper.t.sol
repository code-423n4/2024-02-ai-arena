// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {FighterOps} from "../src/FighterOps.sol";
import {Neuron} from "../src/Neuron.sol";
import {AAMintPass} from "../src/AAMintPass.sol";
import {MergingPool} from "../src/MergingPool.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {GameItems} from "../src/GameItems.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
// import {Utilities} from "./utils/Utilities.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/// @notice Unit test for FighterFarm Contract.
contract AiArenaHelperTest is Test {
    // Utilities internal _utils;
    // address payable[] internal _users;

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
        // _utils = new Utilities();
        // _users = _utils.createUsers(5);
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
        _helperContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _helperContract.deleteAttributeProbabilities(0);
    }

    /// @notice Test transferring ownership from an non owner account failing.
    function testTransferOwnershipFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _helperContract.transferOwnership(msg.sender);
        vm.expectRevert();
        _helperContract.deleteAttributeProbabilities(0);
    }

    /// @notice Test owner adding an attribute divisor.
    function testAddAttributeDivisorFromOwner() public {
        uint8[] memory attributeDivisors = new uint8[](6);
        attributeDivisors[0] = 99;
        attributeDivisors[1] = 3;
        attributeDivisors[2] = 13;
        attributeDivisors[3] = 13;
        attributeDivisors[4] = 9;
        attributeDivisors[5] = 1;

        _helperContract.addAttributeDivisor(attributeDivisors);
        assertEq(_helperContract.attributeToDnaDivisor("head"), 99);
    }

    /// @notice Test that only an owner can add an attribute divisor.
    function testAddAttributeDivisorFromNonOwner() public {
        vm.startPrank(msg.sender);
        uint8[] memory attributeDivisors = new uint8[](6);
        attributeDivisors[0] = 99;
        attributeDivisors[1] = 3;
        attributeDivisors[2] = 13;
        attributeDivisors[3] = 13;
        attributeDivisors[4] = 9;
        attributeDivisors[5] = 1;
        vm.expectRevert();
        _helperContract.addAttributeDivisor(attributeDivisors);
        assert(_helperContract.attributeToDnaDivisor("head") != 99);
    }

    /// @notice Test creating physical attributes for a non dendroid.
    function testCreatePhysicalAttributesNonDendroid() public {
        uint256 dna = 6;
        uint8 generation = 1;
        uint8 iconsType = 1;
        bool dendroidBool = false;
        FighterOps.FighterPhysicalAttributes memory physAttrs =
            _helperContract.createPhysicalAttributes(dna, generation, iconsType, dendroidBool);
        assertEq(physAttrs.head, 0);
    }

    /// @notice Test creating physical attributes for a non dendroid.
    function testCreatePhysicalAttributesForDendroid() public {
        uint256 dna = 6;
        uint8 generation = 0;
        uint8 iconsType = 0;
        bool dendroidBool = true;
        FighterOps.FighterPhysicalAttributes memory physAttrs =
            _helperContract.createPhysicalAttributes(dna, generation, iconsType, dendroidBool);
        assertEq(physAttrs.head, 99);
    }

    /// @notice Test owner adding attribute probabilities.
    function testAddAttributeProbabilitiesFromOwner() public {
        _helperContract.addAttributeProbabilities(0, _probabilities);
        assertEq(_helperContract.getAttributeProbabilities(0, "head")[0], 25);
    }

    /// @notice Test owner deleting attribute probabilities.
    function testDeleteAttributeProbabilitiesFromOwner() public {
        _helperContract.deleteAttributeProbabilities(0);
    }

    /// @notice Test that only the owner can delete attribute probabilities.
    function testDeleteAttributeProbabilitiesFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _helperContract.deleteAttributeProbabilities(0);
        assertEq(_helperContract.getAttributeProbabilities(0, "head")[0], 25);
    }

    /// @notice Test get attribute probabilities for the head attribute of generation 0.
    function testGetAttributeProbabilities() public {
        assertEq(_helperContract.getAttributeProbabilities(0, "head")[0], 25);
    }

    /// @notice Test getting the index of the attribute in the probabilities list.
    function testDnaToIndex() public {
        assertEq(_helperContract.dnaToIndex(0, 100, "head"), 0);
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
