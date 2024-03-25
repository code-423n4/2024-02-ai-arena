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
// import {Utilities} from "./utils/Utilities.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/// @notice Unit test for FighterFarm Contract.
contract FighterFarmTest is Test {
    // Utilities internal _utils;
    // address payable[] internal _users;
    uint256 deployerPrivateKey = vm.envUint("DELEGATED_PRIVATE_KEY_1");

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
        _fighterFarmContract.transferOwnership(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _fighterFarmContract.incrementGeneration(1);
        assertEq(_fighterFarmContract.generation(1), 1);
    }

    /// @notice Test transferring ownership from an none owner account.
    function testTransferOwnershipFromNonOwner() public {
        vm.startPrank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.transferOwnership(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.incrementGeneration(1);
        assertEq(_fighterFarmContract.generation(1), 0);
    }

    /// @notice Test increment generation from _ownerAddress.
    function testIncrementGenerationFromOwner() public {
        _fighterFarmContract.incrementGeneration(1);
        assertEq(_fighterFarmContract.generation(1), 1);
        assertEq(_fighterFarmContract.generation(0), 0);
    }

    /// @notice Test increment generation from an none owner account.
    function testIncrementGenerationFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.incrementGeneration(0);
        assertEq(_fighterFarmContract.generation(0), 0);
        assertEq(_fighterFarmContract.generation(1), 0);
    }

    /// @notice Test owner instantiating mint pass contract.
    function testInstantiateMintpassContractFromOwner() public {
        _fighterFarmContract.instantiateMintpassContract(address(_mintPassContract));
    }

    /// @notice Test that only the owner can instantiate the mintpass contract.
    function testInstantiateMintpassContractFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.instantiateMintpassContract(address(this));
    }

    /// @notice Test owner setting the mergingpool contract address.
    function testSetMergingPoolAddressFromOwner() public {
        _fighterFarmContract.setMergingPoolAddress(address(_mergingPoolContract));
    }

    /// @notice Test that only the owner can set the mergingpool contract address.
    function testSetMergingPoolAddressFromNonOwner() public {
        vm.prank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.setMergingPoolAddress(address(this));
    }

    /// @notice Test delegate updating a fighter's URI.
    function testSetTokenURIFromDelegate() public {
        string memory newTokenURI = "test URI";
        _mintFromMergingPool(_DELEGATED_ADDRESS);
        vm.prank(_DELEGATED_ADDRESS);
        _fighterFarmContract.setTokenURI(0, newTokenURI);
        assertEq(_fighterFarmContract.tokenURI(0), newTokenURI);
    }

    /// @notice Test that only the delegate can update a fighter's URI.
    function testSetTokenURIFromNonDelegate() public {
        string memory newTokenURI = "test URI";
        vm.prank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.setTokenURI(0, newTokenURI);
    }

    /// @notice Test updating a fighter's URI, ensuring correct token ownership and URI update.
    function testDelegateSetTokenURIAfterMintingFighter() public {
        string memory newTokenURI = "test URI";
        // mint a fighter nft so you can update the URI
        _mintFromMergingPool(_ownerAddress);

        vm.prank(_DELEGATED_ADDRESS);
        _fighterFarmContract.setTokenURI(0, newTokenURI);
        assertEq(_fighterFarmContract.tokenURI(0), newTokenURI);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
    }

    /// @notice Test whether the correct sender of the signature can claim a fighter.
    function testClaimFighters() public {
        uint8[2] memory numToMint = [1, 0];
        bytes memory claimSignature = abi.encodePacked(
            hex"407c44926b6805cf9755a88022102a9cb21cde80a210bc3ad1db2880f6ea16fa4e1363e7817d5d87e4e64ba29d59aedfb64524620e2180f41ff82ca9edf942d01c"
        );
        string[] memory claimModelHashes = new string[](1);
        claimModelHashes[0] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";

        string[] memory claimModelTypes = new string[](1);
        claimModelTypes[0] = "original";

        // Right sender of signature should be able to claim fighter
        _fighterFarmContract.claimFighters(numToMint, claimSignature, claimModelHashes, claimModelTypes);
        assertEq(_fighterFarmContract.balanceOf(_ownerAddress), 1);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        assertEq(_fighterFarmContract.totalSupply(), 1);
    }

    /// @notice Test claiming a fighter with a bad singature that belongs to a different account.
    function testRevertWhenClaimFightersBadSignature() public {
        // Wrong account of signature shouldn't be able to claim fighter
        uint8[2] memory numToMint = [1, 0];
        bytes memory claimSignature = abi.encodePacked(
            hex"407c44926b6805cf9755a88022102a9cb21cde80a210bc3ad1db2880f6ea16fa4e1363e7817d5d87e4e64ba29d59aedfb64524620e2180f41ff82ca9edf942d01c"
        );
        string[] memory claimModelHashes = new string[](1);
        claimModelHashes[0] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";

        string[] memory claimModelTypes = new string[](1);
        claimModelTypes[0] = "original";

        // Test case: Wrong account of signature
        vm.prank(msg.sender);
        vm.expectRevert();
        _fighterFarmContract.claimFighters(numToMint, claimSignature, claimModelHashes, claimModelTypes);
    }

    /// @notice Test staking an fighter.
    function testStakingFighter() public {
        _fighterFarmContract.addStaker(_ownerAddress);
        _fighterFarmContract.updateFighterStaking(0, true);
        assertEq(_fighterFarmContract.fighterStaked(0), true);
    }

    /// @notice Test transferring a fighter while staked.
    function testTransferringFighterWhileStakedFails() public {
        _mintFromMergingPool(_ownerAddress);
        _fighterFarmContract.addStaker(_ownerAddress);
        _fighterFarmContract.updateFighterStaking(0, true);
        assertEq(_fighterFarmContract.fighterStaked(0), true);
        // check that i'm unable to transfer since i staked
        vm.expectRevert();
        _fighterFarmContract.transferFrom(_ownerAddress, _DELEGATED_ADDRESS, 0);
        assertEq(_fighterFarmContract.ownerOf(0) != _DELEGATED_ADDRESS, true);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
    }

    /// @notice Test redeeming a mintpass for a fighter
    function testRedeemMintPass() public {
        uint8[2] memory numToMint = [1, 0];
        bytes memory signature = abi.encodePacked(
            hex"20d5c3e5c6b1457ee95bb5ba0cbf35d70789bad27d94902c67ec738d18f665d84e316edf9b23c154054c7824bba508230449ee98970d7c8b25cc07f3918369481c"
        );
        string[] memory _tokenURIs = new string[](1);
        _tokenURIs[0] = "ipfs://bafybeiaatcgqvzvz3wrjiqmz2ivcu2c5sqxgipv5w2hzy4pdlw7hfox42m";

        // first i have to mint an nft from the mintpass contract
        assertEq(_mintPassContract.mintingPaused(), false);
        _mintPassContract.claimMintPass(numToMint, signature, _tokenURIs);
        assertEq(_mintPassContract.balanceOf(_ownerAddress), 1);
        assertEq(_mintPassContract.ownerOf(1), _ownerAddress);

        // once owning one i can then redeem it for a fighter
        uint256[] memory _mintpassIdsToBurn = new uint256[](1);
        string[] memory _mintPassDNAs = new string[](1);
        uint8[] memory _fighterTypes = new uint8[](1);
        uint8[] memory _iconsTypes = new uint8[](1);
        string[] memory _neuralNetHashes = new string[](1);
        string[] memory _modelTypes = new string[](1);

        _mintpassIdsToBurn[0] = 1;
        _mintPassDNAs[0] = "dna";
        _fighterTypes[0] = 0;
        _neuralNetHashes[0] = "neuralnethash";
        _modelTypes[0] = "original";
        _iconsTypes[0] = 1;

        // approve the fighterfarm contract to burn the mintpass
        _mintPassContract.approve(address(_fighterFarmContract), 1);

        // Encode the parameters in the exact way they are expected to be hashed in your contract
        bytes32 paramsHash = keccak256(abi.encode(
            _mintpassIdsToBurn,
            _fighterTypes,
            _iconsTypes,
            _mintPassDNAs,
            _neuralNetHashes,
            _modelTypes
        ));

        // Prefix the hash as per EIP-191
        bytes32 prefixedHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", paramsHash));

        // Sign the prefixed hash
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(deployerPrivateKey, prefixedHash);
        bytes memory redeemMintPassSignature = abi.encodePacked(r, s, v);
        
        _fighterFarmContract.redeemMintPass(
            _mintpassIdsToBurn, 
            _fighterTypes, 
            _iconsTypes,
            _mintPassDNAs, 
            _neuralNetHashes,
            _modelTypes,
            redeemMintPassSignature
        );

        // check balance to see if we successfully redeemed the mintpass for a fighter
        assertEq(_fighterFarmContract.balanceOf(_ownerAddress), 1);
        // check balance to see if the mintpass was burned
        assertEq(_mintPassContract.balanceOf(_ownerAddress), 0);
    }

    /// @notice Test that the merging pool contract can mint an fighter.
    function testMintFromMergingPool() public {
        vm.prank(address(_mergingPoolContract));
        _fighterFarmContract.mintFromMergingPool(_ownerAddress, "_neuralNetHash", "original", [uint256(1), uint256(80)]);
        assertEq(_fighterFarmContract.balanceOf(_ownerAddress), 1);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
    }

    /// @notice Test that the ownerOf tokenId can update the fighter's model.
    function testUpdateModelFromTokenOwner() public {
        _mintFromMergingPool(_ownerAddress);
        if (_fighterFarmContract.ownerOf(0) == _ownerAddress) {
            uint256 tokenId = 0;
            string memory modelHash = "newModelHash";
            string memory modelType = "newModelType";
            uint32 numTrained = _fighterFarmContract.numTrained(tokenId);
            assertEq(numTrained, 0);
            _fighterFarmContract.updateModel(tokenId, modelHash, modelType);
            assertEq(_fighterFarmContract.numTrained(tokenId), 1);
        }
    }

    /// @notice Test that the non owner of tokenId cannot update the fighter's model.
    function testUpdateModelFromNonTokenOwner() public {
        _mintFromMergingPool(_ownerAddress);
        if (_fighterFarmContract.ownerOf(0) == _ownerAddress) {
            uint256 tokenId = 0;
            string memory modelHash = "newModelHash";
            string memory modelType = "newModelType";
            uint32 numTrained = _fighterFarmContract.numTrained(tokenId);
            assertEq(numTrained, 0);
            vm.prank(_DELEGATED_ADDRESS);
            vm.expectRevert();
            _fighterFarmContract.updateModel(tokenId, modelHash, modelType);
            assertEq(_fighterFarmContract.numTrained(tokenId), 0);
        }
    }

    /// @notice Test paying with neuron to reroll a fighter
    function testReroll() public {
        _mintFromMergingPool(_ownerAddress);
        // get 4k neuron from treasury
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        // after successfully minting a fighter, update the model
        if (_fighterFarmContract.ownerOf(0) == _ownerAddress) {
            uint256 neuronBalanceBeforeReRoll = _neuronContract.balanceOf(_ownerAddress);
            uint8 tokenId = 0;
            uint8 fighterType = 0;

            _neuronContract.addSpender(address(_fighterFarmContract));
            _fighterFarmContract.reRoll(tokenId, fighterType);
            assertEq(_fighterFarmContract.numRerolls(0), 1);
            assertEq(neuronBalanceBeforeReRoll > _neuronContract.balanceOf(_ownerAddress), true);
        }
    }

    /// @notice Test that the reroll fails if maxRerolls is exceeded.
    function testRerollRevertWhenLimitExceeded() public {
        _mintFromMergingPool(_ownerAddress);
        // get 4k neuron from treasury
        _fundUserWith4kNeuronByTreasury(_ownerAddress);
        // after successfully minting a fighter, update the model
        if (_fighterFarmContract.ownerOf(0) == _ownerAddress) {
            uint8 maxRerolls = _fighterFarmContract.maxRerollsAllowed(0);
            uint8 exceededLimit = maxRerolls + 1;
            uint256 neuronBalanceBeforeReRoll = _neuronContract.balanceOf(_ownerAddress);
            uint8 tokenId = 0;
            uint8 fighterType = 0;

            _neuronContract.addSpender(address(_fighterFarmContract));
            for (uint8 i = 0; i < exceededLimit; i++) {
                if (i == (maxRerolls)) {
                    vm.expectRevert();
                    _fighterFarmContract.reRoll(tokenId, fighterType);
                    assertEq(_neuronContract.balanceOf(_ownerAddress) < neuronBalanceBeforeReRoll, true);
                } else {
                    _fighterFarmContract.reRoll(tokenId, fighterType);
                }
            }
        }
    }

    /// @notice Test that tokenId exists after minting a fighter.
    function testDoesTokenExists() public {
        assertEq(_fighterFarmContract.doesTokenExist(0), false);
        _mintFromMergingPool(_ownerAddress);
        assertEq(_fighterFarmContract.doesTokenExist(0), true);
    }

    /// @notice Test safeTransferFrom after minting a fighter to a new owner.
    function testSafeTransferFrom() public {
        _mintFromMergingPool(_ownerAddress);
        assertEq(_fighterFarmContract.ownerOf(0), _ownerAddress);
        _fighterFarmContract.safeTransferFrom(_ownerAddress, _DELEGATED_ADDRESS, 0);
        assertEq(_fighterFarmContract.ownerOf(0), _DELEGATED_ADDRESS);
    }

    /// @notice Test getAllFighterInfo after minting a fighter and check if owner matches.
    function testGetAllFighterInfo() public {
        _mintFromMergingPool(_ownerAddress);
        (address owner,,,,,,) = _fighterFarmContract.getAllFighterInfo(0);
        assertEq(owner == _fighterFarmContract.ownerOf(0), true);
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
