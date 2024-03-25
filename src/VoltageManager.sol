// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import { GameItems } from "./GameItems.sol";

/// @title VoltageManager 
/// @author ArenaX Labs Inc.
/// @notice Manages the voltage system for AI Arena
contract VoltageManager {

    /*//////////////////////////////////////////////////////////////
                                EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Event emitted when voltage amount is altered.
    event VoltageRemaining(address spender, uint8 voltage);  

    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// The address that has owner privileges (initially the contract deployer).
    address _ownerAddress;
    
    /// @dev The game items contract instance.
    GameItems _gameItemsContractInstance;

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS
    //////////////////////////////////////////////////////////////*/

    /// @notice Maps the address to the allowed voltage spenders.
    mapping(address => bool) public allowedVoltageSpenders;

    /// @notice Maps the address to the voltage replenish time.
    mapping(address => uint32) public ownerVoltageReplenishTime;

    /// @notice Maps the address to the voltage.
    mapping(address => uint8) public ownerVoltage;

    /// @notice Mapping of address to admin status.
    mapping(address => bool) public isAdmin;

    /*//////////////////////////////////////////////////////////////
                                CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Sets the owner address and instantiates the Game Items contract.
    /// @param ownerAddress The address of the owner.
    /// @param gameItemsContractAddress The address of the game items contract.
    constructor(address ownerAddress, address gameItemsContractAddress) {
        _ownerAddress = ownerAddress;
        _gameItemsContractInstance = GameItems(gameItemsContractAddress);
        isAdmin[_ownerAddress] = true;
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

    /// @notice Adjusts admin access for a user.
    /// @dev Only the owner address is authorized to call this function.
    /// @param adminAddress The address of the admin.
    /// @param access Whether the address has admin access or not.
    function adjustAdminAccess(address adminAddress, bool access) external {
        require(msg.sender == _ownerAddress);
        require(isAdmin[adminAddress] != access, "Nothing to change");
        isAdmin[adminAddress] = access;
    }  

    /// @notice Adjusts whether a given address is allowed to spend voltage
    /// @dev Only admins are authorized to call this function.
    /// @param allowedVoltageSpender The address of the allowed voltage spender.
    /// @param allowed Whether the spender is allowed or not
    function adjustAllowedVoltageSpenders(address allowedVoltageSpender, bool allowed) external {
        require(isAdmin[msg.sender]);
        require(isAdmin[allowedVoltageSpender] != allowed, "Nothing to change");
        allowedVoltageSpenders[allowedVoltageSpender] = allowed;
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/    

    /// @notice Uses a voltage battery to replenish voltage for a player in AI Arena.
    /// @dev This function can be called by any user to use the voltage battery.
    function useVoltageBattery() public {
        require(ownerVoltage[msg.sender] < 100);
        require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);
        _gameItemsContractInstance.burn(msg.sender, 0, 1);
        ownerVoltage[msg.sender] = 100;
        emit VoltageRemaining(msg.sender, ownerVoltage[msg.sender]);
    }

    /// @notice Spends voltage.
    /// @dev This function can be called by the user or an allowed voltage spender.
    /// @param spender The address of the spender.
    /// @param voltageSpent The amount of voltage to spend.
    function spendVoltage(address spender, uint8 voltageSpent) public {
        require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);
        if (ownerVoltageReplenishTime[spender] <= block.timestamp) {
            _replenishVoltage(spender);
        }
        ownerVoltage[spender] -= voltageSpent;
        emit VoltageRemaining(spender, ownerVoltage[spender]);
    }

    /// @notice Replenishes voltage and sets the replenish time to 1 day from now
    /// @dev This function is called internally to replenish the voltage for the owner.
    /// @param owner The address of the owner
    function _replenishVoltage(address owner) private {
        ownerVoltage[owner] = 100;
        ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);
    }    
}
