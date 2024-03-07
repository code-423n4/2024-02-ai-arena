// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import { FighterOps } from "./FighterOps.sol";
import { Verification } from "./Verification.sol";
import { AAMintPass } from "./AAMintPass.sol";
import { AiArenaHelper } from "./AiArenaHelper.sol";
import { Neuron } from "./Neuron.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

/// @title AI Arena Fighter NFT
/// @author ArenaX Labs Inc.
/// @notice This contract manages the creation, ownership, and redemption of AI Arena Fighter NFTs,
/// including the ability to mint new NFTs from a merging pool or through the redemption of mint passes.
contract FighterFarm is ERC721, ERC721Enumerable {

    /*//////////////////////////////////////////////////////////////
                                EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Event emitted when a fighter is locked and thus cannot be traded.
    event Locked(uint256 tokenId);

    /// @notice Event emitted when a fighter is unlocked and can be traded.
    event Unlocked(uint256 tokenId);

    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice The maximum amount of fighters owned by an address.
    uint8 public constant MAX_FIGHTERS_ALLOWED = 10;

    /// @notice The maximum amount of rerolls for each fighter.
    uint8[2] public maxRerollsAllowed = [3, 3];

    /// @notice The cost ($NRN) to reroll a fighter.
    uint256 public rerollCost = 1000 * 10**18;    

    /// @notice Stores the current generation for each fighter type.
    uint8[2] public generation = [0, 0];

    /// @notice Aggregate number of training sessions recorded.
    uint32 public totalNumTrained;

    /// @notice The address of treasury.
    address public treasuryAddress;

    /// The address that has owner privileges (initially the contract deployer).
    address _ownerAddress;

    /// The address responsible for setting token URIs and signing fighter claim messages.
    address _delegatedAddress;

    /// The address of the Merging Pool contract.
    address _mergingPoolAddress;

    /// @dev Instance of the AI Arena Helper contract.
    AiArenaHelper _aiArenaHelperInstance;

    /// @dev Instance of the AI Arena Mintpass contract (ERC721).
    AAMintPass _mintpassInstance;

    /// @dev Instance of the Neuron contract (ERC20).
    Neuron _neuronInstance;

    /// @notice List of all fighter structs, accessible by using tokenId as index.
    FighterOps.Fighter[] public fighters;

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS
    //////////////////////////////////////////////////////////////*/

    /// @notice Mapping to keep track of whether a tokenId has staked or not.
    mapping(uint256 => bool) public fighterStaked;

    /// @notice Mapping to keep track of how many times an nft has been re-rolled.
    mapping(uint256 => uint8) public numRerolls;

    /// @notice Mapping to indicate which addresses are able to stake fighters.
    mapping(address => bool) public hasStakerRole;

    /// @notice Mapping of number elements by generation.
    mapping(uint8 => uint8) public numElements;

    /// @notice Maps address to fighter type to return the number of NFTs claimed.
    mapping(address => mapping(uint8 => uint8)) public nftsClaimed;

    /// @notice Mapping of tokenId to number of times trained.
    mapping(uint256 => uint32) public numTrained;

    /// @notice Mapping to keep track of tokenIds and their URI.
    mapping(uint256 => string) private _tokenURIs;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Sets the owner address, the delegated address.
    /// @param ownerAddress Address of contract deployer.
    /// @param delegatedAddress Address of delegated signer for messages.
    /// @param treasuryAddress_ Community treasury address.
    constructor(address ownerAddress, address delegatedAddress, address treasuryAddress_)
        ERC721("AI Arena Fighter", "FTR")
    {
        _ownerAddress = ownerAddress;
        _delegatedAddress = delegatedAddress;
        treasuryAddress = treasuryAddress_;
        numElements[0] = 3;
    } 

    /*//////////////////////////////////////////////////////////////
                            EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Transfers ownership from one address to another.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newOwnerAddress The address of the new owner
    function transferOwnership(address newOwnerAddress) external {
        require(msg.sender == _ownerAddress);
        _ownerAddress = newOwnerAddress;
    }

    /// @notice Increase the generation of the specified fighter type.
    /// @dev Only the owner address is authorized to call this function.
    /// @param fighterType Type of fighter either 0 or 1 (champion or dendroid).
    /// @return Generation count of the fighter type.
    function incrementGeneration(uint8 fighterType) external returns (uint8) {
        require(msg.sender == _ownerAddress);
        generation[fighterType] += 1;
        maxRerollsAllowed[fighterType] += 1;
        return generation[fighterType];
    }

    /// @notice Adds a new address that is allowed to stake fighters on behalf of users.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newStaker The address of the new staker
    function addStaker(address newStaker) external {
        require(msg.sender == _ownerAddress);
        hasStakerRole[newStaker] = true;
    }

    /// @notice Instantiates the ai arena helper contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param aiArenaHelperAddress Address of new helper contract.
    function instantiateAIArenaHelperContract(address aiArenaHelperAddress) external {
        require(msg.sender == _ownerAddress);
        _aiArenaHelperInstance = AiArenaHelper(aiArenaHelperAddress);
    }

    /// @notice Instantiates the mint pass contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param mintpassAddress The address of the new AAMintPass contract instance.
    function instantiateMintpassContract(address mintpassAddress) external {
        require(msg.sender == _ownerAddress);
        _mintpassInstance = AAMintPass(mintpassAddress);
    }

    /// @notice Instantiates the neuron contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param neuronAddress The address of the new Neuron contract instance.
    function instantiateNeuronContract(address neuronAddress) external {
        require(msg.sender == _ownerAddress);
        _neuronInstance = Neuron(neuronAddress);
    }

    /// @notice Sets the merging pool contract address.
    /// @dev Only the owner address is authorized to call this function.
    /// @param mergingPoolAddress Address of the new Merging Pool contract.
    function setMergingPoolAddress(address mergingPoolAddress) external {
        require(msg.sender == _ownerAddress);
        _mergingPoolAddress = mergingPoolAddress;
    }

    /// @notice Sets the tokenURI for the given tokenId.
    /// @dev Only the delegated address is authorized to call this function.
    /// @param tokenId The ID of the token to set the URI for.
    /// @param newTokenURI The new URI to set for the given token.
    function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {
        require(msg.sender == _delegatedAddress);
        _tokenURIs[tokenId] = newTokenURI;
    }

    /// @notice Enables users to claim a pre-determined number of fighters. 
    /// @dev The function verifies the message signature is from the delegated address.
    /// @param numToMint Array specifying the number of fighters to be claimed for each fighter type.
    /// @param signature Signature of the claim message.
    /// @param modelHashes Array of hashes representing the machine learning models for each fighter.
    /// @param modelTypes Array of machine learning model types for each fighter.
    function claimFighters(
        uint8[2] calldata numToMint,
        bytes calldata signature,
        string[] calldata modelHashes,
        string[] calldata modelTypes
    ) 
        external 
    {
        bytes32 msgHash = bytes32(keccak256(abi.encode(
            msg.sender, 
            numToMint[0], 
            numToMint[1],
            nftsClaimed[msg.sender][0],
            nftsClaimed[msg.sender][1]
        )));
        require(Verification.verify(msgHash, signature, _delegatedAddress));
        uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);
        require(modelHashes.length == totalToMint && modelTypes.length == totalToMint);
        nftsClaimed[msg.sender][0] += numToMint[0];
        nftsClaimed[msg.sender][1] += numToMint[1];
        for (uint16 i = 0; i < totalToMint; i++) {
            _createNewFighter(
                msg.sender, 
                uint256(keccak256(abi.encode(msg.sender, fighters.length))),
                modelHashes[i], 
                modelTypes[i],
                i < numToMint[0] ? 0 : 1,
                0,
                [uint256(100), uint256(100)]
            );
        }
    }

    /// @notice Burns multiple mint passes in exchange for fighter NFTs.
    /// @dev This function requires the length of all input arrays to be equal.
    /// @dev Each input array must correspond to the same index, i.e., the first element in each 
    /// array belongs to the same mint pass, and so on.
    /// @param mintpassIdsToBurn Array of mint pass IDs to be burned for each fighter to be minted.
    /// @param mintPassDnas Array of DNA strings of the mint passes to be minted as fighters.
    /// @param fighterTypes Array of fighter types corresponding to the fighters being minted.
    /// @param modelHashes Array of ML model hashes corresponding to the fighters being minted. 
    /// @param modelTypes Array of ML model types corresponding to the fighters being minted.
    function redeemMintPass(
        uint256[] calldata mintpassIdsToBurn,
        uint8[] calldata fighterTypes,
        uint8[] calldata iconsTypes,
        string[] calldata mintPassDnas,
        string[] calldata modelHashes,
        string[] calldata modelTypes
    ) 
        external 
    {
        require(
            mintpassIdsToBurn.length == mintPassDnas.length && 
            mintPassDnas.length == fighterTypes.length && 
            fighterTypes.length == modelHashes.length &&
            modelHashes.length == modelTypes.length
        );
        for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {
            require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));
            _mintpassInstance.burn(mintpassIdsToBurn[i]);
            _createNewFighter(
                msg.sender, 
                uint256(keccak256(abi.encode(mintPassDnas[i]))), 
                modelHashes[i], 
                modelTypes[i],
                fighterTypes[i],
                iconsTypes[i],
                [uint256(100), uint256(100)]
            );
        }
    }

    /// @notice Update the staking status of the fighter associated with the given token ID.
    /// @dev Only addresses which have the staker role are authorized to call this function.
    /// @param tokenId The ID of the fighter to update the staking status for.
    /// @param stakingStatus The new staking status to set for the fighter.
    function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {
        require(hasStakerRole[msg.sender]);
        fighterStaked[tokenId] = stakingStatus;
        if (stakingStatus) {
            emit Locked(tokenId);
        } else {
            emit Unlocked(tokenId);
        }
    }

    /// @notice Update the model for a token ID.
    /// @dev Only the owner of the fighter can call this function.
    /// @param tokenId The ID of the fighter to update the model for.
    /// @param modelHash The hash of the machine learning model.
    /// @param modelType The type of machine learning model.
    function updateModel(
        uint256 tokenId, 
        string calldata modelHash,
        string calldata modelType
    ) 
        external
    {
        require(msg.sender == ownerOf(tokenId));
        fighters[tokenId].modelHash = modelHash;
        fighters[tokenId].modelType = modelType;
        numTrained[tokenId] += 1;
        totalNumTrained += 1;
    }

    /// @notice Checks whether the given token ID exists.
    /// @param tokenId The ID of the fighter to check for existence.
    function doesTokenExist(uint256 tokenId) external view returns (bool) {
        return _exists(tokenId);
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Mints a new fighter from the merging pool.
    /// @dev Only the merging pool contract address is authorized to call this function.
    /// @param to The address that the new fighter will be assigned to.
    /// @param modelHash The hash of the ML model associated with the fighter.
    /// @param modelType The type of the ML model associated with the fighter.
    /// @param customAttributes Array with [element, weight] of the newly created fighter.
    function mintFromMergingPool(
        address to, 
        string calldata modelHash, 
        string calldata modelType, 
        uint256[2] calldata customAttributes
    ) 
        public 
    {
        require(msg.sender == _mergingPoolAddress);
        _createNewFighter(
            to, 
            uint256(keccak256(abi.encode(to, fighters.length))), 
            modelHash, 
            modelType,
            0,
            0,
            customAttributes
        );
    }

    /// @notice Transfer NFT ownership from one address to another.
    /// @dev Add a custom check for an ability to transfer the fighter.
    /// @param from Address of the current owner.
    /// @param to Address of the new owner.
    /// @param tokenId ID of the fighter being transferred.
    function transferFrom(
        address from, 
        address to, 
        uint256 tokenId
    ) 
        public 
        override(ERC721, IERC721)
    {
        require(_ableToTransfer(tokenId, to));
        _transfer(from, to, tokenId);
    }

    /// @notice Safely transfers an NFT from one address to another.
    /// @dev Add a custom check for an ability to transfer the fighter.
    /// @param from Address of the current owner.
    /// @param to Address of the new owner.
    /// @param tokenId ID of the fighter being transferred.
    /// @param data Additional data.
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) 
        public 
        virtual 
        override(ERC721, IERC721) 
    {
        require(_ableToTransfer(tokenId, to));
        _safeTransfer(from, to, tokenId, data);
    }

    /// @notice Rolls a new fighter with random traits.
    /// @param tokenId ID of the fighter being re-rolled.
    /// @param fighterType The fighter type.
    function reRoll(uint256 tokenId, uint8 fighterType) public {
        require(msg.sender == ownerOf(tokenId));
        require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);
        require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

        _neuronInstance.approveSpender(msg.sender, rerollCost);
        bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);
        if (success) {
            numRerolls[tokenId] += 1;
            uint256 dna = uint256(keccak256(abi.encode(msg.sender, tokenId, numRerolls[tokenId])));
            (uint256 element, uint256 weight, uint256 newDna) = _createFighterBase(dna, fighterType);
            fighters[tokenId].element = element;
            fighters[tokenId].weight = weight;
            fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
                newDna,
                generation[fighterType],
                fighters[tokenId].iconsType,
                fighters[tokenId].dendroidBool
            );
            _tokenURIs[tokenId] = "";
        }
    }    

    /// @notice Returns the URI where the contract metadata is stored.
    /// @return URI where the contract metadata is stored.
    function contractURI() public pure returns (string memory) {
        return "ipfs://bafybeifztjs4yuwhqi7bvzhw2ufksynkoiwxss2gnti6j4v25l7iwz7y44";
    }

    /// @notice Returns the URI where the token metadata is stored.
    /// @param tokenId The ID of the fighter.
    /// @return URI where the token metadata is stored.
    function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {
        return _tokenURIs[tokenId];
    }

    /// @notice Returns whether a given interface is supported by this contract.
    /// @dev Calls ERC721.supportsInterface.
    /// @param _interfaceId The interface ID.
    /// @return Bool whether the interface is supported by this contract.
    function supportsInterface(bytes4 _interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(_interfaceId);
    }

    /// @notice Returns all information related to the specified fighter token ID.
    /// @param tokenId The unique identifier for the fighter token.
    function getAllFighterInfo(
        uint256 tokenId
    )
        public
        view
        returns (
            address,
            uint256[6] memory,
            uint256,
            uint256,
            string memory,
            string memory,
            uint16
        )
    {
        return FighterOps.viewFighterInfo(fighters[tokenId], ownerOf(tokenId));
    }

    /*//////////////////////////////////////////////////////////////
                            INTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Hook that is called before a token transfer.
    /// @param from The address transferring the token.
    /// @param to The address receiving the token.
    /// @param tokenId The ID of the NFT being transferred.
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    /*//////////////////////////////////////////////////////////////
                            PRIVATE FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Creates the base attributes for the fighter.
    /// @param dna The dna of the fighter.
    /// @param fighterType The type of the fighter.
    /// @return Attributes of the new fighter: element, weight, and dna.
    function _createFighterBase(
        uint256 dna, 
        uint8 fighterType
    ) 
        private 
        view 
        returns (uint256, uint256, uint256) 
    {
        uint256 element = dna % numElements[generation[fighterType]];
        uint256 weight = dna % 31 + 65;
        uint256 newDna = fighterType == 0 ? dna : uint256(fighterType);
        return (element, weight, newDna);
    }

    /// @notice Creates a new fighter and mints an NFT to the specified address.
    /// @param to The address to mint the new NFT to.
    /// @param dna The DNA of the new fighter.
    /// @param modelHash The hash of the ML model.
    /// @param modelType The type of the ML model.
    /// @param fighterType The type of fighter to create.
    /// @param iconsType Type of icons fighter (0 means it's not an icon).
    /// @param customAttributes Array with [element, weight] of the newly created fighter.
    function _createNewFighter(
        address to, 
        uint256 dna, 
        string memory modelHash,
        string memory modelType, 
        uint8 fighterType,
        uint8 iconsType,
        uint256[2] memory customAttributes
    ) 
        private 
    {  
        require(balanceOf(to) < MAX_FIGHTERS_ALLOWED);
        uint256 element; 
        uint256 weight;
        uint256 newDna;
        if (customAttributes[0] == 100) {
            (element, weight, newDna) = _createFighterBase(dna, fighterType);
        }
        else {
            element = customAttributes[0];
            weight = customAttributes[1];
            newDna = dna;
        }
        uint256 newId = fighters.length;

        bool dendroidBool = fighterType == 1;
        FighterOps.FighterPhysicalAttributes memory attrs = _aiArenaHelperInstance.createPhysicalAttributes(
            newDna,
            generation[fighterType],
            iconsType,
            dendroidBool
        );
        fighters.push(
            FighterOps.Fighter(
                weight,
                element,
                attrs,
                newId,
                modelHash,
                modelType,
                generation[fighterType],
                iconsType,
                dendroidBool
            )
        );
        _safeMint(to, newId);
        FighterOps.fighterCreatedEmitter(newId, weight, element, generation[fighterType]);
    }

    /// @notice Check if the transfer of a specific token is allowed.
    /// @dev Cannot receive another fighter if the user already has the maximum amount.
    /// @dev Additionally, users cannot trade fighters that are currently staked.
    /// @param tokenId The token ID of the fighter being transferred.
    /// @param to The address of the receiver.
    /// @return Bool whether the transfer is allowed or not.
    function _ableToTransfer(uint256 tokenId, address to) private view returns(bool) {
        return (
          _isApprovedOrOwner(msg.sender, tokenId) &&
          balanceOf(to) < MAX_FIGHTERS_ALLOWED &&
          !fighterStaked[tokenId]
        );
    }
}
