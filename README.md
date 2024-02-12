# AI Arena audit details

- Total Prize Pool: $60,500 in USDC

- HM awards: $41,250 in USDC

- Analysis awards: $2,500 in USDC

- QA awards: $1,250 in USDC

- Bot Race awards: $3,750 in USDC

- Gas awards: $1,250 in USDC

- Judge awards: $6,000 in USDC

- Lookout awards: $4,000 in USDC

- Scout awards: $500 in USDC

- Join [C4 Discord](https://discord.gg/code4rena) to register

- Submit findings [using the C4 form](https://code4rena.com/contests/2024-02-ai-arena/submit)

- [Read our guidelines for more details](https://docs.code4rena.com/roles/wardens)

- Starts February 9, 2024 12:00 UTC

- Ends February 21, 2024 12:00 UTC

## Automated Findings / Publicly Known Issues

The 4naly3er report can be found [here](https://github.com/code-423n4/2024-02-ai-arena/blob/main/4naly3er-report.md).

Automated findings output for the audit can be found [here](https://github.com/code-423n4/2024-02-ai-arena/blob/main/bot-report.md) within 24 hours of audit opening.

_Note for C4 wardens: Anything included in this `Automated Findings / Publicly Known Issues` section is considered a publicly known issue and is ineligible for awards._

# Overview

AI Arena is a PvP platform fighting game where the fighters are AIs that were trained by humans. In the web3 version of our game, these fighters are tokenized via the `FighterFarm.sol` smart contract. Each fighter NFT within this smart contract contains the following:

- **Physical attributes**: Determines the visual appearance
- **Generation**: This primarily affects the visual appearance
- **Weight**: Determines the battle attributes
- **Element**: Determines its special abilities
- **Fighter Type**: Indicates whether its a regular Champion or Dendroid
- **Model Data**: Comprising of the model type and model hash
  
Players are able to enter their NFT fighters into ranked battle to earn rewards in our native token _$NRN_. Our token is an ERC20 token, as defined in the `Neuron.sol` smart contract. During deployment, we grant our `RankedBattle.sol` smart contract the `MINTER` and `STAKER` roles in order to facilitate our reward system. Additionally, the `FighterFarm.sol` and `GameItems.sol` smart contracts are granted the `SPENDER` role to allow for in-game purchases with our native token.

Players are only able to earn _$NRN_ in our game by staking their tokens and winning. However, it is important to note that it is possible for players to lose part of their stake if they perform poorly. Additionally, to level the playing field, we take the square root of the amount staked to calculate the `stakingFactor`, which is used in the points calculation after each ranked match. To learn more about our reward mechanism, please [click here](https://www.youtube.com/watch?v=JSaKUdcPBho).

Lastly, each wallet has **voltage** that it has to manage. Every 24 hours from the start of their first initiated match for the day, voltage will be replenished back to 100. Each ranked battle costs 10 voltage units. If a player runs out of voltage they either have to wait until it naturally replenishes or they can purchase a **battery** from our `GameItems.sol` smart contract. Each battery will fill voltage back to 100.

**NOTE**: Our core game logic runs off-chain via our servers. We essentially use our game server as the oracle for ranked match results.

## Links

- **Previous audits:** N/A

- **Documentation:** [Docs](https://docs.aiarena.io/gaming-competition)

- **Website:** [Website](https://aiarena.io/#/)

- **Twitter:** [Twitter](https://twitter.com/aiarena_)

- **Discord:** [Discord](https://discord.gg/aiarena)
  
# Scope

*See [scope.txt](https://github.com/code-423n4/2024-02-ai-arena/blob/main/scope.txt)*

|File|SLOC|Description|Libraries|
|:-|:-:|:-|:-|
|_Contracts (9)_|
|[src/AiArenaHelper.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)|95|This contract generates and manages an AI Arena fighters physical attributes.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) [`@FighterOps/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterOps.sol)|
|[src/FighterFarm.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)|327|This contract manages the creation, ownership, and redemption of AI Arena Fighter NFTs, including the ability to mint new NFTs from a merging pool or through the redemption of mint passes.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) [`@FighterOps/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterOps.sol) [`@Verification/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Verification.sol)|
|[src/FighterOps.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterOps.sol)|74|This library defines the Fighter struct and contains methods for fetching information about a fighter.|
|[src/GameItems.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)|163|This contract represents a collection of game items used in AI Arena.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/)|
|[src/MergingPool.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)|110|This contract allows users to potentially earn a new fighter NFT.| |
|[src/Neuron.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)|92|The Neuron token is used for various functions within the platform, including staking, governance, and rewards.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) |
|[src/RankedBattle.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)|300|This contract provides functionality for staking NRN tokens on fighters, tracking battle records, calculating and distributing rewards based on battle outcomes and staked amounts, and allowing claiming of accumulated rewards.| [`@FixedPointMathLib/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FixedPointMathLib.sol)|
|[src/StakeAtRisk.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)|63|This contract allows the RankedBattle contract to manage the staking of NRN tokens at risk during battles.| |
|[src/VoltageManager.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)|47|This contract allows the management of voltage for game items and provides functions for using and replenishing voltage. | |
  
## Out of scope
  
- All of the [OpenZepplin](https://github.com/OpenZeppelin) contracts (used for `ERC20`, `ERC721`, `ERC1155`) used as the base for our smart contracts
- The `FixedPointMathLib.sol` library created by [solmate](https://github.com/transmissions11/solmate/tree/main)
- The `Verification.sol` library
- The `AAMintPass.sol` smart contract since it is already deployed and completed minting
  
# Additional Context

- `AAMintPass.sol`: This contract creates mint passes for those who have qualified, which are claimable for AI Arena fighters at a later date. In order for a player to redeem their mint pass for a fighter, they will call the `redeemMintPass` function in `FighterFarm.sol`, which burns their mint pass and creates a fighter NFT.
- The result of a ranked battle can result in one of the following (depending on their current state):
  - `$NRN staked == 0` **(Condition)**
    - No impact on points or stake
  - `$NRN staked > 0` **(Condition)**
    - Win **(Condition)**
      - `stake at risk > 0` **(Condition)**
        - Reclaim stake at risk for this round
      - `stake at risk == 0` **(Condition)**
        - Increase points
    - Lose **(Condition)**
      - `points > 0` **(Condition)**
        - Decrease points
      - `points == 0` **(Condition)**
        - Move some of staked _$NRN_ to the `StakeAtRisk.sol` smart contract
- The calculation for points is comprised of a `stakingFactor` and `eloFactor`.
  - The staking factor is derived from the amount of _$NRN_ a player has staked
  - The ELO factor is derived from the fighter's ELO scored
    - We maintain the flexibility to adjust how the ELO score is calculated off-chain
- Players are able to divert part of their points to the `MergingPool.sol` smart contract. This contract will periodically raffle off new NFTs to be minted. The amount of NFTs to be minted through the Merging Pool will be managed in a way that keeps NFT inflation relatively low.
- At the end of each round, we will distribute a fixed amount of _$NRN_ between players proportional to the relative amount of points they have amassed.
  - For example, let's say there are two players: A and B. Player A earned 500 points and player B earned 1500 points. If we were to distribute 1000 NRN for that round, then player A would receive 250 NRN and player B would receive 750 NRN.
- **NOTE**: The asymmetry in point increase/decrease as well as _$NRNs_ gained vs potentially lost is an intentional design in our economy.

## Scoping Details

```

- If you have a public code repo, please share it here:

- How many contracts are in scope?: 8

- Total SLoC for these contracts?: 1271

- How many external imports are there?: 5

- How many separate interfaces and struct definitions are there for the contracts within scope?: 4 structs

- Does most of your code generally use composition or inheritance?: Composition

- How many external calls?: 0

- What is the overall line coverage percentage provided by your tests?: 90

- Is this an upgrade of an existing system?: False

- Check all that apply (e.g. timelock, NFT, AMM, ERC20, rollups, etc.): NFT, ERC-20 Token, Uses L2

- Is there a need to understand a separate part of the codebase / get context in order to audit this part of the protocol?: True - We have a deployed mintpass that will be redeemed for a fighter NFT. It could be important to read through the mintpass smart contract code. Additionally, to understand the ranked battle points system, material will be required to understand the flow.

- Please describe required context: We have a deployed mintpass that will be redeemed for a fighter NFT. It could be important to read through the mintpass smart contract code. Additionally, to understand the ranked battle points system, material will be required to understand the flow.

- Does it use an oracle?: Others - Our game server acts as an oracle to put battle results on-chain

- Describe any novel or unique curve logic or mathematical models your code uses: Our points system for determining distribution of our ERC20 token at the end of each round uses a combination of ELO factor, staking factor, and % of points to be allocated to the merging pool

- Is this either a fork of or an alternate implementation of another project?: False

- Does it use a side-chain?:

- Describe any specific areas you would like addressed:

```

# Tests

## Setup

Clone with recurse:

```bash
git clone --recurse https://github.com/code-423n4/2024-02-ai-arena.git
```

Alternatively, if you have already cloned without recurse, do:

```bash
git submodule update --init --recursive
```

Install libraries using forge and compile contracts.

```bash
forge install

forge build
```

After installing and building contracts you can run this command to execute all the test scripts:

```bash
forge test
```

If you would like to execute an individual test script you could do so like this:

```bash
forge test --match-path test/AiArenaHelper.t.sol -vvvv
```

To print the gas report of contracts simply run:

```bash
forge test --gas-report
```

See code coverage by running this command:

```bash
forge coverage --ir-minimum
```

## Slither

*See [slither.txt](https://github.com/code-423n4/2024-02-ai-arena/blob/main/slither.txt)*

To run [slither](https://github.com/crytic/slither) from root, run:

```bash

slither .

```  

To generate or view graphs of contracts, refer here: [printer-docs](https://github.com/crytic/slither/wiki/Printer-documentation)

Here's and example of outputting a graph showing the inheritance interaction between the FighterFarm contract.

```bash

slither src/FighterFarm.sol --print inheritance-graph 

```  

Then run this command to view the graph:

```bash

xdot src/FighterFarm.sol.inheritance-graph.dot 

```  

# Miscellaneous
  
Employees of AI Arena and employees' family members are ineligible to participate in this audit.
