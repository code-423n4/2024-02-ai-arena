// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/// @title FighterOps library for managing fighters in the AI Arena game.
/// @author ArenaX Labs Inc.
/// @notice This library is used for creating and managing Fighter NFTs in the AI Arena game.
library FighterOps {

    /*//////////////////////////////////////////////////////////////
                                EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Emitted when a new Fighter NFT is created.
    event FighterCreated(
        uint256 id,
        uint256 weight,
        uint256 element,
        uint8 generation
    );
    
    /*//////////////////////////////////////////////////////////////
                                STRUCTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Struct that defines a Fighter's physical attributes.
    struct FighterPhysicalAttributes {
        uint256 head;
        uint256 eyes;
        uint256 mouth;
        uint256 body;
        uint256 hands;
        uint256 feet;
    }

    /// @notice Struct that defines a Fighter NFT.
    struct Fighter {
        uint256 weight;
        uint256 element;
        FighterPhysicalAttributes physicalAttributes;
        uint256 id;
        string modelHash;
        string modelType;
        uint8 generation;
        uint8 iconsType;
        bool dendroidBool;
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Emits a FighterCreated event.
    function fighterCreatedEmitter(
        uint256 id,
        uint256 weight,
        uint256 element,
        uint8 generation
    ) 
        public 
    {
        emit FighterCreated(id, weight, element, generation);
    }

    /// @notice Extracting the fighter attributes from the struct
    /// @param self Fighter struct
    /// @return Array of Fighter Attributes 
    function getFighterAttributes(Fighter storage self) public view returns (uint256[6] memory) {
        return [
            self.physicalAttributes.head,
            self.physicalAttributes.eyes,
            self.physicalAttributes.mouth,
            self.physicalAttributes.body,
            self.physicalAttributes.hands,
            self.physicalAttributes.feet
        ];
    }

    /// @notice Gets all of the relevant fighter information 
    function viewFighterInfo(
        Fighter storage self, 
        address owner
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
        return (
            owner,
            getFighterAttributes(self),
            self.weight,
            self.element,
            self.modelHash,
            self.modelType,
            self.generation
        );
    }
}