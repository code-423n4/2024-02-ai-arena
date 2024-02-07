// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;
pragma solidity >=0.8.0 <0.9.0;

import { FighterOps } from "./FighterOps.sol";

/// @title AI Arena Helper
/// @author ArenaX Labs Inc.
/// @notice This contract generates and manages an AI Arena fighters physical attributes.
contract AiArenaHelper {

    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice List of attributes
    string[] public attributes = ["head", "eyes", "mouth", "body", "hands", "feet"];

    /// @notice Default DNA divisors for attributes
    uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

    /// The address that has owner privileges (initially the contract deployer).
    address _ownerAddress;

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS
    //////////////////////////////////////////////////////////////*/    
    
    /// @notice Mapping tracking fighter generation to attribute probabilities
    mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

    /// @notice Mapping of attribute to DNA divisors
    mapping(string => uint8) public attributeToDnaDivisor;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @dev Constructor to initialize the contract with the attribute probabilities for gen 0.
    /// @param probabilities An array of attribute probabilities for the generation.
    constructor(uint8[][] memory probabilities) {
        _ownerAddress = msg.sender;

        // Initialize the probabilities for each attribute
        addAttributeProbabilities(0, probabilities);

        uint256 attributesLength = attributes.length;
        for (uint8 i = 0; i < attributesLength; i++) {
            attributeProbabilities[0][attributes[i]] = probabilities[i];
            attributeToDnaDivisor[attributes[i]] = defaultAttributeDivisor[i];
        }
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

    /// @notice Add attribute divisors for attributes.
    /// @param attributeDivisors An array of attribute divisors.
    function addAttributeDivisor(uint8[] memory attributeDivisors) external {
        require(msg.sender == _ownerAddress);
        require(attributeDivisors.length == attributes.length);

        uint256 attributesLength = attributes.length;
        for (uint8 i = 0; i < attributesLength; i++) {
            attributeToDnaDivisor[attributes[i]] = attributeDivisors[i];
        }
    }    

    /// @notice Create physical attributes for a fighter based on DNA.
    /// @param dna The DNA of the fighter.
    /// @param iconsType Type of icons fighter (0 means it's not an icon).
    /// @param dendroidBool Whether the fighter is a dendroid or not
    /// @return Fighter physical attributes.
    function createPhysicalAttributes(
        uint256 dna, 
        uint8 generation, 
        uint8 iconsType, 
        bool dendroidBool
    ) 
        external 
        view 
        returns (FighterOps.FighterPhysicalAttributes memory) 
    {
        if (dendroidBool) {
            return FighterOps.FighterPhysicalAttributes(99, 99, 99, 99, 99, 99);
        } else {
            uint256[] memory finalAttributeProbabilityIndexes = new uint[](attributes.length);

            uint256 attributesLength = attributes.length;
            for (uint8 i = 0; i < attributesLength; i++) {
                if (
                  i == 0 && iconsType == 2 || // Custom icons head (beta helmet)
                  i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)
                  i == 4 && iconsType == 3 // Custom icons hands (bowling ball)
                ) {
                    finalAttributeProbabilityIndexes[i] = 50;
                } else {
                    uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;
                    uint256 attributeIndex = dnaToIndex(generation, rarityRank, attributes[i]);
                    finalAttributeProbabilityIndexes[i] = attributeIndex;
                }
            }
            return FighterOps.FighterPhysicalAttributes(
                finalAttributeProbabilityIndexes[0],
                finalAttributeProbabilityIndexes[1],
                finalAttributeProbabilityIndexes[2],
                finalAttributeProbabilityIndexes[3],
                finalAttributeProbabilityIndexes[4],
                finalAttributeProbabilityIndexes[5]
            );
        }
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

     /// @notice Add attribute probabilities for a given generation.
     /// @dev Only the owner can call this function.
     /// @param generation The generation number.
     /// @param probabilities An array of attribute probabilities for the generation.
    function addAttributeProbabilities(uint256 generation, uint8[][] memory probabilities) public {
        require(msg.sender == _ownerAddress);
        require(probabilities.length == 6, "Invalid number of attribute arrays");

        uint256 attributesLength = attributes.length;
        for (uint8 i = 0; i < attributesLength; i++) {
            attributeProbabilities[generation][attributes[i]] = probabilities[i];
        }
    }

     /// @notice Delete attribute probabilities for a given generation. 
     /// @dev Only the owner can call this function.
     /// @param generation The generation number.
    function deleteAttributeProbabilities(uint8 generation) public {
        require(msg.sender == _ownerAddress);

        uint256 attributesLength = attributes.length;
        for (uint8 i = 0; i < attributesLength; i++) {
            attributeProbabilities[generation][attributes[i]] = new uint8[](0);
        }
    }

     /// @dev Get the attribute probabilities for a given generation and attribute.
     /// @param generation The generation number.
     /// @param attribute The attribute name.
     /// @return Attribute probabilities.
    function getAttributeProbabilities(uint256 generation, string memory attribute) 
        public 
        view 
        returns (uint8[] memory) 
    {
        return attributeProbabilities[generation][attribute];
    }    

     /// @dev Convert DNA and rarity rank into an attribute probability index.
     /// @param attribute The attribute name.
     /// @param rarityRank The rarity rank.
     /// @return attributeProbabilityIndex attribute probability index.
    function dnaToIndex(uint256 generation, uint256 rarityRank, string memory attribute) 
        public 
        view 
        returns (uint256 attributeProbabilityIndex) 
    {
        uint8[] memory attrProbabilities = getAttributeProbabilities(generation, attribute);
        
        uint256 cumProb = 0;
        uint256 attrProbabilitiesLength = attrProbabilities.length;
        for (uint8 i = 0; i < attrProbabilitiesLength; i++) {
            cumProb += attrProbabilities[i];
            if (cumProb >= rarityRank) {
                attributeProbabilityIndex = i + 1;
                break;
            }
        }
        return attributeProbabilityIndex;
    }
}
