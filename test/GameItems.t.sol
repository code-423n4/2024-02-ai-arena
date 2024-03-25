// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {GameItems} from "../src/GameItems.sol";
import {Neuron} from "../src/Neuron.sol";
import {FighterFarm} from "../src/FighterFarm.sol";
import {MergingPool} from "../src/MergingPool.sol";
import {RankedBattle} from "../src/RankedBattle.sol";
import {VoltageManager} from "../src/VoltageManager.sol";
import {AiArenaHelper} from "../src/AiArenaHelper.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract GameItemsTest is Test {
    uint8[][] internal _probabilities;

    address internal constant _DELEGATED_ADDRESS = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address internal _ownerAddress;
    address internal _treasuryAddress;
    address internal _neuronContributorAddress;

    FighterFarm internal _fighterFarmContract;
    MergingPool internal _mergingPoolContract;
    GameItems internal _gameItemsContract;
    VoltageManager internal _voltageManagerContract;
    RankedBattle internal _rankedBattleContract;
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

    function setUp() public {
        _ownerAddress = address(this);
        _treasuryAddress = vm.addr(1);
        _neuronContributorAddress = vm.addr(2);
        getProb();

        _gameItemsContract = new GameItems(_ownerAddress, _treasuryAddress);
        _neuronContract = new Neuron(_ownerAddress, _treasuryAddress, _neuronContributorAddress);

        _neuronContract.addSpender(address(_gameItemsContract));

        _voltageManagerContract = new VoltageManager(_ownerAddress, address(_gameItemsContract));

        _fighterFarmContract = new FighterFarm(_ownerAddress, _DELEGATED_ADDRESS, _treasuryAddress);
        _helperContract = new AiArenaHelper(_probabilities);

        _rankedBattleContract = new RankedBattle(
            _ownerAddress, address(_fighterFarmContract), _DELEGATED_ADDRESS, address(_voltageManagerContract)
        );

        _mergingPoolContract =
            new MergingPool(_ownerAddress, address(_rankedBattleContract), address(_fighterFarmContract));

        _gameItemsContract.instantiateNeuronContract(address(_neuronContract));
        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
        _fighterFarmContract.instantiateAIArenaHelperContract(address(_helperContract));
        _mintFromMergingPool(_ownerAddress);
        _gameItemsContract.createGameItem("Battery", "https://ipfs.io/ipfs/", true, true, 10_000, 1 * 10 ** 18, 10);
    }

    /// @notice Test owner transferring ownership and new owner calling only owner functions.
    function testTransferOwnershipFromOwner() public {
        _gameItemsContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _gameItemsContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_gameItemsContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test transferring ownership from an none owner account failing.
    function testTransferOwnershipFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.transferOwnership(msg.sender);
        vm.expectRevert();
        _gameItemsContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_gameItemsContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test adjusting admin access from owner.
    function testAdjustAdminAccessFromOwner() public {
        _gameItemsContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_gameItemsContract.isAdmin(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test adjusting admin access from a non owner account failing.
    function testAdjustAdminAccessFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.adjustAdminAccess(_DELEGATED_ADDRESS, true);
        assertEq(_gameItemsContract.isAdmin(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test adjusting an gameItems transferability from owner account.
    function testAdjustTransferabilityFromOwner() public {
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 2); //paying 2 $NRN for 2 batteries
        _gameItemsContract.adjustTransferability(0, false);
        (,, bool transferable,,,) = _gameItemsContract.allGameItemAttributes(0);
        assertEq(transferable, false);
    }

    /// @notice Test adjusting an gameItems transferability from non owner account fails.
    function testAdjustTransferabilityFromNonOwner() public {
        _fundUserWith4kNeuronByTreasury(msg.sender);
        vm.startPrank(msg.sender);
        _gameItemsContract.mint(0, 2); //paying 2 $NRN for 2 batteries
        vm.expectRevert();
        _gameItemsContract.adjustTransferability(0, false);
        (,, bool transferable,,,) = _gameItemsContract.allGameItemAttributes(0);
        assertEq(transferable, true);
    }

    /// @notice Test that only the owner can instantiate a neuron contract and fails if otherwise.
    function testInstantiateNeuronContract() public {
        _gameItemsContract.instantiateNeuronContract(address(_neuronContract));
        vm.prank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.instantiateNeuronContract(address(0));
    }

    /// @notice Test minting a game items and paying with $NRN.
    function testMintGameItem() public {
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 2); //paying 2 $NRN for 2 batteries
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 2);
    }

    /// @notice Test minting game items with insufficient $NRN balance.
    function testMintGameItemNotEnoughNRN() public {
        vm.expectRevert("Not enough NRN for purchase");
        _gameItemsContract.mint(0, 2); //paying 2 $NRN for 2 batteries
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 0);
    }

    /// @notice Test minting max allowance of game items waiting until allowance replenishes then minting again.
    function testMintGameItemsExceedAllowance() public {
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 10); //paying 10 $NRN for 10 batteries
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 10);
        vm.expectRevert();
        _gameItemsContract.mint(0, 1); //paying 1 $NRN for 1 batteries
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 10);

        uint256 dailyAllowanceReplenishTime = _gameItemsContract.dailyAllowanceReplenishTime(_ownerAddress, 0);
        skip(dailyAllowanceReplenishTime);
        // add 1 since the block.timestamp starts at 1.
        assertEq(block.timestamp, (dailyAllowanceReplenishTime + 1));
        _gameItemsContract.mint(0, 10); //paying 10 $NRN for 10 batteries.
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 20);
    }

    /// @notice Test setting allowed burning addresses from admin.
    function testSetAllowedBurningAddressesFromAdmin() public {
        _gameItemsContract.setAllowedBurningAddresses(_DELEGATED_ADDRESS);
        assertEq(_gameItemsContract.allowedBurningAddresses(_DELEGATED_ADDRESS), true);
    }

    /// @notice Test setting allowed burning addresses from non admin account failing.
    function testSetAllowedBurningAddressesFromNonAdmin() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.setAllowedBurningAddresses(_DELEGATED_ADDRESS);
        assertEq(_gameItemsContract.allowedBurningAddresses(_DELEGATED_ADDRESS), false);
    }

    /// @notice Test admin updating a game item's tokenURI.
    function testSetTokenURIFromAdmin() public {
        string memory newTokenURI = "test URI";
        _mintFromMergingPool(_ownerAddress);
        _gameItemsContract.setTokenURI(1, newTokenURI);
        assertEq(_gameItemsContract.uri(1), newTokenURI);
    }

    /// @notice Test that only an admin can update a game item's tokenURI.
    function testSetTokenURIFromNonAdmin() public {
        string memory newTokenURI = "test URI";
        string memory defaultURI = "https://ipfs.io/ipfs/";
        vm.prank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.setTokenURI(0, newTokenURI);
        assertEq(_gameItemsContract.uri(0), defaultURI);
    }

    /// @notice Test that only an admin can create game items
    function testCreateGameItemFromAdmin() public {
        _gameItemsContract.createGameItem("Battery", "https://ipfs.io/ipfs/", true, true, 10_000, 1 * 10 ** 18, 10);
        (string memory name,,,,,) = _gameItemsContract.allGameItemAttributes(0);
        assertEq(name, "Battery");
        assertEq(_gameItemsContract.remainingSupply(0), 10_000);
    }

    /// @notice Test a non admin cannot create a game item.
    function testCreateGameItemFromNonAdmin() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _gameItemsContract.createGameItem("Gloves", "https://ipfs.io/ipfs/", true, true, 10_000, 1 * 10 ** 18, 10);
        vm.expectRevert(stdError.indexOOBError);
        assertEq(_gameItemsContract.remainingSupply(1), 0);
    }

    /// @notice Tests successful item burning by a designated address authorized for burning game items.
    function testBurnFromAllowedBurningAddress() public {
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 1);
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 1);
        _gameItemsContract.setAllowedBurningAddresses(_ownerAddress);
        assertEq(_gameItemsContract.allowedBurningAddresses(_ownerAddress), true);
        _gameItemsContract.burn(_ownerAddress, 0, 1);
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 0);
    }

    /// @notice Tests unsuccessful burning of item by a non authorized address.
    function testBurnFromNonAllowedBurningAddress() public {
        vm.expectRevert();
        _gameItemsContract.burn(_ownerAddress, 0, 1);
    }

    /// @notice Test the default contract URI.
    function testContractURI() public {
        string memory defaultContractURI = "ipfs://bafybeih3witscmml3padf4qxbea5jh4rl2xp67aydqvqsxmyuzipwtpnii";
        assertEq(_gameItemsContract.contractURI(), defaultContractURI);
    }

    /// @notice Test the default gameitem URI.
    function testURI() public {
        string memory defaultURI = "https://ipfs.io/ipfs/";
        assertEq(_gameItemsContract.uri(0), defaultURI);
    }

    /// @notice Test the default and updated allowance remaining for a game item before and after minting the max allowance and waiting until the time is replenished to see if allowance reset.
    function testGetAllowanceRemaining() public {
        assertEq(_gameItemsContract.getAllowanceRemaining(_ownerAddress, 0), 10);
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 10);
        assertEq(_gameItemsContract.getAllowanceRemaining(_ownerAddress, 0), 0);
        uint256 dailyAllowanceReplenishTime = _gameItemsContract.dailyAllowanceReplenishTime(_ownerAddress, 0);
        skip(dailyAllowanceReplenishTime);
        assertEq(_gameItemsContract.getAllowanceRemaining(_ownerAddress, 0), 10);
    }

    /// @notice Test the remaining supply amount of an existing gameitem before and after burning.
    function testRemainingSupplyAfterMinting() public {
        assertEq(_gameItemsContract.remainingSupply(0), 10_000);
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 10);
        assertEq(_gameItemsContract.remainingSupply(0), 9_990);
    }

    /// @notice Test the amount of different game items outstanding and it updating after creating new gameItem.
    function testUniqueTokensOutstanding() public {
        assertEq(_gameItemsContract.uniqueTokensOutstanding(), 1);
        _gameItemsContract.createGameItem(
            "Gloves", "https://ipfs.io/ipfs/gloves", false, false, 10_000, 1 * 10 ** 18, 10
        );
        (string memory name,,,,,) = _gameItemsContract.allGameItemAttributes(1);
        assertEq(name, "Gloves");
        assertEq(_gameItemsContract.remainingSupply(1), 10_000);
        assertEq(_gameItemsContract.uniqueTokensOutstanding(), 2);
    }

    /// @notice Test minting an game item and transferring it to a different address.
    function testSafeTransferFrom() public {
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        _gameItemsContract.mint(0, 1);
        _gameItemsContract.safeTransferFrom(_ownerAddress, _DELEGATED_ADDRESS, 0, 1, "");
        assertEq(_gameItemsContract.balanceOf(_DELEGATED_ADDRESS, 0), 1);
        assertEq(_gameItemsContract.balanceOf(_ownerAddress, 0), 0);
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

    function onERC1155Received(address, address, uint256, uint256, bytes memory) public pure returns (bytes4) {
        return this.onERC1155Received.selector;
    }


    function onERC721Received(address, address, uint256, bytes memory) public pure returns (bytes4) {
        // Handle the token transfer here
        return this.onERC721Received.selector;
    }
}
