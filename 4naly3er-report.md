# Report

- [Report](#report)
  - [Gas Optimizations](#gas-optimizations)
    - [\[GAS-1\] Using bools for storage incurs overhead](#gas-1-using-bools-for-storage-incurs-overhead)
    - [\[GAS-2\] Cache array length outside of loop](#gas-2-cache-array-length-outside-of-loop)
    - [\[GAS-3\] State variables should be cached in stack variables rather than re-reading them from storage](#gas-3-state-variables-should-be-cached-in-stack-variables-rather-than-re-reading-them-from-storage)
    - [\[GAS-4\] Use calldata instead of memory for function arguments that do not get mutated](#gas-4-use-calldata-instead-of-memory-for-function-arguments-that-do-not-get-mutated)
    - [\[GAS-5\] For Operations that will not overflow, you could use unchecked](#gas-5-for-operations-that-will-not-overflow-you-could-use-unchecked)
    - [\[GAS-6\] Use Custom Errors](#gas-6-use-custom-errors)
    - [\[GAS-7\] Don't initialize variables with default value](#gas-7-dont-initialize-variables-with-default-value)
    - [\[GAS-8\] Long revert strings](#gas-8-long-revert-strings)
    - [\[GAS-9\] `++i` costs less gas than `i++`, especially when it's used in `for`-loops (`--i`/`i--` too)](#gas-9-i-costs-less-gas-than-i-especially-when-its-used-in-for-loops---ii---too)
    - [\[GAS-10\] Using `private` rather than `public` for constants, saves gas](#gas-10-using-private-rather-than-public-for-constants-saves-gas)
    - [\[GAS-11\] Splitting require() statements that use \&\& saves gas](#gas-11-splitting-require-statements-that-use--saves-gas)
    - [\[GAS-12\] Use != 0 instead of \> 0 for unsigned integer comparison](#gas-12-use--0-instead-of--0-for-unsigned-integer-comparison)
  - [Non Critical Issues](#non-critical-issues)
    - [\[NC-1\] Missing checks for `address(0)` when assigning values to address state variables](#nc-1-missing-checks-for-address0-when-assigning-values-to-address-state-variables)
    - [\[NC-2\] Array indices should be referenced via `enum`s rather than via numeric literals](#nc-2-array-indices-should-be-referenced-via-enums-rather-than-via-numeric-literals)
    - [\[NC-3\]  `require()` / `revert()` statements should have descriptive reason strings](#nc-3--requirerevertstatements-should-have-descriptive-reason-strings)
    - [\[NC-4\] Return values of `approve()` not checked](#nc-4-return-values-of-approve-not-checked)
    - [\[NC-5\] Event is missing `indexed` fields](#nc-5-event-is-missing-indexed-fields)
    - [\[NC-6\] Constants should be defined rather than using magic numbers](#nc-6-constants-should-be-defined-rather-than-using-magic-numbers)
    - [\[NC-7\] Functions not used internally could be marked external](#nc-7-functions-not-used-internally-could-be-marked-external)
  - [Low Issues](#low-issues)
    - [\[L-1\] Do not use deprecated library functions](#l-1-do-not-use-deprecated-library-functions)
    - [\[L-2\] Unsafe ERC20 operation(s)](#l-2-unsafe-erc20-operations)
    - [\[L-3\] Unspecific compiler version pragma](#l-3-unspecific-compiler-version-pragma)
  - [Medium Issues](#medium-issues)
    - [\[M-1\] Centralization Risk for trusted owners](#m-1-centralization-risk-for-trusted-owners)
      - [Impact](#impact)

## Gas Optimizations

| |Issue|Instances|
|-|:-|:-:|
| [GAS-1](#GAS-1) | Using bools for storage incurs overhead | 12 |
| [GAS-2](#GAS-2) | Cache array length outside of loop | 1 |
| [GAS-3](#GAS-3) | State variables should be cached in stack variables rather than re-reading them from storage | 3 |
| [GAS-4](#GAS-4) | Use calldata instead of memory for function arguments that do not get mutated | 9 |
| [GAS-5](#GAS-5) | For Operations that will not overflow, you could use unchecked | 186 |
| [GAS-6](#GAS-6) | Use Custom Errors | 17 |
| [GAS-7](#GAS-7) | Don't initialize variables with default value | 26 |
| [GAS-8](#GAS-8) | Long revert strings | 8 |
| [GAS-9](#GAS-9) | `++i` costs less gas than `i++`, especially when it's used in `for`-loops (`--i`/`i--` too) | 17 |
| [GAS-10](#GAS-10) | Using `private` rather than `public` for constants, saves gas | 8 |
| [GAS-11](#GAS-11) | Splitting require() statements that use && saves gas | 1 |
| [GAS-12](#GAS-12) | Use != 0 instead of > 0 for unsigned integer comparison | 28 |

### <a name="GAS-1"></a>[GAS-1] Using bools for storage incurs overhead

Use uint256(1) and uint256(2) for true/false to avoid a Gwarmaccess (100 gas), and to avoid Gsset (20000 gas) when changing from ‘false’ to ‘true’, after having been ‘true’ in the past. See [source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27).

*Instances (12)*:

```solidity
File: src/FighterFarm.sol

76:     mapping(uint256 => bool) public fighterStaked;

82:     mapping(address => bool) public hasStakerRole;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

80:     mapping(address => bool) public allowedBurningAddresses;

83:     mapping(address => bool) public isAdmin;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

57:     mapping(uint256 => bool) public isSelectionComplete;

60:     mapping(address => bool) public isAdmin;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

56:     mapping(address => bool) public isAdmin;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

101:     mapping(address => bool) public isAdmin;

125:     mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

134:     mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/VoltageManager.sol

33:     mapping(address => bool) public allowedVoltageSpenders;

42:     mapping(address => bool) public isAdmin;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

### <a name="GAS-2"></a>[GAS-2] Cache array length outside of loop

If not cached, the solidity compiler will always read the length of the array during each iteration. That is, if it is a storage array, this is an extra sload operation (100 additional extra gas for each iteration except for the first) and if it is a memory array, this is an extra mload operation (3 additional gas for each iteration except for the first).

*Instances (1)*:

```solidity
File: src/FighterFarm.sol

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

### <a name="GAS-3"></a>[GAS-3] State variables should be cached in stack variables rather than re-reading them from storage

The instances below point to the second+ access of a state variable within a function. Caching of a state variable replaces each Gwarmaccess (100 gas) with a much cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*Saves 100 gas per instance*

*Instances (3)*:

```solidity
File: src/FighterFarm.sol

376:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

233:         setTokenURI(_itemCount, tokenURI);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/Neuron.sol

143:         transferFrom(treasuryAddress, msg.sender, amount);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

### <a name="GAS-4"></a>[GAS-4] Use calldata instead of memory for function arguments that do not get mutated

Mark data types as `calldata` instead of `memory` where possible. This makes it so that the data is not automatically loaded into memory. If the data passed into the function does not need to be changed (like updating values in an array), it can be passed in as `calldata`. The one exception to this is if the argument must later be passed into another function that takes an argument that specifies `memory` storage.

*Instances (9)*:

```solidity
File: src/AiArenaHelper.sol

41:     constructor(uint8[][] memory probabilities) {

68:     function addAttributeDivisor(uint8[] memory attributeDivisors) external {

131:     function addAttributeProbabilities(uint256 generation, uint8[][] memory probabilities) public {

157:     function getAttributeProbabilities(uint256 generation, string memory attribute) 

169:     function dnaToIndex(uint256 generation, uint256 rarityRank, string memory attribute) 

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/GameItems.sol

194:     function setTokenURI(uint256 tokenId, string memory _tokenURI) public {

209:         string memory name_,

210:         string memory tokenURI,

296:         bytes memory data

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

### <a name="GAS-5"></a>[GAS-5] For Operations that will not overflow, you could use unchecked

*Instances (186)*:

```solidity
File: src/AiArenaHelper.sol

5: import { FighterOps } from "./FighterOps.sol";

48:         for (uint8 i = 0; i < attributesLength; i++) {

48:         for (uint8 i = 0; i < attributesLength; i++) {

73:         for (uint8 i = 0; i < attributesLength; i++) {

73:         for (uint8 i = 0; i < attributesLength; i++) {

99:             for (uint8 i = 0; i < attributesLength; i++) {

99:             for (uint8 i = 0; i < attributesLength; i++) {

101:                   i == 0 && iconsType == 2 || // Custom icons head (beta helmet)

101:                   i == 0 && iconsType == 2 || // Custom icons head (beta helmet)

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

103:                   i == 4 && iconsType == 3 // Custom icons hands (bowling ball)

103:                   i == 4 && iconsType == 3 // Custom icons hands (bowling ball)

107:                     uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;

136:         for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

179:             cumProb += attrProbabilities[i];

181:                 attributeProbabilityIndex = i + 1;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

4: import { FighterOps } from "./FighterOps.sol";

5: import { Verification } from "./Verification.sol";

6: import { AAMintPass } from "./AAMintPass.sol";

7: import { AiArenaHelper } from "./AiArenaHelper.sol";

8: import { Neuron } from "./Neuron.sol";

9: import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

9: import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

9: import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

9: import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

10: import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

10: import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

10: import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

10: import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

10: import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

39:     uint256 public rerollCost = 1000 * 10**18;    

39:     uint256 public rerollCost = 1000 * 10**18;    

39:     uint256 public rerollCost = 1000 * 10**18;    

131:         generation[fighterType] += 1;

132:         maxRerollsAllowed[fighterType] += 1;

207:         uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);

209:         nftsClaimed[msg.sender][0] += numToMint[0];

210:         nftsClaimed[msg.sender][1] += numToMint[1];

211:         for (uint16 i = 0; i < totalToMint; i++) {

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

293:         numTrained[tokenId] += 1;

294:         totalNumTrained += 1;

378:             numRerolls[tokenId] += 1;

396:         return "ipfs://bafybeifztjs4yuwhqi7bvzhw2ufksynkoiwxss2gnti6j4v25l7iwz7y44";

396:         return "ipfs://bafybeifztjs4yuwhqi7bvzhw2ufksynkoiwxss2gnti6j4v25l7iwz7y44";

471:         uint256 weight = dna % 31 + 65;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

4: import { Neuron } from "./Neuron.sol";

5: import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

5: import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

5: import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

5: import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

95:     constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

95:     constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

95:     constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

95:     constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

149:         uint256 price = allGameItemAttributes[tokenId].itemPrice * quantity;

169:             allowanceRemaining[msg.sender][tokenId] -= quantity;

171:                 allGameItemAttributes[tokenId].itemsRemaining -= quantity;

234:         _itemCount += 1;

250:         return "ipfs://bafybeih3witscmml3padf4qxbea5jh4rl2xp67aydqvqsxmyuzipwtpnii";

250:         return "ipfs://bafybeih3witscmml3padf4qxbea5jh4rl2xp67aydqvqsxmyuzipwtpnii";

314:         dailyAllowanceReplenishTime[msg.sender][tokenId] = uint32(block.timestamp + 1 days);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

4: import { FighterFarm } from "./FighterFarm.sol";

124:         for (uint256 i = 0; i < winnersLength; i++) {

124:         for (uint256 i = 0; i < winnersLength; i++) {

126:             totalPoints -= fighterPoints[winners[i]];

131:         roundId += 1;

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

150:             numRoundsClaimed[msg.sender] += 1;

152:             for (uint32 j = 0; j < winnersLength; j++) {

152:             for (uint32 j = 0; j < winnersLength; j++) {

160:                     claimIndex += 1;

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

180:                     numRewards += 1;

197:         fighterPoints[tokenId] += points;

198:         totalPoints += points;

207:         for (uint256 i = 0; i < maxId; i++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

4: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

4: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

4: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

4: import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

5: import "@openzeppelin/contracts/access/AccessControl.sol";

5: import "@openzeppelin/contracts/access/AccessControl.sol";

5: import "@openzeppelin/contracts/access/AccessControl.sol";

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

131:         for (uint32 i = 0; i < recipientsLength; i++) {

131:         for (uint32 i = 0; i < recipientsLength; i++) {

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

201:         uint256 decreasedAllowance = allowance(account, msg.sender) - amount;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

4: import { FighterFarm } from "./FighterFarm.sol";

5: import { VoltageManager } from "./VoltageManager.sol";

6: import { MergingPool } from "./MergingPool.sol";

7: import { Neuron } from "./Neuron.sol";

8: import { StakeAtRisk } from "./StakeAtRisk.sol";

9: import { FixedPointMathLib } from './FixedPointMathLib.sol';

157:         rankedNrnDistribution[0] = 5000 * 10**18;

157:         rankedNrnDistribution[0] = 5000 * 10**18;

157:         rankedNrnDistribution[0] = 5000 * 10**18;

220:         rankedNrnDistribution[roundId] = newDistribution * 10**18;

220:         rankedNrnDistribution[roundId] = newDistribution * 10**18;

220:         rankedNrnDistribution[roundId] = newDistribution * 10**18;

236:         roundId += 1;

238:         rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];

256:             amountStaked[tokenId] += amount;

257:             globalStakedAmount += amount;

275:         amountStaked[tokenId] -= amount;

276:         globalStakedAmount -= amount;

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

301:             claimableNRN += (

302:                 accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   

303:             ) / totalAccumulatedPoints[currentRound];

304:             numRoundsClaimed[msg.sender] += 1;

307:             amountClaimed[msg.sender] += claimableNRN;

342:         if (amountStaked[tokenId] + stakeAtRisk > 0) {

348:         totalBattles += 1;

390:         for (uint32 i = lowerBound; i < roundId; i++) {

390:         for (uint32 i = lowerBound; i < roundId; i++) {

392:             claimableNRN += (

393:                 accumulatedPointsPerAddress[claimer][i] * nrnDistribution

394:             ) / totalAccumulatedPoints[i];

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

445:                 points = stakingFactor[tokenId] * eloFactor;

449:             uint256 mergingPoints = (points * mergingPortion) / 100;

449:             uint256 mergingPoints = (points * mergingPortion) / 100;

450:             points -= mergingPoints;

462:                 amountStaked[tokenId] += curStakeAtRisk;

466:             accumulatedPointsPerFighter[tokenId][roundId] += points;

467:             accumulatedPointsPerAddress[fighterOwner][roundId] += points;

468:             totalAccumulatedPoints[roundId] += points;

481:                 points = stakingFactor[tokenId] * eloFactor;

485:                 accumulatedPointsPerFighter[tokenId][roundId] -= points;

486:                 accumulatedPointsPerAddress[fighterOwner][roundId] -= points;

487:                 totalAccumulatedPoints[roundId] -= points;

496:                     amountStaked[tokenId] -= curStakeAtRisk;

507:             fighterBattleRecord[tokenId].wins += 1;

509:             fighterBattleRecord[tokenId].ties += 1;

511:             fighterBattleRecord[tokenId].loses += 1;

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

4: import { Neuron } from "./Neuron.sol";

5: import { RankedBattle } from "./RankedBattle.sol";

102:             stakeAtRisk[roundId][fighterId] -= nrnToReclaim;

103:             totalStakeAtRisk[roundId] -= nrnToReclaim;

104:             amountLost[fighterOwner] -= nrnToReclaim;

123:         stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;

124:         totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;

125:         amountLost[fighterOwner] += nrnToPlaceAtRisk;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

```solidity
File: src/VoltageManager.sol

4: import { GameItems } from "./GameItems.sol";

110:         ownerVoltage[spender] -= voltageSpent;

119:         ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

### <a name="GAS-6"></a>[GAS-6] Use Custom Errors

[Source](https://blog.soliditylang.org/2021/04/21/custom-errors/)
Instead of using error strings, to reduce deployment and runtime cost, you should use Custom Errors. This would save both deployment and runtime cost.

*Instances (17)*:

```solidity
File: src/AiArenaHelper.sol

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

120:         require(winners.length == winnersPerPeriod, "Incorrect number of winners");

121:         require(!isSelectionComplete[roundId], "Winners are already selected");

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

157:         require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

245:         require(amount > 0, "Amount cannot be 0");

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

248:         require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

79:         require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");

94:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

### <a name="GAS-7"></a>[GAS-7] Don't initialize variables with default value

*Instances (26)*:

```solidity
File: src/AiArenaHelper.sol

48:         for (uint8 i = 0; i < attributesLength; i++) {

73:         for (uint8 i = 0; i < attributesLength; i++) {

99:             for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

176:         uint256 cumProb = 0;

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

64:     uint256 _itemCount = 0;    

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

29:     uint256 public roundId = 0;

32:     uint256 public totalPoints = 0;    

124:         for (uint256 i = 0; i < winnersLength; i++) {

147:         uint32 claimIndex = 0;

152:             for (uint32 j = 0; j < winnersLength; j++) {

174:         uint256 numRewards = 0;

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

56:     uint256 public totalBattles = 0;

59:     uint256 public globalStakedAmount = 0;

62:     uint256 public roundId = 0;

296:         uint256 claimableNRN = 0;

387:         uint256 claimableNRN = 0;

427:         uint256 points = 0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

27:     uint256 public roundId = 0;    

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

### <a name="GAS-8"></a>[GAS-8] Long revert strings

*Instances (8)*:

```solidity
File: src/AiArenaHelper.sol

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/MergingPool.sol

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

157:         require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

248:         require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

94:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

### <a name="GAS-9"></a>[GAS-9] `++i` costs less gas than `i++`, especially when it's used in `for`-loops (`--i`/`i--` too)

*Saves 5 gas per loop*

*Instances (17)*:

```solidity
File: src/AiArenaHelper.sol

48:         for (uint8 i = 0; i < attributesLength; i++) {

73:         for (uint8 i = 0; i < attributesLength; i++) {

99:             for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/MergingPool.sol

124:         for (uint256 i = 0; i < winnersLength; i++) {

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:             for (uint32 j = 0; j < winnersLength; j++) {

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

390:         for (uint32 i = lowerBound; i < roundId; i++) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

### <a name="GAS-10"></a>[GAS-10] Using `private` rather than `public` for constants, saves gas

If needed, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*Instances (8)*:

```solidity
File: src/FighterFarm.sol

33:     uint8 public constant MAX_FIGHTERS_ALLOWED = 10;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/Neuron.sol

28:     bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

31:     bytes32 public constant SPENDER_ROLE = keccak256("SPENDER_ROLE");

34:     bytes32 public constant STAKER_ROLE = keccak256("STAKER_ROLE");

37:     uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

40:     uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

43:     uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

53:     uint8 public constant VOLTAGE_COST = 10;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

### <a name="GAS-11"></a>[GAS-11] Splitting require() statements that use && saves gas

*Instances (1)*:

```solidity
File: src/FighterFarm.sol

208:         require(modelHashes.length == totalToMint && modelTypes.length == totalToMint);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

### <a name="GAS-12"></a>[GAS-12] Use != 0 instead of > 0 for unsigned integer comparison

*Instances (28)*:

```solidity
File: src/AiArenaHelper.sol

3: pragma solidity >=0.8.0 <0.9.0;

3: pragma solidity >=0.8.0 <0.9.0;

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

258:         if (bytes(customURI).length > 0) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

164:         if (claimIndex > 0) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

235:         require(totalAccumulatedPoints[roundId] > 0);

245:         require(amount > 0, "Amount cannot be 0");

306:         if (claimableNRN > 0) {

342:         if (amountStaked[tokenId] + stakeAtRisk > 0) {

460:             if (curStakeAtRisk > 0) {

469:             if (points > 0) {

479:             if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {

488:                 if (points > 0) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

```solidity
File: src/VoltageManager.sol

2: pragma solidity >=0.8.0 <0.9.0;

2: pragma solidity >=0.8.0 <0.9.0;

95:         require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

## Non Critical Issues

| |Issue|Instances|
|-|:-|:-:|
| [NC-1](#NC-1) | Missing checks for `address(0)` when assigning values to address state variables | 24 |
| [NC-2](#NC-2) | Array indices should be referenced via `enum`s rather than via numeric literals | 23 |
| [NC-3](#NC-3) |  `require()` / `revert()` statements should have descriptive reason strings | 67 |
| [NC-4](#NC-4) | Return values of `approve()` not checked | 4 |
| [NC-5](#NC-5) | Event is missing `indexed` fields | 16 |
| [NC-6](#NC-6) | Constants should be defined rather than using magic numbers | 1 |
| [NC-7](#NC-7) | Functions not used internally could be marked external | 25 |

### <a name="NC-1"></a>[NC-1] Missing checks for `address(0)` when assigning values to address state variables

*Instances (24)*:

```solidity
File: src/AiArenaHelper.sol

63:         _ownerAddress = newOwnerAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

107:         _ownerAddress = ownerAddress;

108:         _delegatedAddress = delegatedAddress;

109:         treasuryAddress = treasuryAddress_;

122:         _ownerAddress = newOwnerAddress;

173:         _mergingPoolAddress = mergingPoolAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

96:         _ownerAddress = ownerAddress;

97:         treasuryAddress = treasuryAddress_;

110:         _ownerAddress = newOwnerAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

76:         _ownerAddress = ownerAddress;

77:         _rankedBattleAddress = rankedBattleAddress;

91:         _ownerAddress = newOwnerAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

71:         _ownerAddress = ownerAddress;

72:         treasuryAddress = treasuryAddress_;

87:         _ownerAddress = newOwnerAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

152:         _ownerAddress = ownerAddress;

153:         _gameServerAddress = gameServerAddress;

169:         _ownerAddress = newOwnerAddress;

186:         _gameServerAddress = gameServerAddress;

194:         _stakeAtRiskAddress = stakeAtRiskAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

65:         treasuryAddress = treasuryAddress_;

66:         _rankedBattleAddress = rankedBattleAddress;   

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

```solidity
File: src/VoltageManager.sol

52:         _ownerAddress = ownerAddress;

66:         _ownerAddress = newOwnerAddress;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

### <a name="NC-2"></a>[NC-2] Array indices should be referenced via `enum`s rather than via numeric literals

*Instances (23)*:

```solidity
File: src/AiArenaHelper.sol

49:             attributeProbabilities[0][attributes[i]] = probabilities[i];

113:                 finalAttributeProbabilityIndexes[0],

114:                 finalAttributeProbabilityIndexes[1],

115:                 finalAttributeProbabilityIndexes[2],

116:                 finalAttributeProbabilityIndexes[3],

117:                 finalAttributeProbabilityIndexes[4],

118:                 finalAttributeProbabilityIndexes[5]

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

110:         numElements[0] = 3;

201:             numToMint[0], 

202:             numToMint[1],

203:             nftsClaimed[msg.sender][0],

204:             nftsClaimed[msg.sender][1]

207:         uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);

207:         uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);

209:         nftsClaimed[msg.sender][0] += numToMint[0];

209:         nftsClaimed[msg.sender][0] += numToMint[0];

210:         nftsClaimed[msg.sender][1] += numToMint[1];

210:         nftsClaimed[msg.sender][1] += numToMint[1];

217:                 i < numToMint[0] ? 0 : 1,

499:         if (customAttributes[0] == 100) {

503:             element = customAttributes[0];

504:             weight = customAttributes[1];

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/RankedBattle.sol

157:         rankedNrnDistribution[0] = 5000 * 10**18;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

### <a name="NC-3"></a>[NC-3]  `require()` / `revert()` statements should have descriptive reason strings

*Instances (67)*:

```solidity
File: src/AiArenaHelper.sol

62:         require(msg.sender == _ownerAddress);

69:         require(msg.sender == _ownerAddress);

70:         require(attributeDivisors.length == attributes.length);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

121:         require(msg.sender == _ownerAddress);

130:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

148:         require(msg.sender == _ownerAddress);

156:         require(msg.sender == _ownerAddress);

164:         require(msg.sender == _ownerAddress);

172:         require(msg.sender == _ownerAddress);

181:         require(msg.sender == _delegatedAddress);

206:         require(Verification.verify(msgHash, signature, _delegatedAddress));

208:         require(modelHashes.length == totalToMint && modelTypes.length == totalToMint);

243:         require(

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

269:         require(hasStakerRole[msg.sender]);

290:         require(msg.sender == ownerOf(tokenId));

321:         require(msg.sender == _mergingPoolAddress);

346:         require(_ableToTransfer(tokenId, to));

363:         require(_ableToTransfer(tokenId, to));

371:         require(msg.sender == ownerOf(tokenId));

372:         require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);

495:         require(balanceOf(to) < MAX_FIGHTERS_ALLOWED);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

148:         require(tokenId < _itemCount);

151:         require(

158:         require(

186:         require(isAdmin[msg.sender]);

195:         require(isAdmin[msg.sender]);

219:         require(isAdmin[msg.sender]);

243:         require(allowedBurningAddresses[msg.sender]);

301:         require(allGameItemAttributes[tokenId].transferable);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

90:         require(msg.sender == _ownerAddress);

99:         require(msg.sender == _ownerAddress);

107:         require(isAdmin[msg.sender]);

119:         require(isAdmin[msg.sender]);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

86:         require(msg.sender == _ownerAddress);

94:         require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

128:         require(isAdmin[msg.sender]);

129:         require(recipients.length == amounts.length);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

168:         require(msg.sender == _ownerAddress);

177:         require(msg.sender == _ownerAddress);

185:         require(msg.sender == _ownerAddress);

193:         require(msg.sender == _ownerAddress);

202:         require(msg.sender == _ownerAddress);

210:         require(msg.sender == _ownerAddress);

219:         require(isAdmin[msg.sender]);

227:         require(isAdmin[msg.sender]);

234:         require(isAdmin[msg.sender]);

235:         require(totalAccumulatedPoints[roundId] > 0);

331:         require(msg.sender == _gameServerAddress);

332:         require(mergingPortion <= 100);

334:         require(

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/VoltageManager.sol

65:         require(msg.sender == _ownerAddress);

74:         require(msg.sender == _ownerAddress);

83:         require(isAdmin[msg.sender]);

94:         require(ownerVoltage[msg.sender] < 100);

95:         require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

106:         require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

### <a name="NC-4"></a>[NC-4] Return values of `approve()` not checked

Not all IERC20 implementations `revert()` when there's a failure in `approve()`. The function signature has a boolean return value and they indicate errors that way instead. By not checking the return value, operations that should have marked as failed, may potentially go through without actually approving anything

*Instances (4)*:

```solidity
File: src/Neuron.sol

132:             _approve(treasuryAddress, recipients[i], amounts[i]);

176:         _approve(account, msg.sender, amount);

189:         _approve(owner, spender, amount);

203:         _approve(account, msg.sender, decreasedAllowance);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

### <a name="NC-5"></a>[NC-5] Event is missing `indexed` fields

Index event fields make the field more quickly accessible to off-chain tools that parse events. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Each event should use three indexed fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three fields, all of the fields should be indexed.

*Instances (16)*:

```solidity
File: src/FighterFarm.sol

23:     event Locked(uint256 tokenId);

26:     event Unlocked(uint256 tokenId);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

20:     event BoughtItem(address buyer, uint256 tokenId, uint256 quantity);

24:     event Locked(uint256 tokenId);

28:     event Unlocked(uint256 tokenId);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

16:     event PointsAdded(uint256 tokenId, uint256 points);

19:     event Claimed(address claimer, uint32 amount);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

18:     event TokensClaimed(address user, uint256 amount);

21:     event TokensMinted(address user, uint256 amount);    

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

26:     event Staked(address from, uint256 amount);

29:     event Unstaked(address from, uint256 amount);

32:     event Claimed(address claimer, uint256 amount);

35:     event PointsChanged(uint256 tokenId, uint256 points, bool increased);    

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

17:     event ReclaimedStake(uint256 fighterId, uint256 reclaimAmount);

20:     event IncreasedStakeAtRisk(uint256 fighterId, uint256 atRiskAmount);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

```solidity
File: src/VoltageManager.sol

16:     event VoltageRemaining(address spender, uint8 voltage);  

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

### <a name="NC-6"></a>[NC-6] Constants should be defined rather than using magic numbers

*Instances (1)*:

```solidity
File: src/AiArenaHelper.sol

94:             return FighterOps.FighterPhysicalAttributes(99, 99, 99, 99, 99, 99);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

### <a name="NC-7"></a>[NC-7] Functions not used internally could be marked external

*Instances (25)*:

```solidity
File: src/AiArenaHelper.sol

144:     function deleteAttributeProbabilities(uint8 generation) public {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

313:     function mintFromMergingPool(

338:     function transferFrom(

355:     function safeTransferFrom(

370:     function reRoll(uint8 tokenId, uint8 fighterType) public {

395:     function contractURI() public pure returns (string memory) {

402:     function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {

410:     function supportsInterface(bytes4 _interfaceId)

421:     function getAllFighterInfo(

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

185:     function setAllowedBurningAddresses(address newBurningAddress) public {

208:     function createGameItem(

242:     function burn(address account, uint256 tokenId, uint256 amount) public {

249:     function contractURI() public pure returns (string memory) {

256:     function uri(uint256 tokenId) public view override returns (string memory) {

268:     function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {

279:     function remainingSupply(uint256 tokenId) public view returns (uint256) {

285:     function uniqueTokensOutstanding() public view returns (uint256) {

291:     function safeTransferFrom(

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

195:     function addPoints(uint256 tokenId, uint256 points) public {

205:     function getFighterPoints(uint256 maxId) public view returns(uint256[] memory) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

171:     function approveSpender(address account, uint256 amount) public {

184:     function approveStaker(address owner, address spender, uint256 amount) public {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

386:     function getUnclaimedNRN(address claimer) public view returns(uint256) {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/VoltageManager.sol

93:     function useVoltageBattery() public {

105:     function spendVoltage(address spender, uint8 voltageSpent) public {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

## Low Issues

| |Issue|Instances|
|-|:-|:-:|
| [L-1](#L-1) | Do not use deprecated library functions | 3 |
| [L-2](#L-2) | Unsafe ERC20 operation(s) | 7 |
| [L-3](#L-3) | Unspecific compiler version pragma | 8 |

### <a name="L-1"></a>[L-1] Do not use deprecated library functions

*Instances (3)*:

```solidity
File: src/Neuron.sol

95:         _setupRole(MINTER_ROLE, newMinterAddress);

103:         _setupRole(STAKER_ROLE, newStakerAddress);

111:         _setupRole(SPENDER_ROLE, newSpenderAddress);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

### <a name="L-2"></a>[L-2] Unsafe ERC20 operation(s)

*Instances (7)*:

```solidity
File: src/FighterFarm.sol

376:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

164:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/RankedBattle.sol

251:         bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);

283:         bool success = _neuronInstance.transfer(msg.sender, amount);

493:                 bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

100:         bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

143:         return _neuronInstance.transfer(treasuryAddress, totalStakeAtRisk[roundId]);

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

### <a name="L-3"></a>[L-3] Unspecific compiler version pragma

*Instances (8)*:

```solidity
File: src/AiArenaHelper.sol

3: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/AiArenaHelper.sol)

```solidity
File: src/FighterFarm.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/FighterFarm.sol)

```solidity
File: src/GameItems.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/GameItems.sol)

```solidity
File: src/MergingPool.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/MergingPool.sol)

```solidity
File: src/Neuron.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)

```solidity
File: src/RankedBattle.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/RankedBattle.sol)

```solidity
File: src/StakeAtRisk.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/StakeAtRisk.sol)

```solidity
File: src/VoltageManager.sol

2: pragma solidity >=0.8.0 <0.9.0;

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/VoltageManager.sol)

## Medium Issues

| |Issue|Instances|
|-|:-|:-:|
| [M-1](#M-1) | Centralization Risk for trusted owners | 1 |

### <a name="M-1"></a>[M-1] Centralization Risk for trusted owners

#### Impact

Contracts have owners with privileged rights to perform admin tasks and need to be trusted to not perform malicious updates or drain funds.

*Instances (1)*:

```solidity
File: src/Neuron.sol

11: contract Neuron is ERC20, AccessControl {

```

[Link to code](https://github.com/code-423n4/2024-02-ai-arena/blob/main/src/Neuron.sol)
