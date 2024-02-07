# AI Arena audit details

- Total Prize Pool: $114,500 in USDC

- HM awards: $95,250 in USDC

- Analysis awards: $2,500 in USDC

- QA awards: $1,250 in USDC

- Bot Race awards: $3,750 in USDC

- Gas awards: $1,250 in USDC

- Judge awards: $60,00 in USDC

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
- **Fighter Type**: Indicates whether its a regular Champion, Icons, or Dendroid
- **Model Data**: Comprising of the model type and model hash
  
Players are able to enter their NFT fighters into ranked battle to earn rewards in our native token *$NRN*. Our token is an ERC20 token, as defined in the `Neuron.sol` smart contract. During deployment, we grant our `RankedBattle.sol` smart contract the `MINTER` and `STAKER` roles in order to facilitate our reward system. Additionally, the `FighterFarm.sol` and `GameItems.sol` smart contracts are granted the `SPENDER` role to allow for in-game purchases with our native token.

Players are only able to earn *$NRN* in our game by staking their tokens and winning. However, it is important to note that it is possible for players to lose part of their stake if they perform poorly. Additionally, to level the playing field, we take the square root of the amount staked to calculate the `stakingFactor`, which is used in the points calculation after each ranked match. To learn more about our reward mechanism, please [click here](https://www.youtube.com/watch?v=JSaKUdcPBho).

Lastly, each wallet has **voltage** that it has to manage. Every 24 hours from the start of their first initiated match for the day, voltage will be replenished back to 100. Each ranked battle costs 10 voltage units. If a player runs out of voltage they either have to wait until it naturally replenishes or they can purchase a **battery** from our `GameItems.sol` smart contract. Each battery will fill voltage back to 100.

**NOTE**: Our core game logic runs off-chain via our servers. We essentially use our game server as the oracle for ranked match results.

  

## Links


-  **Previous audits:**

-  **Documentation:**

-  **Website:**

-  **Twitter:**

-  **Discord:**
  

# Scope

|File|SLOC|Description|Libraries|
|:-|:-:|:-|:-|
|_Contracts (8)_|
|[src/AiArenaHelper.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AAMintPass.sol)|102|This contract creates mint passes for those who have qualified, which are claimable for AI Arena fighters at a later date| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) [`@FighterOps/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterOps.sol)|
|[src/FighterFarm.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)|256|This contract manages the creation, ownership, and redemption of AI Arena Fighter NFTs, including the ability to mint new NFTs from a merging pool or through the redemption of mint passes.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) [`@FighterOps/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterOps.sol) [`@Verification/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Verification.sol)|
|[src/GameItems.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)|148|This contract represents a collection of game items used in AI Arena.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/)|
|[src/MergingPool.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)|101|This contract allows users to stake their fighters to earn rewards.| |
|[src/Neuron.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)|78|The Neuron token is used for various functions within the platform, including staking, governance, and rewards.| [`@openzeppelin/*`](https://openzeppelin.com/contracts/) |
|[src/RankedBattle.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)|270|This contract provides functionality for staking NRN tokens on fighters, tracking battle records, calculating and distributing rewards based on battle outcomes and staked amounts, and allowing claiming of accumulated rewards.| [`@FixedPointMathLib/*`](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FixedPointMathLib.sol)|
|[src/StakeAtRisk.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)|50|This contract allows the RankedBattle contract to manage the staking of NRN tokens at risk during battles.| |
|[src/VoltageManager.sol](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)|47|This contract allows the management of voltage for game items and provides functions for using and replenishing voltage. | |
  

## Out of scope
  

*List any files/contracts that are out of scope for this audit.*


# Additional Context

AAMintPass Contract: This contract creates mint passes for those who have qualified, which are claimable for AI Arena fighters at a later date.

- [ ] Describe any novel or unique curve logic or mathematical models implemented in the contracts

- [ ] Please list specific ERC20 that your protocol is anticipated to interact with. Could be "any" (literally anything, fee on transfer tokens, ERC777 tokens and so forth) or a list of tokens you envision using on launch.

- [ ] Please list specific ERC721 that your protocol is anticipated to interact with.

- [ ] Which blockchains will this code be deployed to, and are considered in scope for this audit?

- [ ] Please list all trusted roles (e.g. operators, slashers, pausers, etc.), the privileges they hold, and any conditions under which privilege escalation is expected/allowable

- [ ] In the event of a DOS, could you outline a minimum duration after which you would consider a finding to be valid? This question is asked in the context of most systems' capacity to handle DoS attacks gracefully for a certain period.

- [ ] Is any part of your implementation intended to conform to any EIP's? If yes, please list the contracts in this format:

-  `Contract1`: Should comply with `ERC/EIPX`

-  `Contract2`: Should comply with `ERC/EIPY`
  

## Attack ideas (Where to look for bugs)

*List specific areas to address - see [this blog post](https://medium.com/code4rena/the-security-council-elections-within-the-arbitrum-dao-a-comprehensive-guide-aa6d001aae60#9adb) for an example*


## Main invariants

*Describe the project's main invariants (properties that should NEVER EVER be broken).*

  
## Scoping Details

[ ⭐️ SPONSORS: please confirm/edit the information below. ]
 

```

- If you have a public code repo, please share it here:

- How many contracts are in scope?: 8

- Total SLoC for these contracts?: 1052

- How many external imports are there?: 5

- How many separate interfaces and struct definitions are there for the contracts within scope?: 4 structs

- Does most of your code generally use composition or inheritance?: Composition

- How many external calls?: 0

- What is the overall line coverage percentage provided by your tests?: 50

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

  ### Install and First Build
  
Install libraries using forge and compile contracts.

```bash
forge  install

forge  build
```
After installing and building contracts you can run this command to execute all the test scripts:

```bash
forge test
```

If you would like to execute an individual test script you could do so like this:

```bash
forge test --match-path test/AiArenaHelper.t.sol  -vvvv
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

To run [slither](https://github.com/crytic/slither) from root, run:

```bash

slither  .

```  

## Miscellaneous
  
Employees of AI Arena and employees' family members are ineligible to participate in this audit.
