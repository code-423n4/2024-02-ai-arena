// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

/// @title Neuron
/// @author ArenaX Labs Inc.
/// @notice ERC20 token contract representing Neuron (NRN) tokens.
/// @dev The Neuron token is used for AI Arena's in-game economy.
contract Neuron is ERC20, AccessControl {

    /*//////////////////////////////////////////////////////////////
                                EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Event emitted when tokens are claimed.
    event TokensClaimed(address user, uint256 amount);

    /// @notice Event emitted when tokens are minted.
    event TokensMinted(address user, uint256 amount);    

    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice Role for minting tokens.
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    /// @notice Role for spending tokens.
    bytes32 public constant SPENDER_ROLE = keccak256("SPENDER_ROLE");
    
    /// @notice Role for staking tokens.
    bytes32 public constant STAKER_ROLE = keccak256("STAKER_ROLE");

    /// @notice Initial supply of NRN tokens to be minted to the treasury.
    uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

    /// @notice Initial supply of NRN tokens to be minted and distributed to contributors.
    uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

    /// @notice Maximum supply of NRN tokens.
    uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

    /// @notice The address of treasury.
    address public treasuryAddress;

    /// The address that has owner privileges (initially the contract deployer).
    address _ownerAddress;

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS
    //////////////////////////////////////////////////////////////*/

    /// @notice Mapping of address to admin status.
    mapping(address => bool) public isAdmin;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Grants roles to the ranked battle contract. 
    /// @notice Mints the initial supply of tokens.
    /// @param ownerAddress The address of the owner who deploys the contract
    /// @param treasuryAddress_ The address of the community treasury
    /// @param contributorAddress The address that will distribute NRNs to early contributors when 
    /// the initial supply is minted.
    constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
        ERC20("Neuron", "NRN")
    {
        _ownerAddress = ownerAddress;
        treasuryAddress = treasuryAddress_;
        isAdmin[_ownerAddress] = true;
        _mint(treasuryAddress, INITIAL_TREASURY_MINT);
        _mint(contributorAddress, INITIAL_CONTRIBUTOR_MINT);
    }

    /*//////////////////////////////////////////////////////////////
                            EXTERNAL FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Sets the treasury address.
    /// @dev Only the owner address is authorized to call this function.
    /// @param treasuryAddress_ Address of the new treasury.
    function setTreasuryAddress(address treasuryAddress_) external {
        require(msg.sender == _ownerAddress);
        treasuryAddress = treasuryAddress_;
    }

    /// @notice Transfers ownership from one address to another.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newOwnerAddress The address of the new owner
    function transferOwnership(address newOwnerAddress) external {
        require(msg.sender == _ownerAddress);
        _ownerAddress = newOwnerAddress;
    }

    /// @notice Adds a new address to the minter role.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newMinterAddress The address to be added as a minter
    function addMinter(address newMinterAddress) external {
        require(msg.sender == _ownerAddress);
        _setupRole(MINTER_ROLE, newMinterAddress);
    }

    /// @notice Adds a new address to the staker role.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newStakerAddress The address to be added as a staker
    function addStaker(address newStakerAddress) external {
        require(msg.sender == _ownerAddress);
        _setupRole(STAKER_ROLE, newStakerAddress);
    }

    /// @notice Adds a new address to the spender role.
    /// @dev Only the owner address is authorized to call this function.
    /// @param newSpenderAddress The address to be added as a spender
    function addSpender(address newSpenderAddress) external {
        require(msg.sender == _ownerAddress);
        _setupRole(SPENDER_ROLE, newSpenderAddress);
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

    /// @notice Sets up the allowance from the treasury address to transfer to each recipient address.
    /// @dev Only admins are authorized to call this function.
    /// @param recipients The array of recipient addresses
    /// @param amounts The array of corresponding amounts for each recipient
    function setupAirdrop(address[] calldata recipients, uint256[] calldata amounts) external {
        require(isAdmin[msg.sender]);
        require(recipients.length == amounts.length);
        uint256 recipientsLength = recipients.length;
        for (uint32 i = 0; i < recipientsLength; i++) {
            _approve(treasuryAddress, recipients[i], amounts[i]);
        }
    }

    /// @notice Claims the specified amount of tokens from the treasury address to the caller's address.
    /// @param amount The amount to be claimed
    function claim(uint256 amount) external {
        require(
            allowance(treasuryAddress, msg.sender) >= amount, 
            "ERC20: claim amount exceeds allowance"
        );
        transferFrom(treasuryAddress, msg.sender, amount);
        emit TokensClaimed(msg.sender, amount);
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Mints the specified amount of tokens to the given address.
    /// @dev The caller must have the minter role.
    /// @param to The address to which the tokens will be minted.
    /// @param amount The amount of tokens to be minted.
    function mint(address to, uint256 amount) public virtual {
        require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");
        require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");
        _mint(to, amount);
    }

    /// @notice Burns the specified amount of tokens from the caller's address.
    /// @param amount The amount of tokens to be burned.
    function burn(uint256 amount) public virtual {
        _burn(msg.sender, amount);
    }

    /// @notice Approves the specified amount of tokens for the spender address.
    /// @dev The caller must have the spender role.
    /// @param account The account for which to approve the allowance.
    /// @param amount The amount of tokens to be approved.
    function approveSpender(address account, uint256 amount) public {
        require(
            hasRole(SPENDER_ROLE, msg.sender), 
            "ERC20: must have spender role to approve spending"
        );
        _approve(account, msg.sender, amount);
    }

    /// @notice Approves the specified amount of tokens for the staker address.
    /// @dev The caller must have the staker role.
    /// @param owner The owner of the tokens.
    /// @param spender The address for which to approve the allowance.
    /// @param amount The amount of tokens to be approved.
    function approveStaker(address owner, address spender, uint256 amount) public {
        require(
            hasRole(STAKER_ROLE, msg.sender), 
            "ERC20: must have staker role to approve staking"
        );
        _approve(owner, spender, amount);
    }

    /// @notice Burns the specified amount of tokens from the account address.
    /// The caller must have an allowance greater than or equal to the amount.
    /// @param account The account from which to burn the tokens
    /// @param amount The amount of tokens to be burned
    function burnFrom(address account, uint256 amount) public virtual {
        require(
            allowance(account, msg.sender) >= amount, 
            "ERC20: burn amount exceeds allowance"
        );
        uint256 decreasedAllowance = allowance(account, msg.sender) - amount;
        _burn(account, amount);
        _approve(account, msg.sender, decreasedAllowance);
    }
 
}
