// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {AAMintPass} from "../src/AAMintPass.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract AAMintPassTest is Test, IERC721Receiver {
    AAMintPass public mintPass;
    address public constant DELEGATED_ADDRESS_1 = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;

    function setUp() public {
        mintPass = new AAMintPass(address(this), DELEGATED_ADDRESS_1);
    }

    function onERC721Received(address, address, uint256, bytes memory) public view override returns (bytes4) {
        // Handle the token transfer here
        console.log("hello onERC721Received");
        return this.onERC721Received.selector;
    }

    function testIsAdmin() public {
        assertEq(mintPass.isAdmin(address(this)), true);
        assertEq(mintPass.isAdmin(msg.sender), false);
    }

    function testSetPaused() public {
        // Non-admin should not be able to set paused
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.setPaused(true);
        assertEq(mintPass.mintingPaused(), true);

        // Admin should be able to set paused
        vm.prank(address(this));
        mintPass.addAdmin(msg.sender);
        vm.prank(msg.sender);
        mintPass.setPaused(false);
        assertEq(mintPass.mintingPaused(), false);
    }

    function testSetDelegatedAddress() public {
        // Non-founder should not be able to set delegated address
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.setDelegatedAddress(msg.sender);
        // Founder should be able to set delegated address
        vm.prank(address(this));
        mintPass.setDelegatedAddress(DELEGATED_ADDRESS_1);
        assertEq(mintPass.delegatedAddress(), DELEGATED_ADDRESS_1);
        console.log(mintPass.delegatedAddress(), "delegatedAddress");
    }

    function testTransferOwnership() public {
        // Non-founder should not be able to transfer ownership
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.transferOwnership(address(this));
        assertEq(mintPass.founderAddress(), address(this));
        // Founder should be able to transfer ownership
        vm.prank(address(this));
        mintPass.transferOwnership(msg.sender);
        assertEq(mintPass.founderAddress(), msg.sender);
    }

    function testAddAdmin() public {
        // Non-founder should not be able to add admins
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.addAdmin(msg.sender);
        assertEq(mintPass.isAdmin(msg.sender), false);

        // Founder should be able to add admins
        vm.prank(address(this));
        mintPass.addAdmin(msg.sender);
        assertEq(mintPass.isAdmin(msg.sender), true);
    }

    function testRemoveAdmin() public {
        // Non-founder should not be able to remove admins
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.removeAdmin(msg.sender);
        assertEq(mintPass.isAdmin(msg.sender), false);

        // Founder should be able to remove admins
        vm.prank(address(this));
        mintPass.removeAdmin(address(this));
        assertEq(mintPass.isAdmin(address(this)), false);
    }

    function testSetFighterFarmAddress() public {
        // Non-founder should not be able to set fighter farm address
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.setFighterFarmAddress(address(this));
        // Founder should be able to set fighter farm address
        vm.prank(address(this));
        mintPass.setFighterFarmAddress(address(this));
        assertEq(mintPass.fighterFarmContractAddress(), address(this));
    }

    function testSetDelegateAddress() public {
        // Non-founder should not be able to set fighter farm address
        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.setDelegatedAddress(address(this));
        // Founder should be able to set fighter farm address
        vm.prank(address(this));
        mintPass.setDelegatedAddress(address(this));
        assertEq(mintPass.delegatedAddress(), address(this));
    }


    function testClaimMintPass() public {
        // Non-delegated address should not be able to claim mint pass
        uint8[2] memory numToMint = [1, 0];
        bytes memory signature = abi.encodePacked(
            hex"1701723df280e897a0279d3348e7d75f00c725ff8c0b925b1346bc78f5ee576d1341f19e35a730815506edbf8c684d380a46bd38a145d8e1c5d4e721acc568fa1b"
        );
        string[] memory _tokenURIs = new string[](1);
        _tokenURIs[0] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";

        vm.prank(msg.sender);
        vm.expectRevert();
        mintPass.claimMintPass(numToMint, signature, _tokenURIs);
        // Delegated address should be able to claim mint pass
        vm.prank(address(this));
        mintPass.setPaused(false);
        assertEq(mintPass.mintingPaused(), false);
        mintPass.claimMintPass(numToMint, signature, _tokenURIs);
        assertEq(mintPass.balanceOf(address(this)), 1);
        assertEq(mintPass.tokenURI(1), _tokenURIs[0]);
        assertEq(mintPass.ownerOf(1), address(this));
        mintPass.burn(1);
        assertEq(mintPass.totalSupply() == mintPass.numTokensOutstanding(), true);
    }

    function testTotalSupply() public {
        assertEq(mintPass.totalSupply() == mintPass.numTokensOutstanding(), true);
    }
}
