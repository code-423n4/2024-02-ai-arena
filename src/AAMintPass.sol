// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import { Verification } from "./Verification.sol";

/// @title AI Arena Mint Pass
/// @author ArenaX Labs Inc.
/// @notice This contract creates mint passes for those who have qualified, which are claimable 
/// for AI Arena fighters at a later date
contract AAMintPass is ERC721, ERC721Burnable {
    // The founder address is the address that deploys the smart contract
    address public founderAddress;

    // The fighterFarm address will have the ability at a future date to burn the mintpass in order
    // to mint an AI Arena fighter (at the NFT owner's discretion)
    address public fighterFarmContractAddress;

    // The delegated address is responsible for signing messages to confirm someone is able to
    // claim mint passes
    address public delegatedAddress;
    
    // Mapping to check if an address has admin rights
    mapping(address => bool) public isAdmin;

    // Mapping that returns the tokenURI for a given id
    mapping(uint256 => string) private tokenURIs;

    // Mapping that returns how many passes an address has claimed already
    mapping(address => mapping(uint8 => uint8)) public passesClaimed;

    // Boolean that dictates whether or not users are able to mint (paused means they cannot)
    bool public mintingPaused = true;

    // Number of tokens outstanding (which have not been burned)
    uint256 public numTokensOutstanding = 0;

    // Number of tokens which have been burned
    uint256 public numTokensBurned = 0;    

    /// @dev Initializes the smart contract with the founder and delegated addresses
    /// Also sets the founder as an admin by default 
    constructor(address _founderAddress, address _delegatedAddress) 
        ERC721("AI Arena Mint Pass", "AAMP") 
    {
        delegatedAddress = _delegatedAddress;
        founderAddress = _founderAddress;
        isAdmin[founderAddress] = true;
    }

    /// @dev This function gives the founder the ability to transfer ownership to another address
    /// At the time of setting a new founder address, the old founder is removed as an admin
    /// @param _newFounderAddress The new address which will have control over the smart contract
    function transferOwnership(address _newFounderAddress) external {
        require(msg.sender == founderAddress);
        isAdmin[founderAddress] = false;
        founderAddress = _newFounderAddress;
        isAdmin[_newFounderAddress] = true;
    }

    /// @notice Adds a new admin
    /// @param _newAdmin The address of the new admin
    /// @dev This function can only be called by the contract founder to add a new admin.
    function addAdmin(address _newAdmin) external {
        require(msg.sender == founderAddress);
        isAdmin[_newAdmin] = true;
    }

    /// @dev Remove existing admins from the mapping (Founder-Only)
    /// @param adminAddress An address to remove from the mapping
    function removeAdmin(address adminAddress) external {
        require(msg.sender == founderAddress);
        isAdmin[adminAddress] = false;
    }

    /// @dev Set the fighter farm address (Founder-Only)
    /// @param _fighterFarmAddress The new address to set
    function setFighterFarmAddress(address _fighterFarmAddress) external {
        require(msg.sender == founderAddress);
        fighterFarmContractAddress = _fighterFarmAddress;
    }

    /// @dev Set the delagated address (Founder-Only)
    /// @param _delegatedAddress The new address to set
    function setDelegatedAddress(address _delegatedAddress) external {
        require(msg.sender == founderAddress);
        delegatedAddress = _delegatedAddress;
    }

    /// @dev Change the 'paused' state of minting (Admin-Only)
    /// @param _state The new paused state to set
    function setPaused(bool _state) external {
        require(isAdmin[msg.sender]);
        mintingPaused = _state;
    }

    /// @notice This allows you to claim a mintpass which you have qualified for
    /// @dev Users must provide the number of mintpasses they want to claim, along with the 
    /// tokenURIs and a signature from our delegated server address. We then verify that the 
    /// server did indeed sign a message approving them to claim the amount of mint passes.
    /// We use passesClaimed as a part of the message and increment it to ensure they cannot use
    /// the same signature multiple times.
    /// @param numToMint The number of mintpasses to claim. The first element in the array is the
    /// number of AI Champion mintpasses and the second element is the number of Dendroid 
    /// mintpasses.
    /// @param signature The signature from the delegated server address
    /// @param _tokenURIs Token URIs for each of the mintpasses a user claims 
    function claimMintPass(
        uint8[2] calldata numToMint,
        bytes calldata signature,
        string[] calldata _tokenURIs
    ) 
        external 
    {
        require(!mintingPaused);
        bytes32 msgHash = bytes32(keccak256(abi.encode(
            msg.sender, 
            numToMint[0], 
            numToMint[1],
            passesClaimed[msg.sender][0],
            passesClaimed[msg.sender][1],
            _tokenURIs
        )));
        require(Verification.verify(delegatedAddress, msgHash, signature));
        uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);
        require(_tokenURIs.length == totalToMint);
        passesClaimed[msg.sender][0] += numToMint[0];
        passesClaimed[msg.sender][1] += numToMint[1];
        for (uint16 i = 0; i < totalToMint; i++) {
            createMintPass(msg.sender, _tokenURIs[i]);
        }
    }

    /// @dev Burns the NFT and alters some counters
    /// @param _tokenId The id for the NFT
    function burn(uint256 _tokenId) public override {
        require(msg.sender == fighterFarmContractAddress || msg.sender == ownerOf(_tokenId));
        numTokensBurned++;
        numTokensOutstanding--;
        super.burn(_tokenId);
    }

    /// @dev Informs the user of the total number of NFTs outstanding (non-burned)
    function totalSupply() public view returns (uint256) {
        return numTokensOutstanding;
    }

    /// @notice The contract URI
    function contractURI() public pure returns (string memory) {
        return "ipfs://bafybeifdvzwsjpxrkbyhqpz3y57j7nwm3eyyc3feqppqggslea3g5kk3jq";
    }

    /// @dev Returns the tokenURI for a given token id 
    /// @param _tokenId The id for the NFT
    function tokenURI(uint256 _tokenId) public view override(ERC721) returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
        return tokenURIs[_tokenId];
    }

    /// @dev Mints the NFT for the mintpass and sets the tokenURI, while incrementing counter
    /// @param _receiver The address receiving the mintpass
    /// @param _tokenURI The tokenURI to attach to the mintpass
    function createMintPass(address _receiver, string calldata _tokenURI) private {
        numTokensOutstanding++;
        uint256 tokenId = numTokensOutstanding + numTokensBurned;
        tokenURIs[tokenId] = _tokenURI;
        _safeMint(_receiver, tokenId);
    }
}
