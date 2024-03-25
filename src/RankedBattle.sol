// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import { FighterFarm } from "./FighterFarm.sol";
import { VoltageManager } from "./VoltageManager.sol";
import { MergingPool } from "./MergingPool.sol";
import { Neuron } from "./Neuron.sol";
import { StakeAtRisk } from "./StakeAtRisk.sol";
import { FixedPointMathLib } from './FixedPointMathLib.sol';

/// @title RankedBattle
/// @author ArenaX Labs Inc.
/// @notice This contract provides functionality for staking NRN tokens on fighters, 
/// tracking battle records, calculating and distributing rewards based on battle outcomes 
/// and staked amounts, and allowing claiming of accumulated rewards.
contract RankedBattle {

    /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.
    using FixedPointMathLib for uint;

    /*//////////////////////////////////////////////////////////////
                                EVENTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Event emitted when staked.
    event Staked(address from, uint256 amount);

    /// @notice Event emitted when unstaked.
    event Unstaked(address from, uint256 amount);

    /// @notice Event emitted when claimed.
    event Claimed(address claimer, uint256 amount);

    /// @notice Event emitted when points are added or subtracted from a fighter.
    event PointsChanged(uint256 tokenId, uint256 points, bool increased);    

    /*//////////////////////////////////////////////////////////////
                                STRUCTS
    //////////////////////////////////////////////////////////////*/

    /// @notice Struct for battle record.
    struct BattleRecord {
        uint32 wins;
        uint32 ties;
        uint32 loses;
    }

    /*//////////////////////////////////////////////////////////////
                            STATE VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice Voltage cost per match initiated
    uint8 public constant VOLTAGE_COST = 10;

    /// @notice Number of total battles.
    uint256 public totalBattles = 0;

    /// @notice Number of overall staked amount.
    uint256 public globalStakedAmount = 0;

    /// @notice Current round number.
    uint256 public roundId = 0;

    /// @notice Amount of basis points that get taken away from a player's stake when they lose in 
    /// a point deficit.
    uint256 public bpsLostPerLoss = 10;

    /// The StakeAtRisk contract address.
    address _stakeAtRiskAddress;

    /// The address that has owner privileges (initially the contract deployer).
    address _ownerAddress;

    /// @notice The address in charge of updating battle records.
    address _gameServerAddress;

    /*//////////////////////////////////////////////////////////////
                            CONTRACT INSTANCES
    //////////////////////////////////////////////////////////////*/ 

    /// @notice The neuron contract instance.
    Neuron _neuronInstance;

    /// @notice The fighter farm contract instance.
    FighterFarm _fighterFarmInstance;

    /// @notice The voltage manager contract instance.
    VoltageManager _voltageManagerInstance;

    /// @notice The merging pool contract instance.
    MergingPool _mergingPoolInstance;

    /// @notice The stake at risk contract instance.
    StakeAtRisk _stakeAtRiskInstance;

    /*//////////////////////////////////////////////////////////////
                                MAPPINGS
    //////////////////////////////////////////////////////////////*/

    /// @notice Maps addresses that are admins.
    mapping(address => bool) public isAdmin;

    /// @notice Mapping of token id to battle record struct.
    mapping(uint256 => BattleRecord) public fighterBattleRecord;

    /// @notice Mapping of address to the amount of NRNs they have claimed.
    mapping(address => uint256) public amountClaimed;

    /// @notice Maps the user address to the number of rounds they've claimed for
    mapping(address => uint32) public numRoundsClaimed;

    /// @notice Maps address to round ID to track accumulated points.
    mapping(address => mapping(uint256 => uint256)) public accumulatedPointsPerAddress;

    /// @notice Maps token ID to round ID to track accumulated points.
    mapping(uint256 => mapping(uint256 => uint256)) public accumulatedPointsPerFighter;

    /// @notice Maps round ID to total accumulated points.
    mapping(uint256 => uint256) public totalAccumulatedPoints;

    /// @notice Mapping of roundID to nrn distribution amount for a ranked period.
    mapping(uint256 => uint256) public rankedNrnDistribution;

    /// @notice Maps the token ID to the round ID and indicates whether it is Unstaked or not.
    mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

    /// @notice Mapping of token id to staked amount.
    mapping(uint256 => uint256) public amountStaked;

    /// @notice Mapping of token id to staking factor.
    mapping(uint256 => uint256) public stakingFactor;

    /// @notice Indicates whether we have calculated the staking factor for a given round and token.
    mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

    /// @notice Maps token ID to round ID to starting address.
    mapping(uint256 => mapping(uint256 => address)) public addressStartedRound;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    /// @notice Initializes the contract by setting various addresses and instantiating 
    /// contract instances. It also designates the owner address as an admin. 
    /// @param ownerAddress Address of contract deployer.
    /// @param gameServerAddress The game server address.
    /// @param fighterFarmAddress Address of the FighterFarm contract.
    /// @param voltageManagerAddress Address of the VoltageManager contract.
    constructor(
      address ownerAddress, 
      address gameServerAddress,
      address fighterFarmAddress,
      address voltageManagerAddress
    ) {
        _ownerAddress = ownerAddress;
        _gameServerAddress = gameServerAddress;
        _fighterFarmInstance = FighterFarm(fighterFarmAddress);
        _voltageManagerInstance = VoltageManager(voltageManagerAddress);
        isAdmin[_ownerAddress] = true;
        rankedNrnDistribution[0] = 5000 * 10**18;
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
        isAdmin[adminAddress] = access;
    }  

    /// @notice Sets the game server address.
    /// @dev Only the owner address is authorized to call this function.
    /// @param gameServerAddress The game server address.
    function setGameServerAddress(address gameServerAddress) external {
        require(msg.sender == _ownerAddress);
        _gameServerAddress = gameServerAddress;
    }

    /// @notice Sets the Stake at Risk contract address and instantiates the contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param stakeAtRiskAddress The address of the Stake At Risk contract.
    function setStakeAtRiskAddress(address stakeAtRiskAddress) external {
        require(msg.sender == _ownerAddress);
        _stakeAtRiskAddress = stakeAtRiskAddress;
        _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);
    }

    /// @notice Instantiates the neuron contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param nrnAddress The address of the Neuron contract.
    function instantiateNeuronContract(address nrnAddress) external {
        require(msg.sender == _ownerAddress);
        _neuronInstance = Neuron(nrnAddress);
    }

    /// @notice Instantiates the merging pool contract.
    /// @dev Only the owner address is authorized to call this function.
    /// @param mergingPoolAddress The address of the MergingPool contract.
    function instantiateMergingPoolContract(address mergingPoolAddress) external {
        require(msg.sender == _ownerAddress);
        _mergingPoolInstance = MergingPool(mergingPoolAddress);
    }

    /// @notice Sets the ranked nrn distribution amount for the current round.
    /// @dev Only admins are authorized to change the ranked NRN distribution.
    /// @dev newDistribution is NOT denominated in wei. As such, it is multiplied by 10**18.
    /// @param newDistribution The new distribution amount.
    function setRankedNrnDistribution(uint256 newDistribution) external {
        require(isAdmin[msg.sender]);
        rankedNrnDistribution[roundId] = newDistribution * 10**18;
    }

    /// @notice Sets the basis points lost per ranked match lost while in a point deficit.
    /// @dev Only admins are authorized to call this function.
    /// @param bpsLostPerLoss_ The basis points lost per loss.
    function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {
        require(isAdmin[msg.sender]);
        bpsLostPerLoss = bpsLostPerLoss_;
    }

    /// @notice Sets a new round, making claiming available for that round.
    /// @dev Only admins are authorized to move the round forward.
    function setNewRound() external {
        require(isAdmin[msg.sender]);
        require(totalAccumulatedPoints[roundId] > 0);
        roundId += 1;
        _stakeAtRiskInstance.setNewRound(roundId);
        rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];
    }

    /// @notice Stakes NRN tokens.
    /// @param amount The amount of NRN tokens to stake.
    /// @param tokenId The ID of the fighter to stake.
    function stakeNRN(uint256 amount, uint256 tokenId) external {
        require(amount > 0, "Amount cannot be 0");
        require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
        require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");
        require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

        _neuronInstance.approveStaker(msg.sender, address(this), amount);
        bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);
        if (success) {
            if (amountStaked[tokenId] == 0) {
                _fighterFarmInstance.updateFighterStaking(tokenId, true);
            }
            amountStaked[tokenId] += amount;
            globalStakedAmount += amount;
            stakingFactor[tokenId] = _getStakingFactor(
                tokenId, 
                _stakeAtRiskInstance.getStakeAtRisk(tokenId)
            );
            _calculatedStakingFactor[tokenId][roundId] = true;
            emit Staked(msg.sender, amount);
        }
    }

    /// @notice Unstakes NRN tokens.
    /// @param amount The amount of NRN tokens to unstake.
    /// @param tokenId The ID of the token to unstake.
    function unstakeNRN(uint256 amount, uint256 tokenId) external {
        require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
        if (amount > amountStaked[tokenId]) {
            amount = amountStaked[tokenId];
        }
        amountStaked[tokenId] -= amount;
        globalStakedAmount -= amount;
        stakingFactor[tokenId] = _getStakingFactor(
            tokenId, 
            _stakeAtRiskInstance.getStakeAtRisk(tokenId)
        );
        _calculatedStakingFactor[tokenId][roundId] = true;
        hasUnstaked[tokenId][roundId] = true;
        bool success = _neuronInstance.transfer(msg.sender, amount);
        if (success) {
            if (amountStaked[tokenId] == 0) {
                _fighterFarmInstance.updateFighterStaking(tokenId, false);
            }
            emit Unstaked(msg.sender, amount);
        }
    }

    /// @notice Claims NRN tokens for the specified rounds.
    /// @dev Caller can only claim once per round.
    function claimNRN(uint32 totalRoundsToConsider) external {
        require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");
        uint256 claimableNRN = 0;
        uint256 nrnDistribution;
        uint32 lowerBound = numRoundsClaimed[msg.sender];
        require(lowerBound + totalRoundsToConsider < roundId, "RankedBattle: totalRoundsToConsider exceeds the limit");
        for (uint32 currentRound = lowerBound; currentRound < lowerBound + totalRoundsToConsider; currentRound++) {
            nrnDistribution = getNrnDistribution(currentRound);
            claimableNRN += (
                accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   
            ) / totalAccumulatedPoints[currentRound];
            numRoundsClaimed[msg.sender] += 1;
        }
        if (claimableNRN > 0) {
            amountClaimed[msg.sender] += claimableNRN;
            _neuronInstance.mint(msg.sender, claimableNRN);
            emit Claimed(msg.sender, claimableNRN);
        }
    }

    /// @notice Updates the battle record for a fighter.
    /// @dev Only the game server address is authorized to update the battle record.
    /// @dev Only the fighter that initiates the battle expends voltage on the match.
    /// @dev Only fighters that have NRN staked are able to earn points.
    /// @param tokenId The ID of the fighter.
    /// @param mergingPortion The portion of points that get redirected to the merging pool.
    /// @param battleResult The result of the battle.
    /// @param eloFactor Multiple derived from ELO to be applied to the base points earned.
    /// @param initiatorBool Whether this was the fighter that initiated the battle or not
    function updateBattleRecord(
        uint256 tokenId, 
        uint256 mergingPortion,
        uint8 battleResult,
        uint256 eloFactor,
        bool initiatorBool
    ) 
        external 
    {   
        require(msg.sender == _gameServerAddress);
        require(mergingPortion <= 100);
        address fighterOwner = _fighterFarmInstance.ownerOf(tokenId);
        require(
            !initiatorBool ||
            _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 
            _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST
        );

        if (addressStartedRound[tokenId][roundId] == address(0)) {
          addressStartedRound[tokenId][roundId] = fighterOwner;
        }
        else {
          require(addressStartedRound[tokenId][roundId] == fighterOwner);
        }

        _updateRecord(tokenId, battleResult);
        uint256 stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);
        if (amountStaked[tokenId] + stakeAtRisk > 0) {
            _addResultPoints(battleResult, tokenId, eloFactor, mergingPortion, fighterOwner);
        }
        if (initiatorBool) {
            _voltageManagerInstance.spendVoltage(fighterOwner, VOLTAGE_COST);
        }
        totalBattles += 1;
    }

    /// @notice Gets the battle record for a token.
    /// @param tokenId The ID of the token.
    /// @return Record which is comprised of wins, ties, and losses for the token.
    function getBattleRecord(uint256 tokenId) external view returns(uint32, uint32, uint32) {
      return (
          fighterBattleRecord[tokenId].wins, 
          fighterBattleRecord[tokenId].ties, 
          fighterBattleRecord[tokenId].loses
      );
    }

    /// @notice Gets the staking data for a token.
    /// @return Round id, nrns to be distributed, and total point tally
    function getCurrentStakingData() external view returns(uint256, uint256, uint256) {
      return (
          roundId,
          rankedNrnDistribution[roundId], 
          totalAccumulatedPoints[roundId]
      );
    }

    /*//////////////////////////////////////////////////////////////
                            PUBLIC FUNCTIONS
    //////////////////////////////////////////////////////////////*/    

    /// @notice Retrieves the nrn distribution amount for the given round ID.
    /// @param roundId_ The round ID for which to get the nrn distribution.
    /// @return Distribution amount for the specified round ID.
    function getNrnDistribution(uint256 roundId_) public view returns(uint256) {
        return rankedNrnDistribution[roundId_];
    }

    /// @notice Gets the unclaimed NRN tokens for a specific address.
    /// @param claimer The address of the claimer.
    /// @return The amount of unclaimed NRN tokens.
    function getUnclaimedNRN(address claimer) public view returns(uint256) {
        uint256 claimableNRN = 0;
        uint256 nrnDistribution;   
        uint32 lowerBound = numRoundsClaimed[claimer];
        for (uint32 i = lowerBound; i < roundId; i++) {
            nrnDistribution = getNrnDistribution(i);
            claimableNRN += (
                accumulatedPointsPerAddress[claimer][i] * nrnDistribution
            ) / totalAccumulatedPoints[i];
        }
        return claimableNRN;
    } 

    /*//////////////////////////////////////////////////////////////
                            PRIVATE FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice Adds result points for a battle, based on the battle result, ELO factor, and merging portion.
    /// @dev This function is called internally and is not accessible externally.
    /// @dev There are 5 scenarios to be aware of:
    /// @dev 1) Win + no stake-at-risk = Increase points balance
    /// @dev 2) Win + stake-at-risk = Reclaim some of the stake that is at risk
    /// @dev 3) Lose + positive point balance = Deduct from the point balance
    /// @dev 4) Lose + no points = Move some of their NRN staked to the Stake At Risk contract
    /// @dev 5) Tie = no consequence
    /// @param battleResult The result of the battle (0: win, 1: tie, 2: loss).
    /// @param tokenId The ID of the token participating in the battle.
    /// @param eloFactor Multiple derived from ELO to be applied to the base points earned.
    /// @param mergingPortion The portion of points that get redirected to the merging pool.
    /// @param fighterOwner The address which owns the fighter whos points are being altered.
    function _addResultPoints(
        uint8 battleResult, 
        uint256 tokenId, 
        uint256 eloFactor, 
        uint256 mergingPortion,
        address fighterOwner
    ) 
        private 
    {
        uint256 stakeAtRisk;
        uint256 curStakeAtRisk;
        uint256 points = 0;

        /// Check how many NRNs the fighter has at risk
        stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

        /// Calculate the staking factor if it has not already been calculated for this round 
        if (_calculatedStakingFactor[tokenId][roundId] == false) {
            stakingFactor[tokenId] = _getStakingFactor(tokenId, stakeAtRisk);
            _calculatedStakingFactor[tokenId][roundId] = true;
        }

        /// Potential amount of NRNs to put at risk or retrieve from the stake-at-risk contract
        curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;
        if (battleResult == 0) {
            /// If the user won the match

            /// If the user has no NRNs at risk, then they can earn points
            if (stakeAtRisk == 0) {
                points = stakingFactor[tokenId] * eloFactor;
            }

            /// Divert a portion of the points to the merging pool
            uint256 mergingPoints = (points * mergingPortion) / 100;
            points -= mergingPoints;
            _mergingPoolInstance.addPoints(tokenId, mergingPoints);

            /// Do not allow users to reclaim more NRNs than they have at risk
            if (curStakeAtRisk > stakeAtRisk) {
                curStakeAtRisk = stakeAtRisk;
            }

            /// If the user has stake-at-risk for their fighter, reclaim a portion
            /// Reclaiming stake-at-risk puts the NRN back into their staking pool
            if (curStakeAtRisk > 0) {
                _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);
                amountStaked[tokenId] += curStakeAtRisk;
            }

            /// Add points to the fighter for this round
            accumulatedPointsPerFighter[tokenId][roundId] += points;
            accumulatedPointsPerAddress[fighterOwner][roundId] += points;
            totalAccumulatedPoints[roundId] += points;
            if (points > 0) {
                emit PointsChanged(tokenId, points, true);
            }
        } else if (battleResult == 2) {
            /// If the user lost the match

            /// Do not allow users to lose more NRNs than they have in their staking pool
            if (curStakeAtRisk > amountStaked[tokenId]) {
                curStakeAtRisk = amountStaked[tokenId];
            }
            if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {
                /// If the fighter has a positive point balance for this round, deduct points 
                points = stakingFactor[tokenId] * eloFactor;
                if (points > accumulatedPointsPerFighter[tokenId][roundId]) {
                    points = accumulatedPointsPerFighter[tokenId][roundId];
                }
                accumulatedPointsPerFighter[tokenId][roundId] -= points;
                accumulatedPointsPerAddress[fighterOwner][roundId] -= points;
                totalAccumulatedPoints[roundId] -= points;
                if (points > 0) {
                    emit PointsChanged(tokenId, points, false);
                }
            } else {
                /// If the fighter does not have any points for this round, NRNs become at risk of being lost
                bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);
                if (success) {
                    _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);
                    amountStaked[tokenId] -= curStakeAtRisk;
                }
            }
        }
    }

    /// @notice Updates the battle record for a token.
    /// @param tokenId The ID of the token.
    /// @param battleResult The result of the battle.
    function _updateRecord(uint256 tokenId, uint8 battleResult) private {
        if (battleResult == 0) {
            fighterBattleRecord[tokenId].wins += 1;
        } else if (battleResult == 1) {
            fighterBattleRecord[tokenId].ties += 1;
        } else if (battleResult == 2) {
            fighterBattleRecord[tokenId].loses += 1;
        }
    }

    /// @notice Gets the staking factor for a token.
    /// @param tokenId The ID of the token.
    /// @param stakeAtRisk The amount of stake they have at risk.
    /// @return Staking factor.
    function _getStakingFactor(
        uint256 tokenId, 
        uint256 stakeAtRisk
    ) 
        private 
        view 
        returns (uint256) 
    {
      uint256 stakingFactor_ = FixedPointMathLib.sqrt(
          (amountStaked[tokenId] + stakeAtRisk) / 10**18
      );
      if (stakingFactor_ == 0) {
        stakingFactor_ = 1;
      }
      return stakingFactor_;
    }    
}