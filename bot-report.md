# Winning bot race submission
This is the top-ranked automated findings report, from TragedyOTCommons bot. All findings in this report will be considered known issues for the purposes of your C4 audit.

## Summary

| |Issue|Instances| Gas Savings
|-|:-|:-:|:-:|
| [[M-01](#m-01)] | Minting in a loop may lead to a DOS | 1| 0|
| [[L-01](#l-01)] | `tokenURI()` does not follow EIP-721 | 1| 0|
| [[L-02](#l-02)] | Code does not follow the best practice of check-effects-interaction | 92| 0|
| [[L-03](#l-03)] | Consider implementing two-step procedure for updating protocol addresses | 3| 0|
| [[L-04](#l-04)] | Events may be emitted out of order due to reentrancy | 23| 0|
| [[L-05](#l-05)] | External calls in an un-bounded `for-`loop may result in a DOS | 9| 0|
| [[L-06](#l-06)] | Input array lengths may differ | 5| 0|
| [[L-07](#l-07)] | Missing checks for `address(0x0)` when updating `address` state variables | 24| 0|
| [[L-08](#l-08)] | NFT doesn't handle hard forks | 1| 0|
| [[L-09](#l-09)] | Solidity version 0.8.20 may not work on other chains due to `PUSH0` | 8| 0|
| [[L-10](#l-10)] | State variables not capped at reasonable values | 2| 0|
| [[L-11](#l-11)] | The `owner` is a single point of failure and a centralization risk | 54| 0|
| [[L-12](#l-12)] | Tokens may be minted to `address(0x0)` | 6| 0|
| [[G-01](#g-01)] | `abi.encode()` is less efficient than `abi.encodepacked()` for non-address arguments | 1| 0|
| [[G-02](#g-02)] | Argument validation should be at the top of the function/block | 3| 0|
| [[G-03](#g-03)] | Assembly: Check `msg.sender` using `xor` and the scratch space | 44| 0|
| [[G-04](#g-04)] | Calculations should be memoized rather than re-calculating them | 1| 0|
| [[G-05](#g-05)] | Duplicated `require()`/`revert()` checks should be refactored to a modifier or function to save deployment gas | 46| 0|
| [[G-06](#g-06)] | It costs more gas to initialize non-`constant`/non-`immutable` state variables to zero/false than to let the default of zero/false be applied | 7| 0|
| [[G-07](#g-07)] | Use `uint256(1)`/`uint256(2)` instead of `true`/`false` to save gas for changes | 7| 59850|
| [[G-08](#g-08)] | Mappings are cheaper to use than storage arrays | 8| 16800|
| [[G-09](#g-09)] | Remove or replace unused state variables | 1| 0|
| [[G-10](#g-10)] | Use `Array.unsafeAccess()` to avoid repeated array length checks | 16| 33600|
| [[G-11](#g-11)] | State variables only set in the constructor should be declared `immutable` | 12| 25164|
| [[G-12](#g-12)] | State variables only set in their definitions should be declared `constant` | 3| 6291|
| [[G-13](#g-13)] | State variables can be packed into fewer storage slots by truncating timestamp bytes | 2| 4000|
| [[G-14](#g-14)] | Avoid updating storage when the value hasn't changed | 15| 12000|
| [[G-15](#g-15)] | Assembly: Use scratch space for building calldata | 24| 5280|
| [[G-16](#g-16)] | State variables should be cached in stack variables rather than re-reading them from storage | 78| 7566|
| [[G-17](#g-17)] | Use the inputs/results of assignments rather than re-reading state variables | 3| 291|
| [[G-18](#g-18)] | Assembly: Use scratch space for calculating small `keccak256` hashes | 2| 160|
| [[G-19](#g-19)] | `++i`/`i++` should be `unchecked{++i}`/`unchecked{i++}` when it is not possible for them to overflow, as is the case when used in `for`- and `while`-loops | 17| 1020|
| [[G-20](#g-20)] | `do`-`while` is cheaper than `for`-loops when the initial check can be skipped | 17| 0|
| [[G-21](#g-21)] | Avoid contract existence checks by using low-level calls | 28| 2800|
| [[G-22](#g-22)] | Avoid transferring amounts of zero in order to save gas | 5| 500|
| [[G-23](#g-23)] | Consider pre-calculating the address of `address(this)` to save gas | 2| 0|
| [[G-24](#g-24)] | Consider using `ERC721A` over `ERC721` | 2| 0|
| [[G-25](#g-25)] | Consider using `solady`'s token contracts to save gas | 4| 0|
| [[G-26](#g-26)] | Consider using solady's `FixedPointMathLib` | 5| 0|
| [[G-27](#g-27)] | Multiple `address`/ID mappings can be combined into a single `mapping` of an `address`/ID to a `struct` | 10| 0|
| [[G-28](#g-28)] | Reduce deployment costs by tweaking contracts' metadata | 8| 0|
| [[G-29](#g-29)] | Reduce gas usage by moving to Solidity 0.8.19 or later | 8| 0|
| [[G-30](#g-30)] | State variable written in a loop | 1| 5794|
| [[G-31](#g-31)] | Using `bool`s for storage incurs overhead | 12| 1200|
| [[G-32](#g-32)] | State variable read in a loop | 8| 776|
| [[G-33](#g-33)] | Multiple accesses of a mapping/array should use a local variable cache | 24| 1008|
| [[G-34](#g-34)] | Multiple accesses of a storage array should use a local variable cache | 17| 714|
| [[G-35](#g-35)] | Combine `mapping`s referenced in the same function by the same key | 16| 672|
| [[G-36](#g-36)] | Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead | 1| 22|
| [[G-37](#g-37)] | Functions guaranteed to revert when called by normal users can be marked `payable` | 67| 1407|
| [[G-38](#g-38)] | Constructors can be marked `payable` | 8| 168|
| [[G-39](#g-39)] | `unchecked {}`  can be used on the division of two `uint`s in order to save gas | 6| 120|
| [[G-40](#g-40)] | `private` functions only called once can be inlined to save gas | 5| 100|
| [[G-41](#g-41)] | Assembly: Use scratch space when building emitted events with two data arguments | 10| 150|
| [[G-42](#g-42)] | Use local variables for emitting packed storage variables | 2| 28|
| [[G-43](#g-43)] | Counting down when iterating, saves gas | 17| 204|
| [[G-44](#g-44)] | `x += y` costs more gas than `x = x + y` for basic-typed state variables | 9| 90|
| [[G-45](#g-45)] | Don't compare boolean expressions to boolean literals | 4| 36|
| [[G-46](#g-46)] | Emitting constants wastes gas | 2| 16|
| [[G-47](#g-47)] | `++i` costs less gas than `i++`, especially when it's used in `for`-loops (`--i`/`i--` too) | 17| 85|
| [[G-48](#g-48)] | `>=` costs less gas than `>` | 41| 123|
| [[G-49](#g-49)] | `require()`/`revert()` strings longer than 32 bytes cost extra gas | 13| 39|
| [[G-50](#g-50)] | Enable IR-based code generation | -| 0|
| [[G-51](#g-51)] | Multiple accesses of a `memory`/`calldata` array should use a local variable cache | 8| 0|
| [[G-52](#g-52)] | Optimize names to save gas | 8| 0|
| [[G-53](#g-53)] | Stack variable is only used once | 16| 48|
| [[G-54](#g-54)] | Splitting `require()` statements that use `&&` saves gas | 2| 6|
| [[G-55](#g-55)] | Update OpenZeppelin dependency to save gas | 4| 0|
| [[G-56](#g-56)] | Use custom errors rather than `revert()`/`require()` strings to save gas | 22| 0|
| [[G-57](#g-57)] | Use short-circuit evaluation to avoid external calls | 1| 0|
| [[G-58](#g-58)] | Using `private` rather than `public`, saves gas | 64| 0|
| [[N-01](#n-01)] | `constant`s should be defined rather than using magic numbers | 42| 0|
| [[N-02](#n-02)] | `public` functions not called by the contract should be declared `external` instead | 27| 0|
| [[N-03](#n-03)] | `require()`/`revert()` statements should have descriptive reason strings | 67| 0|
| [[N-04](#n-04)] | Adding a `return` statement when the function defines a named return variable, is redundant | 1| 0|
| [[N-05](#n-05)] | Array indices should be referenced via `enum`s rather than via numeric literals | 23| 0|
| [[N-06](#n-06)] | Array is `push()`ed but not `pop()`ed | 2| 0|
| [[N-07](#n-07)] | Common functions should be refactored to a common base contract | 14| 0|
| [[N-08](#n-08)] | Consider adding a block/deny-list | 6| 0|
| [[N-09](#n-09)] | Consider adding emergency-stop functionality | 4| 0|
| [[N-10](#n-10)] | Consider adding formal verification proofs | -| 0|
| [[N-11](#n-11)] | Consider adding validation of user inputs | 42| 0|
| [[N-12](#n-12)] | Consider bounding input array length | 4| 0|
| [[N-13](#n-13)] | Consider defining system-wide constants in a single file | 2| 0|
| [[N-14](#n-14)] | Consider disallowing transfers to `address(this)` | 1| 0|
| [[N-15](#n-15)] | Consider emitting an event at the end of the constructor | 8| 0|
| [[N-16](#n-16)] | Consider making contracts `Upgradeable` | 8| 0|
| [[N-17](#n-17)] | Consider moving `msg.sender` checks to common `modifier`s | 67| 0|
| [[N-18](#n-18)] | Consider moving duplicated strings to constants | 4| 0|
| [[N-19](#n-19)] | Consider providing a ranged getter for array state variables | 8| 0|
| [[N-20](#n-20)] | Consider returning a `struct` rather than having multiple `return` values | 4| 0|
| [[N-21](#n-21)] | Consider splitting complex checks into multiple steps | 1| 0|
| [[N-22](#n-22)] | Consider using `AccessControlDefaultAdminRules` rather than `AccessControl` | 1| 0|
| [[N-23](#n-23)] | Consider using `delete` rather than assigning zero/false to clear values | 1| 0|
| [[N-24](#n-24)] | Consider using a `struct` rather than having many function input parameters | 5| 0|
| [[N-25](#n-25)] | Consider using descriptive `constant`s when passing zero as a function argument | 7| 0|
| [[N-26](#n-26)] | Consider using named function arguments | 12| 0|
| [[N-27](#n-27)] | Consider using named mappings | 48| 0|
| [[N-28](#n-28)] | Consider using named returns | 22| 0|
| [[N-29](#n-29)] | Consider using the `using`-`for` syntax | 4| 0|
| [[N-30](#n-30)] | Constants in comparisons should appear on the left side | 40| 0|
| [[N-31](#n-31)] | Contract timekeeping will break earlier than the Ethereum network itself will stop working | 2| 0|
| [[N-32](#n-32)] | Contracts should have all `public`/`external` functions exposed by `interface`s | 8| 0|
| [[N-33](#n-33)] | Contracts should have full test coverage | -| 0|
| [[N-34](#n-34)] | Critical system parameter changes should be behind a timelock | 11| 0|
| [[N-35](#n-35)] | Custom errors should be used rather than `revert()`/`require()` | 89| 0|
| [[N-36](#n-36)] | Duplicated `require()`/`revert()` checks should be refactored to a modifier or function | 27| 0|
| [[N-37](#n-37)] | Event is not properly `indexed` | 16| 0|
| [[N-38](#n-38)] | Events are missing sender information | 11| 0|
| [[N-39](#n-39)] | Events that mark critical parameter changes should contain both the old and the new value | 6| 0|
| [[N-40](#n-40)] | Expressions for constant values should use `immutable` rather than `constant` | 11| 0|
| [[N-41](#n-41)] | High cyclomatic complexity | 1| 0|
| [[N-42](#n-42)] | Import declarations should import specific identifiers, rather than the whole file | 5| 0|
| [[N-43](#n-43)] | Imports should use double quotes rather than single quotes | 1| 0|
| [[N-44](#n-44)] | Large multiples of ten should use scientific notation | 2| 0|
| [[N-45](#n-45)] | Large numeric literals should use underscores for readability | 2| 0|
| [[N-46](#n-46)] | Large or complicated code bases should implement invariant tests | -| 0|
| [[N-47](#n-47)] | Long functions should be refactored into multiple, smaller, functions | 1| 0|
| [[N-48](#n-48)] | Missing checks for `address(0x0)` in the constructor | 20| 0|
| [[N-49](#n-49)] | Missing checks for empty parameters in the constructor | 1| 0|
| [[N-50](#n-50)] | Missing checks for uint state variable assignments | 1| 0|
| [[N-51](#n-51)] | Missing event for critical parameter change | 21| 0|
| [[N-52](#n-52)] | Multiple `address`/ID mappings can be combined into a single `mapping` of an `address`/ID to a `struct`, for readability | 16| 0|
| [[N-53](#n-53)] | Named imports of parent contracts are missing | 5| 0|
| [[N-54](#n-54)] | NatSpec: Contract declarations should have `@dev` tags | 7| 0|
| [[N-55](#n-55)] | NatSpec: Event `@param` tag is missing | 30| 0|
| [[N-56](#n-56)] | NatSpec: Event declarations should have `@dev` tags | 16| 0|
| [[N-57](#n-57)] | NatSpec: Function `@param` tag is missing | 9| 0|
| [[N-58](#n-58)] | NatSpec: Function `@return` tag is missing | 3| 0|
| [[N-59](#n-59)] | NatSpec: Function declarations should have `@dev` tags | 37| 0|
| [[N-60](#n-60)] | NatSpec: Non-public state variable declarations should use `@dev` tags | 23| 0|
| [[N-61](#n-61)] | Non-library/interface files should use fixed compiler versions, not floating ones | 8| 0|
| [[N-62](#n-62)] | Outdated package versions | 4| 0|
| [[N-63](#n-63)] | Setters should prevent re-setting of the same value | 15| 0|
| [[N-64](#n-64)] | Style guide: Contract does not follow the Solidity style guide's suggested layout ordering | 7| 0|
| [[N-65](#n-65)] | Style guide: Control structures do not follow the Solidity Style Guide | 1| 0|
| [[N-66](#n-66)] | Style guide: Extraneous whitespace | 17| 0|
| [[N-67](#n-67)] | Typos | 1| 0|
| [[N-68](#n-68)] | Unnecessary cast | 1| 0|
| [[N-69](#n-69)] | Unused `event` definition | 1| 0|
| [[N-70](#n-70)] | Unused import | 1| 0|
| [[N-71](#n-71)] | Use of `override` is unnecessary | 7| 0|
| [[N-72](#n-72)] | Use scientific notation (e.g. `1e18`) rather than exponentiation (e.g. `10**18`) | 11| 0|
| [[N-73](#n-73)] | Use the latest solidity (prior to 0.8.20 if on L2s) for deployment | 8| 0|
| [[N-74](#n-74)] | Variables need not be initialized to zero | 26| 0|
| [[N-75](#n-75)] | Visibility should be set explicitly rather than defaulting to `internal` | 27| 0|

### Medium Risk Issues

### [M-01]<a name="m-01"></a> Minting in a loop may lead to a DOS

The signature being used appears to require that all NFTs be minted at once. If there are a lot of them, the there may be too many to mint in one block

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit fighters[] : claimFighters()
209          nftsClaimed[msg.sender][0] += numToMint[0];
210          nftsClaimed[msg.sender][1] += numToMint[1];
211          for (uint16 i = 0; i < totalToMint; i++) {
212              _createNewFighter(
213                  msg.sender, 
214                  uint256(keccak256(abi.encode(msg.sender, fighters.length))),
215                  modelHashes[i], 
216                  modelTypes[i],
217                  i < numToMint[0] ? 0 : 1,
218                  0,
219                  [uint256(100), uint256(100)]
220              );
221:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L209-L221

### Low Risk Issues

### [L-01]<a name="l-01"></a> `tokenURI()` does not follow EIP-721

The [EIP](https://eips.ethereum.org/EIPS/eip-721) states that `tokenURI()` "Throws if `_tokenId` is not a valid NFT", which the code below does not do. If the NFT has not yet been minted, `tokenURI()` should revert

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

402      function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {
403          return _tokenURIs[tokenId];
404:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402-L404

### [L-02]<a name="l-02"></a> Code does not follow the best practice of check-effects-interaction

Code should follow the best-practice of [check-effects-interaction](https://blockchain-academy.hs-mittweida.de/courses/solidity-coding-beginners-to-intermediate/lessons/solidity-11-coding-patterns/topic/checks-effects-interactions/), where state variables are updated before any external calls are made. Doing so prevents a large class of reentrancy bugs.

*There are 92 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit transferFrom() called prior to this assignment in reRoll(), via: reRoll()
/// @audit approveSpender() called prior to this assignment in reRoll(), via: reRoll()
/// @audit balanceOf() called prior to this assignment in reRoll(), via: reRoll()
378:             numRerolls[tokenId] += 1;

/// @audit transferFrom() called prior to this assignment in reRoll(), via: reRoll()
/// @audit approveSpender() called prior to this assignment in reRoll(), via: reRoll()
/// @audit balanceOf() called prior to this assignment in reRoll(), via: reRoll()
381:             fighters[tokenId].element = element;

/// @audit transferFrom() called prior to this assignment in reRoll(), via: reRoll()
/// @audit approveSpender() called prior to this assignment in reRoll(), via: reRoll()
/// @audit balanceOf() called prior to this assignment in reRoll(), via: reRoll()
382:             fighters[tokenId].weight = weight;

/// @audit transferFrom() called prior to this assignment in reRoll(), via: reRoll()
/// @audit approveSpender() called prior to this assignment in reRoll(), via: reRoll()
/// @audit balanceOf() called prior to this assignment in reRoll(), via: reRoll()
383              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
384                  newDna,
385                  generation[fighterType],
386                  fighters[tokenId].iconsType,
387                  fighters[tokenId].dendroidBool
388:             );

/// @audit createPhysicalAttributes() called prior to this assignment in reRoll(), via: reRoll()
/// @audit transferFrom() called prior to this assignment in reRoll(), via: reRoll()
/// @audit approveSpender() called prior to this assignment in reRoll(), via: reRoll()
/// @audit balanceOf() called prior to this assignment in reRoll(), via: reRoll()
389:             _tokenURIs[tokenId] = "";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L378-L378,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L378-L378,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L378-L378,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L381-L381,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L381-L381,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L381-L381,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L382-L382,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L382-L382,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L382-L382,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L388,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L388,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L388,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L389-L389,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L389-L389,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L389-L389,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L389-L389

```solidity
File: src/GameItems.sol

/// @audit transferFrom() called prior to this assignment in mint(), via: mint()
/// @audit approveSpender() called prior to this assignment in mint(), via: mint()
/// @audit balanceOf() called prior to this assignment in mint(), via: mint()
169:             allowanceRemaining[msg.sender][tokenId] -= quantity;

/// @audit transferFrom() called prior to this assignment in mint(), via: mint()
/// @audit approveSpender() called prior to this assignment in mint(), via: mint()
/// @audit balanceOf() called prior to this assignment in mint(), via: mint()
171:                 allGameItemAttributes[tokenId].itemsRemaining -= quantity;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L169-L169,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L169-L169,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L169-L169,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171-L171

```solidity
File: src/MergingPool.sol

/// @audit ownerOf() called prior to this assignment in pickWinner(), via: pickWinner()
126:             totalPoints -= fighterPoints[winners[i]];

/// @audit ownerOf() called prior to this assignment in pickWinner(), via: pickWinner()
127:             fighterPoints[winners[i]] = 0;

/// @audit ownerOf() called prior to this assignment in pickWinner(), via: pickWinner()
129:         winnerAddresses[roundId] = currentWinnerAddresses;

/// @audit ownerOf() called prior to this assignment in pickWinner(), via: pickWinner()
130:         isSelectionComplete[roundId] = true;

/// @audit ownerOf() called prior to this assignment in pickWinner(), via: pickWinner()
131:         roundId += 1;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L129-L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L131-L131

```solidity
File: src/RankedBattle.sol

/// @audit setNewRound() called prior to this assignment in setNewRound(), via: setNewRound()
238:         rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];

/// @audit transferFrom() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit approveStaker() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit balanceOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit ownerOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit updateFighterStaking() called prior to this assignment in stakeNRN(), via: stakeNRN()
256:             amountStaked[tokenId] += amount;

/// @audit transferFrom() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit approveStaker() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit balanceOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit ownerOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit updateFighterStaking() called prior to this assignment in stakeNRN(), via: stakeNRN()
257:             globalStakedAmount += amount;

/// @audit transferFrom() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit approveStaker() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit balanceOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit ownerOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit updateFighterStaking() called prior to this assignment in stakeNRN(), via: stakeNRN()
258              stakingFactor[tokenId] = _getStakingFactor(
259                  tokenId, 
260                  _stakeAtRiskInstance.getStakeAtRisk(tokenId)
261:             );

/// @audit transferFrom() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit approveStaker() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit getStakeAtRisk() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit balanceOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit ownerOf() called prior to this assignment in stakeNRN(), via: stakeNRN()
/// @audit updateFighterStaking() called prior to this assignment in stakeNRN(), via: stakeNRN()
262:             _calculatedStakingFactor[tokenId][roundId] = true;

/// @audit ownerOf() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
275:         amountStaked[tokenId] -= amount;

/// @audit ownerOf() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
276:         globalStakedAmount -= amount;

/// @audit ownerOf() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
277          stakingFactor[tokenId] = _getStakingFactor(
278              tokenId, 
279              _stakeAtRiskInstance.getStakeAtRisk(tokenId)
280:         );

/// @audit getStakeAtRisk() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
/// @audit ownerOf() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
281:         _calculatedStakingFactor[tokenId][roundId] = true;

/// @audit getStakeAtRisk() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
/// @audit ownerOf() called prior to this assignment in unstakeNRN(), via: unstakeNRN()
282:         hasUnstaked[tokenId][roundId] = true;

/// @audit spendVoltage() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord()
/// @audit getStakeAtRisk() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord(), _addResultPoints()
/// @audit addPoints() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord(), _addResultPoints()
/// @audit reclaimNRN() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord(), _addResultPoints()
/// @audit transfer() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord(), _addResultPoints()
/// @audit updateAtRiskRecords() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord(), _addResultPoints()
/// @audit getStakeAtRisk() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord()
/// @audit ownerVoltage() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord()
/// @audit ownerVoltageReplenishTime() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord()
/// @audit ownerOf() called prior to this assignment in updateBattleRecord(), via: updateBattleRecord()
348:         totalBattles += 1;

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
434:             stakingFactor[tokenId] = _getStakingFactor(tokenId, stakeAtRisk);

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
435:             _calculatedStakingFactor[tokenId][roundId] = true;

/// @audit addPoints() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit reclaimNRN() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
462:                 amountStaked[tokenId] += curStakeAtRisk;

/// @audit reclaimNRN() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit addPoints() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
466:             accumulatedPointsPerFighter[tokenId][roundId] += points;

/// @audit reclaimNRN() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit addPoints() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
467:             accumulatedPointsPerAddress[fighterOwner][roundId] += points;

/// @audit reclaimNRN() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit addPoints() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
468:             totalAccumulatedPoints[roundId] += points;

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
485:                 accumulatedPointsPerFighter[tokenId][roundId] -= points;

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
486:                 accumulatedPointsPerAddress[fighterOwner][roundId] -= points;

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
487:                 totalAccumulatedPoints[roundId] -= points;

/// @audit getStakeAtRisk() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit updateAtRiskRecords() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
/// @audit transfer() called prior to this assignment in _addResultPoints(), via: _addResultPoints()
496:                     amountStaked[tokenId] -= curStakeAtRisk;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L238-L238,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262-L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L275-L275,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L276-L276,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L277-L280,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L281-L281,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L281-L281,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L282-L282,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L282-L282,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L434-L434,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L435-L435,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L462-L462,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L462-L462,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L462-L462,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L466-L466,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L466-L466,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L466-L466,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L467-L467,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L467-L467,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L467-L467,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L468-L468,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L468-L468,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L468-L468,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L485-L485,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L486-L486,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L487-L487,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L496-L496,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L496-L496,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L496-L496

```solidity
File: src/StakeAtRisk.sol

/// @audit transfer() called prior to this assignment in setNewRound(), via: setNewRound(), _sweepLostStake()
82:              roundId = roundId_;

/// @audit transfer() called prior to this assignment in reclaimNRN(), via: reclaimNRN()
102:             stakeAtRisk[roundId][fighterId] -= nrnToReclaim;

/// @audit transfer() called prior to this assignment in reclaimNRN(), via: reclaimNRN()
103:             totalStakeAtRisk[roundId] -= nrnToReclaim;

/// @audit transfer() called prior to this assignment in reclaimNRN(), via: reclaimNRN()
104:             amountLost[fighterOwner] -= nrnToReclaim;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L103-L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L104-L104

```solidity
File: src/VoltageManager.sol

/// @audit burn() called prior to this assignment in useVoltageBattery(), via: useVoltageBattery()
/// @audit balanceOf() called prior to this assignment in useVoltageBattery(), via: useVoltageBattery()
97:          ownerVoltage[msg.sender] = 100;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L97-L97,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L97-L97

### [L-03]<a name="l-03"></a> Consider implementing two-step procedure for updating protocol addresses

A copy-paste error or a typo may end up bricking protocol functionality, or sending tokens to an address with no known private key. Consider implementing a two-step procedure for updating protocol addresses, where the recipient is set as pending, and must 'accept' the assignment by making an affirmative call. A straight forward way of doing this would be to have the target contracts implement [EIP-165](https://eips.ethereum.org/EIPS/eip-165), and to have the 'set' functions ensure that the recipient is of the right interface type.

*There are 3 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit _mergingPoolAddress:  setMergingPoolAddress()
171      function setMergingPoolAddress(address mergingPoolAddress) external {
172          require(msg.sender == _ownerAddress);
173          _mergingPoolAddress = mergingPoolAddress;
174:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L174

```solidity
File: src/RankedBattle.sol

/// @audit _gameServerAddress:  setGameServerAddress()
184      function setGameServerAddress(address gameServerAddress) external {
185          require(msg.sender == _ownerAddress);
186          _gameServerAddress = gameServerAddress;
187:     }

/// @audit _stakeAtRiskAddress:  setStakeAtRiskAddress()
192      function setStakeAtRiskAddress(address stakeAtRiskAddress) external {
193          require(msg.sender == _ownerAddress);
194          _stakeAtRiskAddress = stakeAtRiskAddress;
195          _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);
196:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L187,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L196

### [L-04]<a name="l-04"></a> Events may be emitted out of order due to reentrancy

Ensure that events follow the best practice of check-effects-interaction, and are emitted before external calls

*There are 23 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

/// @audit transferFrom() called prior to this emission in mint(), via: mint()
/// @audit approveSpender() called prior to this emission in mint(), via: mint()
/// @audit onERC1155Received() called prior to this emission in mint(), via: mint(), _mint(), _doSafeTransferAcceptanceCheck()
/// @audit balanceOf() called prior to this emission in mint(), via: mint()
174:             emit BoughtItem(msg.sender, tokenId, quantity);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L174-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L174-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L174-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L174-L174

```solidity
File: src/MergingPool.sol

/// @audit mintFromMergingPool() called prior to this emission in claimRewards(), via: claimRewards()
165:             emit Claimed(msg.sender, claimIndex);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L165-L165

```solidity
File: src/RankedBattle.sol

/// @audit transferFrom() called prior to this emission in stakeNRN(), via: stakeNRN()
/// @audit approveStaker() called prior to this emission in stakeNRN(), via: stakeNRN()
/// @audit getStakeAtRisk() called prior to this emission in stakeNRN(), via: stakeNRN()
/// @audit balanceOf() called prior to this emission in stakeNRN(), via: stakeNRN()
/// @audit ownerOf() called prior to this emission in stakeNRN(), via: stakeNRN()
/// @audit updateFighterStaking() called prior to this emission in stakeNRN(), via: stakeNRN()
263:             emit Staked(msg.sender, amount);

/// @audit transfer() called prior to this emission in unstakeNRN(), via: unstakeNRN()
/// @audit getStakeAtRisk() called prior to this emission in unstakeNRN(), via: unstakeNRN()
/// @audit updateFighterStaking() called prior to this emission in unstakeNRN(), via: unstakeNRN()
/// @audit ownerOf() called prior to this emission in unstakeNRN(), via: unstakeNRN()
288:             emit Unstaked(msg.sender, amount);

/// @audit mint() called prior to this emission in claimNRN(), via: claimNRN()
309:             emit Claimed(msg.sender, claimableNRN);

/// @audit reclaimNRN() called prior to this emission in _addResultPoints(), via: _addResultPoints()
/// @audit addPoints() called prior to this emission in _addResultPoints(), via: _addResultPoints()
/// @audit getStakeAtRisk() called prior to this emission in _addResultPoints(), via: _addResultPoints()
470:                 emit PointsChanged(tokenId, points, true);

/// @audit getStakeAtRisk() called prior to this emission in _addResultPoints(), via: _addResultPoints()
489:                     emit PointsChanged(tokenId, points, false);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L288-L288,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L288-L288,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L288-L288,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L288-L288,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L309-L309,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L489-L489

```solidity
File: src/StakeAtRisk.sol

/// @audit transfer() called prior to this emission in reclaimNRN(), via: reclaimNRN()
105:             emit ReclaimedStake(fighterId, nrnToReclaim);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L105-L105

```solidity
File: src/VoltageManager.sol

/// @audit burn() called prior to this emission in useVoltageBattery(), via: useVoltageBattery()
/// @audit balanceOf() called prior to this emission in useVoltageBattery(), via: useVoltageBattery()
98:          emit VoltageRemaining(msg.sender, ownerVoltage[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L98-L98

### [L-05]<a name="l-05"></a> External calls in an un-bounded `for-`loop may result in a DOS

Consider limiting the number of iterations in `for-`loops that make external calls

*There are 9 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit createPhysicalAttributes() :  _createNewFighter()
211          for (uint16 i = 0; i < totalToMint; i++) {
212              _createNewFighter(
213                  msg.sender, 
214                  uint256(keccak256(abi.encode(msg.sender, fighters.length))),
215                  modelHashes[i], 
216                  modelTypes[i],
217                  i < numToMint[0] ? 0 : 1,
218                  0,
219                  [uint256(100), uint256(100)]
220              );
221:         }

/// @audit onERC721Received() :  _checkOnERC721Received(), _safeMint(), _safeMint(), _createNewFighter()
/// @audit createPhysicalAttributes() :  _createNewFighter()
/// @audit burn() : 
/// @audit ownerOf() : 
249          for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {
250              require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));
251              _mintpassInstance.burn(mintpassIdsToBurn[i]);
252              _createNewFighter(
253                  msg.sender, 
254                  uint256(keccak256(abi.encode(mintPassDnas[i]))), 
255                  modelHashes[i], 
256                  modelTypes[i],
257                  fighterTypes[i],
258                  iconsTypes[i],
259                  [uint256(100), uint256(100)]
260              );
261:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L221,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L261

```solidity
File: src/MergingPool.sol

/// @audit ownerOf() : 
124          for (uint256 i = 0; i < winnersLength; i++) {
125              currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);
126              totalPoints -= fighterPoints[winners[i]];
127              fighterPoints[winners[i]] = 0;
128:         }

/// @audit onERC721Received() :  _checkOnERC721Received(), _safeMint(), _safeMint(), _createNewFighter(), mintFromMergingPool()
/// @audit mintFromMergingPool() : 
/// @audit createPhysicalAttributes() :  _createNewFighter(), mintFromMergingPool()
152              for (uint32 j = 0; j < winnersLength; j++) {
153                  if (msg.sender == winnerAddresses[currentRound][j]) {
154                      _fighterFarmInstance.mintFromMergingPool(
155                          msg.sender,
156                          modelURIs[claimIndex],
157                          modelTypes[claimIndex],
158                          customAttributes[claimIndex]
159                      );
160                      claimIndex += 1;
161                  }
162:             }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L162,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L162,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L162

### [L-06]<a name="l-06"></a> Input array lengths may differ

If the caller makes a copy-paste error, the lengths may be mismatched and an operation believed to have been completed may not in fact have been completed (e.g. if the array being iterated over is shorter than the one being indexed into).

*There are 5 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit probabilities[]
49:              attributeProbabilities[0][attributes[i]] = probabilities[i];

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L49-L49

```solidity
File: src/FighterFarm.sol

/// @audit iconsTypes[]
258:                 iconsTypes[i],

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L258-L258

```solidity
File: src/MergingPool.sol

/// @audit modelURIs[]
156:                         modelURIs[claimIndex],

/// @audit modelTypes[]
157:                         modelTypes[claimIndex],

/// @audit customAttributes[]
158:                         customAttributes[claimIndex]

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L158-L158

### [L-07]<a name="l-07"></a> Missing checks for `address(0x0)` when updating `address` state variables



*There are 24 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit transferOwnership(newOwnerAddress)
63:          _ownerAddress = newOwnerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L61

```solidity
File: src/FighterFarm.sol

/// @audit 0(ownerAddress)
107:         _ownerAddress = ownerAddress;

/// @audit 0(delegatedAddress)
108:         _delegatedAddress = delegatedAddress;

/// @audit 0(treasuryAddress_)
109:         treasuryAddress = treasuryAddress_;

/// @audit transferOwnership(newOwnerAddress)
122:         _ownerAddress = newOwnerAddress;

/// @audit setMergingPoolAddress(mergingPoolAddress)
173:         _mergingPoolAddress = mergingPoolAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L171

```solidity
File: src/GameItems.sol

/// @audit 0(ownerAddress)
96:          _ownerAddress = ownerAddress;

/// @audit 0(treasuryAddress_)
97:          treasuryAddress = treasuryAddress_;

/// @audit transferOwnership(newOwnerAddress)
110:         _ownerAddress = newOwnerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L108

```solidity
File: src/MergingPool.sol

/// @audit 0(ownerAddress)
76:          _ownerAddress = ownerAddress;

/// @audit 0(rankedBattleAddress)
77:          _rankedBattleAddress = rankedBattleAddress;

/// @audit transferOwnership(newOwnerAddress)
91:          _ownerAddress = newOwnerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L72-L72,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L89

```solidity
File: src/Neuron.sol

/// @audit 0(ownerAddress)
71:          _ownerAddress = ownerAddress;

/// @audit 0(treasuryAddress_)
72:          treasuryAddress = treasuryAddress_;

/// @audit transferOwnership(newOwnerAddress)
87:          _ownerAddress = newOwnerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L85

```solidity
File: src/RankedBattle.sol

/// @audit 0(ownerAddress)
152:         _ownerAddress = ownerAddress;

/// @audit 0(gameServerAddress)
153:         _gameServerAddress = gameServerAddress;

/// @audit transferOwnership(newOwnerAddress)
169:         _ownerAddress = newOwnerAddress;

/// @audit setGameServerAddress(gameServerAddress)
186:         _gameServerAddress = gameServerAddress;

/// @audit setStakeAtRiskAddress(stakeAtRiskAddress)
194:         _stakeAtRiskAddress = stakeAtRiskAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L167,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L192

```solidity
File: src/StakeAtRisk.sol

/// @audit 0(treasuryAddress_)
65:          treasuryAddress = treasuryAddress_;

/// @audit 0(rankedBattleAddress)
66:          _rankedBattleAddress = rankedBattleAddress;   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L61-L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L63-L63

```solidity
File: src/VoltageManager.sol

/// @audit 0(ownerAddress)
52:          _ownerAddress = ownerAddress;

/// @audit transferOwnership(newOwnerAddress)
66:          _ownerAddress = newOwnerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51-L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L64

### [L-08]<a name="l-08"></a> NFT doesn't handle hard forks

When there are hard forks, users often have to go through [many hoops](https://twitter.com/elerium115/status/1558471934924431363) to ensure that they control ownership on every fork. Consider adding `require(1 == chain.chainId)`, or the chain ID of whichever chain you prefer, to the functions below, or at least include the chain ID in the URI, so that there is no confusion about which chain is the owner of the NFT.

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

402      function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {
403          return _tokenURIs[tokenId];
404:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402-L404

### [L-09]<a name="l-09"></a> Solidity version 0.8.20 may not work on other chains due to `PUSH0`

The compiler for Solidity 0.8.20 switches the default target EVM version to [Shanghai](https://blog.soliditylang.org/2023/05/10/solidity-0.8.20-release-announcement/#important-note), which includes the new `PUSH0` op code. This op code may not yet be implemented on all L2s, so deployment on these chains will fail. To work around this issue, use an earlier [EVM](https://docs.soliditylang.org/en/v0.8.20/using-the-compiler.html?ref=zaryabs.com#setting-the-evm-version-to-target) [version](https://book.getfoundry.sh/reference/config/solidity-compiler#evm_version). While the project itself may or may not compile with 0.8.20, other projects with which it integrates, or which extend this project may, and those projects will have problems deploying these contracts/libraries.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

3:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L3-L3

```solidity
File: src/FighterFarm.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L2-L2

```solidity
File: src/GameItems.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L2-L2

```solidity
File: src/MergingPool.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L2-L2

```solidity
File: src/Neuron.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L2-L2

```solidity
File: src/RankedBattle.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L2-L2

```solidity
File: src/StakeAtRisk.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L2-L2

```solidity
File: src/VoltageManager.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L2-L2

### [L-10]<a name="l-10"></a> State variables not capped at reasonable values

Consider adding minimum/maximum value checks to ensure that the state variables below can never be used to excessively harm users, including via griefing

*There are 2 instance(s) of this issue:*

```solidity
File: src/MergingPool.sol

/// @audit newWinnersPerPeriodAmount
108:         winnersPerPeriod = newWinnersPerPeriodAmount;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L106

```solidity
File: src/RankedBattle.sol

/// @audit bpsLostPerLoss_
228:         bpsLostPerLoss = bpsLostPerLoss_;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L226

### [L-11]<a name="l-11"></a> The `owner` is a single point of failure and a centralization risk

Having a single EOA as the only owner of contracts is a large centralization risk and a single point of failure. A single private key may be taken in a hack, or the sole holder of the key may become unable to retrieve the key when necessary, or the single owner can become malicious and perform a rug-pull. Consider changing to a multi-signature setup, and or having a role-based authorization model.

*There are 54 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

41:      constructor(uint8[][] memory probabilities) {

61:      function transferOwnership(address newOwnerAddress) external {

68:      function addAttributeDivisor(uint8[] memory attributeDivisors) external {

131:     function addAttributeProbabilities(uint256 generation, uint8[][] memory probabilities) public {

144:     function deleteAttributeProbabilities(uint8 generation) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L41-L41,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L144-L144

```solidity
File: src/FighterFarm.sol

120:     function transferOwnership(address newOwnerAddress) external {

129:     function incrementGeneration(uint8 fighterType) external returns (uint8) {

139:     function addStaker(address newStaker) external {

147:     function instantiateAIArenaHelperContract(address aiArenaHelperAddress) external {

155:     function instantiateMintpassContract(address mintpassAddress) external {

163:     function instantiateNeuronContract(address neuronAddress) external {

171:     function setMergingPoolAddress(address mergingPoolAddress) external {

180:     function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {

268:     function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {

313      function mintFromMergingPool(
314          address to, 
315          string calldata modelHash, 
316          string calldata modelType, 
317          uint256[2] calldata customAttributes
318      ) 
319          public 
320:     {

370:     function reRoll(uint8 tokenId, uint8 fighterType) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L129-L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L139-L139,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L155-L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L163-L163,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L180-L180,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L268-L268,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L313-L320,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370-L370

```solidity
File: src/GameItems.sol

108:     function transferOwnership(address newOwnerAddress) external {

117:     function adjustAdminAccess(address adminAddress, bool access) external {

126:     function adjustTransferability(uint256 tokenId, bool transferable) external {

139:     function instantiateNeuronContract(address nrnAddress) external {

147:     function mint(uint256 tokenId, uint256 quantity) external {

185:     function setAllowedBurningAddresses(address newBurningAddress) public {

194:     function setTokenURI(uint256 tokenId, string memory _tokenURI) public {

208      function createGameItem(
209          string memory name_,
210          string memory tokenURI,
211          bool finiteSupply,
212          bool transferable,
213          uint256 itemsRemaining,
214          uint256 itemPrice,
215          uint16 dailyAllowance
216      ) 
217          public 
218:     {

242:     function burn(address account, uint256 tokenId, uint256 amount) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L108,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L117-L117,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L139-L139,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L194-L194,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L208-L218,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L242-L242

```solidity
File: src/MergingPool.sol

89:      function transferOwnership(address newOwnerAddress) external {

98:      function adjustAdminAccess(address adminAddress, bool access) external {

106:     function updateWinnersPerPeriod(uint256 newWinnersPerPeriodAmount) external {

118:     function pickWinner(uint256[] calldata winners) external {

195:     function addPoints(uint256 tokenId, uint256 points) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L89,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L106,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L195

```solidity
File: src/Neuron.sol

85:      function transferOwnership(address newOwnerAddress) external {

93:      function addMinter(address newMinterAddress) external {

101:     function addStaker(address newStakerAddress) external {

109:     function addSpender(address newSpenderAddress) external {

118:     function adjustAdminAccess(address adminAddress, bool access) external {

127:     function setupAirdrop(address[] calldata recipients, uint256[] calldata amounts) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L93-L93,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L127-L127

```solidity
File: src/RankedBattle.sol

167:     function transferOwnership(address newOwnerAddress) external {

176:     function adjustAdminAccess(address adminAddress, bool access) external {

184:     function setGameServerAddress(address gameServerAddress) external {

192:     function setStakeAtRiskAddress(address stakeAtRiskAddress) external {

201:     function instantiateNeuronContract(address nrnAddress) external {

209:     function instantiateMergingPoolContract(address mergingPoolAddress) external {

218:     function setRankedNrnDistribution(uint256 newDistribution) external {

226:     function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {

233:     function setNewRound() external {

294:     function claimNRN() external {

322      function updateBattleRecord(
323          uint256 tokenId, 
324          uint256 mergingPortion,
325          uint8 battleResult,
326          uint256 eloFactor,
327          bool initiatorBool
328      ) 
329          external 
330:     {   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L167,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L192,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L201-L201,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L209-L209,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L218-L218,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L226,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L233-L233,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L294-L294,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L322-L330

```solidity
File: src/StakeAtRisk.sol

78:      function setNewRound(uint256 roundId_) external {

93:      function reclaimNRN(uint256 nrnToReclaim, uint256 fighterId, address fighterOwner) external {

115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L78-L78,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L93-L93,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L121

```solidity
File: src/VoltageManager.sol

64:      function transferOwnership(address newOwnerAddress) external {

73:      function adjustAdminAccess(address adminAddress, bool access) external {

82:      function adjustAllowedVoltageSpenders(address allowedVoltageSpender, bool allowed) external {

93:      function useVoltageBattery() public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L93-L93

### [L-12]<a name="l-12"></a> Tokens may be minted to `address(0x0)`

Neither the listed functions, nor `_mint()` prevent minting to `address(0x0)`

*There are 6 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit  _mint(), _safeMint(), _safeMint(), _createNewFighter(), claimFighters()
191      function claimFighters(
192          uint8[2] calldata numToMint,
193          bytes calldata signature,
194          string[] calldata modelHashes,
195          string[] calldata modelTypes
196      ) 
197          external 
198:     {

/// @audit  _mint(), _safeMint(), _safeMint(), _createNewFighter(), redeemMintPass()
233      function redeemMintPass(
234          uint256[] calldata mintpassIdsToBurn,
235          uint8[] calldata fighterTypes,
236          uint8[] calldata iconsTypes,
237          string[] calldata mintPassDnas,
238          string[] calldata modelHashes,
239          string[] calldata modelTypes
240      ) 
241          external 
242:     {

/// @audit  _mint(), _safeMint(), _safeMint(), _createNewFighter(), mintFromMergingPool()
313      function mintFromMergingPool(
314          address to, 
315          string calldata modelHash, 
316          string calldata modelType, 
317          uint256[2] calldata customAttributes
318      ) 
319          public 
320:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L191-L198,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L233-L242,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L313-L320

```solidity
File: src/GameItems.sol

/// @audit  _mint(), mint()
147:     function mint(uint256 tokenId, uint256 quantity) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L147

```solidity
File: src/Neuron.sol

/// @audit  _mint(), ()
68       constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
69           ERC20("Neuron", "NRN")
70:      {

/// @audit  _mint(), mint()
155:     function mint(address to, uint256 amount) public virtual {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L70,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L155-L155

### Gas Risk Issues

### [G-01]<a name="g-01"></a> `abi.encode()` is less efficient than `abi.encodepacked()` for non-address arguments



*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

254:                 uint256(keccak256(abi.encode(mintPassDnas[i]))), 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L254-L254

### [G-02]<a name="g-02"></a> Argument validation should be at the top of the function/block

Checks that involve constants should come before checks that involve state variables, function calls, and calculations. By doing these checks first, the function is able to revert before wasting a Gcoldsload (**2100 gas***) in a function that may ultimately revert in the unhappy case.

*There are 3 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133-L133

```solidity
File: src/Neuron.sol

129:         require(recipients.length == amounts.length);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L129-L129

```solidity
File: src/RankedBattle.sol

332:         require(mergingPortion <= 100);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L332-L332

### [G-03]<a name="g-03"></a> Assembly: Check `msg.sender` using `xor` and the scratch space

See [this](https://code4rena.com/reports/2023-05-juicebox#g-06-use-assembly-to-validate-msgsender) prior finding for details on the conversion

*There are 44 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

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

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

290:         require(msg.sender == ownerOf(tokenId));

321:         require(msg.sender == _mergingPoolAddress);

371:         require(msg.sender == ownerOf(tokenId));

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L181-L181,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L290-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L321-L321,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L371-L371

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

153:                 if (msg.sender == winnerAddresses[currentRound][j]) {

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L153-L153,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L196-L196

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119

```solidity
File: src/RankedBattle.sol

168:         require(msg.sender == _ownerAddress);

177:         require(msg.sender == _ownerAddress);

185:         require(msg.sender == _ownerAddress);

193:         require(msg.sender == _ownerAddress);

202:         require(msg.sender == _ownerAddress);

210:         require(msg.sender == _ownerAddress);

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

331:         require(msg.sender == _gameServerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L331-L331

```solidity
File: src/StakeAtRisk.sol

79:          require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

106:         require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L106-L106

### [G-04]<a name="g-04"></a> Calculations should be memoized rather than re-calculating them



*There are 1 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

159:             dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L159-L159

### [G-05]<a name="g-05"></a> Duplicated `require()`/`revert()` checks should be refactored to a modifier or function to save deployment gas

This will cost more runtime gas, but will reduce deployment gas when the function is (optionally called via a modifier) called more than once as is the case for the examples below. Most projects do not make this trade-off, but it's available nonetheless.

*There are 46 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

```solidity
File: src/FighterFarm.sol

121:         require(msg.sender == _ownerAddress);

130:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

148:         require(msg.sender == _ownerAddress);

156:         require(msg.sender == _ownerAddress);

164:         require(msg.sender == _ownerAddress);

172:         require(msg.sender == _ownerAddress);

346:         require(_ableToTransfer(tokenId, to));

363:         require(_ableToTransfer(tokenId, to));

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L363-L363

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

186:         require(isAdmin[msg.sender]);

195:         require(isAdmin[msg.sender]);

219:         require(isAdmin[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L186-L186,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L195-L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L219-L219

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

107:         require(isAdmin[msg.sender]);

119:         require(isAdmin[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L119-L119

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

128:         require(isAdmin[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L128-L128

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

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L227-L227,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L234-L234,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271

```solidity
File: src/StakeAtRisk.sol

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

83:          require(isAdmin[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L83-L83

### [G-06]<a name="g-06"></a> It costs more gas to initialize non-`constant`/non-`immutable` state variables to zero/false than to let the default of zero/false be applied

Not overwriting the default for storage variables avoids a Gsreset ([**2900 gas**](https://gist.github.com/IllIllI000/85b09af2291f626095eb11403ddc74f1)) during deployment

*There are 7 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

64:      uint256 _itemCount = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L64-L64

```solidity
File: src/MergingPool.sol

29:      uint256 public roundId = 0;

32:      uint256 public totalPoints = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L29-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L32-L32

```solidity
File: src/RankedBattle.sol

56:      uint256 public totalBattles = 0;

59:      uint256 public globalStakedAmount = 0;

62:      uint256 public roundId = 0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L56-L56,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L59-L59,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L62-L62

```solidity
File: src/StakeAtRisk.sol

27:      uint256 public roundId = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L27-L27

### [G-07]<a name="g-07"></a> Use `uint256(1)`/`uint256(2)` instead of `true`/`false` to save gas for changes

Avoids a Gsset (**20000 gas**) when changing from `false` to `true`, after having been `true` in the past. Since most of the bools aren't changed twice in one transaction, I've counted the amount of gas as half of the full amount, for each variable. Note that public state variables can be re-written to be `private` and use `uint256`, but have public getters returning `bool`s.

*There are 7 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit reset in: updateFighterStaking()
76:      mapping(uint256 => bool) public fighterStaked;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L76-L76

```solidity
File: src/GameItems.sol

/// @audit reset in: adjustAdminAccess()
83:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L83-L83

```solidity
File: src/MergingPool.sol

/// @audit reset in: adjustAdminAccess()
60:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L60-L60

```solidity
File: src/Neuron.sol

/// @audit reset in: adjustAdminAccess()
56:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L56-L56

```solidity
File: src/RankedBattle.sol

/// @audit reset in: adjustAdminAccess()
101:     mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L101-L101

```solidity
File: src/VoltageManager.sol

/// @audit reset in: adjustAllowedVoltageSpenders()
33:      mapping(address => bool) public allowedVoltageSpenders;

/// @audit reset in: adjustAdminAccess()
42:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L42-L42

### [G-08]<a name="g-08"></a> Mappings are cheaper to use than storage arrays

When using storage arrays, solidity adds an internal lookup of the array's length (a Gcoldsload **2100 gas**) to ensure you don't read past the array's end. You can avoid this lookup by using a `mapping` and storing the number of entries in a separate storage variable. In cases where you have sentinel values (e.g. 'zero' means invalid), you can avoid length checks

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

17:      string[] public attributes = ["head", "eyes", "mouth", "body", "hands", "feet"];

20:      uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

30:      mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L17-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L30-L30

```solidity
File: src/FighterFarm.sol

36:      uint8[2] public maxRerollsAllowed = [3, 3];

42:      uint8[2] public generation = [0, 0];

69:      FighterOps.Fighter[] public fighters;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L42-L42,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L69-L69

```solidity
File: src/GameItems.sol

55:      GameItemAttributes[] public allGameItemAttributes;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L55-L55

```solidity
File: src/MergingPool.sol

54:      mapping(uint256 => address[]) public winnerAddresses;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L54-L54

### [G-09]<a name="g-09"></a> Remove or replace unused state variables

Saves a storage slot. If the variable is assigned a non-zero value, saves Gsset (**20000 gas**). If it's assigned a zero value, saves Gsreset (**2900 gas**). If the variable remains unassigned, there is no gas savings unless the variable is `public`, in which case the compiler-generated non-payable getter deployment cost is saved. If the state variable is overriding an interface's public function, mark the variable as `constant` or `immutable` so that it does not use a storage slot

*There are 1 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

52:       string public symbol = "AGI";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L52

### [G-10]<a name="g-10"></a> Use `Array.unsafeAccess()` to avoid repeated array length checks

When using storage arrays, solidity adds an internal lookup of the array's length (a Gcoldsload **2100 gas**) to ensure you don't read past the array's end. You can avoid this lookup by using [`Array.unsafeAccess()`](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/94697be8a3f0dfcd95dfb13ffbd39b5973f5c65d/contracts/utils/Arrays.sol#L57) in cases where the length has already been checked, as is the case with the instances below

*There are 16 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

49:              attributeProbabilities[0][attributes[i]] = probabilities[i];

49:              attributeProbabilities[0][attributes[i]] = probabilities[i];

50:              attributeToDnaDivisor[attributes[i]] = defaultAttributeDivisor[i];

50:              attributeToDnaDivisor[attributes[i]] = defaultAttributeDivisor[i];

74:              attributeToDnaDivisor[attributes[i]] = attributeDivisors[i];

107:                     uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;

108:                     uint256 attributeIndex = dnaToIndex(generation, rarityRank, attributes[i]);

137:             attributeProbabilities[generation][attributes[i]] = probabilities[i];

137:             attributeProbabilities[generation][attributes[i]] = probabilities[i];

149:             attributeProbabilities[generation][attributes[i]] = new uint8[](0);

149:             attributeProbabilities[generation][attributes[i]] = new uint8[](0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L49-L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L49-L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L50-L50,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L50-L50,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L108-L108,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L137-L137,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L137-L137,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L149-L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L149-L149

```solidity
File: src/FighterFarm.sol

214:                 uint256(keccak256(abi.encode(msg.sender, fighters.length))),

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L214-L214

```solidity
File: src/MergingPool.sol

151:             winnersLength = winnerAddresses[currentRound].length;

153:                 if (msg.sender == winnerAddresses[currentRound][j]) {

177:             winnersLength = winnerAddresses[currentRound].length;

179:                 if (claimer == winnerAddresses[currentRound][j]) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L151-L151,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L153-L153,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L179-L179

### [G-11]<a name="g-11"></a> State variables only set in the constructor should be declared `immutable`

Avoids a Gsset (**20000 gas**) in the constructor, and replaces the first access in each transaction (Gcoldsload - **2100 gas**) and each access thereafter (Gwarmacces - **100 gas**) with a `PUSH32` (**3 gas**). 

While `string`s are not value types, and therefore cannot be `immutable`/`constant` if not hard-coded outside of the constructor, the same behavior can be achieved by making the current contract `abstract` with `virtual` functions for the `string` accessors, and having a child contract override the functions with the hard-coded implementation-specific values.

*There are 12 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

48:      address public treasuryAddress;

54:      address _delegatedAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L54-L54

```solidity
File: src/GameItems.sol

58:      address public treasuryAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L58-L58

```solidity
File: src/MergingPool.sol

38:      address _rankedBattleAddress;

41:      FighterFarm _fighterFarmInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L38-L38,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L41-L41

```solidity
File: src/Neuron.sol

46:      address public treasuryAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L46-L46

```solidity
File: src/RankedBattle.sol

85:      FighterFarm _fighterFarmInstance;

88:      VoltageManager _voltageManagerInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L88-L88

```solidity
File: src/StakeAtRisk.sol

30:      address public treasuryAddress;

33:      address _rankedBattleAddress;

36:      Neuron _neuronInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L30-L30,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L36-L36

```solidity
File: src/VoltageManager.sol

26:      GameItems _gameItemsContractInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L26-L26

### [G-12]<a name="g-12"></a> State variables only set in their definitions should be declared `constant`

Avoids a Gsset (**20000 gas**) at deployment, and replaces the first access in each transaction (Gcoldsload - **2100 gas**) and each access thereafter (Gwarmacces - **100 gas**) with a `PUSH32` (**3 gas**).

*There are 3 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

39:      uint256 public rerollCost = 1000 * 10**18;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39

```solidity
File: src/GameItems.sol

49:      string public name = "AI Arena Game Items";

52:      string public symbol = "AGI";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L49-L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L52-L52

### [G-13]<a name="g-13"></a> State variables can be packed into fewer storage slots by truncating timestamp bytes

By using a `uint32` rather than a larger type for variables that track timestamps, one can save gas by using fewer storage slots per struct, at the expense of the protocol breaking after the year 2106 (when `uint32` wraps). If this is an acceptable tradeoff, if variables occupying the same slot are both written the same function or by the constructor, avoids a separate Gsset (**20000 gas**). Reads of the variables can also be cheaper

*There are 2 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

/// @audit Variable ordering with 11 slots instead of the current 12:
///           string(32):name, string(32):symbol, user-defined[](32):allGameItemAttributes, mapping(32):allowanceRemaining, mapping(32):dailyAllowanceReplenishTime, mapping(32):allowedBurningAddresses, mapping(32):isAdmin, mapping(32):_tokenURIs, address(20):treasuryAddress, uint64(8):_itemCount, address(20):_ownerAddress, address(20):_neuronInstance
10:   contract GameItems is ERC1155 {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10

```solidity
File: src/MergingPool.sol

/// @audit Variable ordering with 10 slots instead of the current 11:
///           uint256(32):roundId, uint256(32):totalPoints, mapping(32):numRoundsClaimed, mapping(32):fighterPoints, mapping(32):winnerAddresses, mapping(32):isSelectionComplete, mapping(32):isAdmin, address(20):_ownerAddress, uint64(8):winnersPerPeriod, address(20):_rankedBattleAddress, address(20):_fighterFarmInstance
9:    contract MergingPool {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9

### [G-14]<a name="g-14"></a> Avoid updating storage when the value hasn't changed

If the old value is equal to the new value, not re-storing the value will avoid a Gsreset (**2900 gas**), potentially at the expense of a Gcoldsload (**2100 gas**) or a Gwarmaccess (**100 gas**)

*There are 15 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit _mergingPoolAddress:  setMergingPoolAddress()
171      function setMergingPoolAddress(address mergingPoolAddress) external {
172          require(msg.sender == _ownerAddress);
173          _mergingPoolAddress = mergingPoolAddress;
174:     }

/// @audit _tokenURIs:  setTokenURI()
180      function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {
181          require(msg.sender == _delegatedAddress);
182          _tokenURIs[tokenId] = newTokenURI;
183:     }

/// @audit fighterStaked:  updateFighterStaking()
268      function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {
269          require(hasStakerRole[msg.sender]);
270          fighterStaked[tokenId] = stakingStatus;
271          if (stakingStatus) {
272              emit Locked(tokenId);
273          } else {
274              emit Unlocked(tokenId);
275          }
276:     }

/// @audit fighters:  updateModel()
283      function updateModel(
284          uint256 tokenId, 
285          string calldata modelHash,
286          string calldata modelType
287      ) 
288          external
289      {
290          require(msg.sender == ownerOf(tokenId));
291          fighters[tokenId].modelHash = modelHash;
292          fighters[tokenId].modelType = modelType;
293          numTrained[tokenId] += 1;
294          totalNumTrained += 1;
295:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L180-L183,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L268-L276,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L283-L295

```solidity
File: src/GameItems.sol

/// @audit _tokenURIs:  setTokenURI()
194      function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
195          require(isAdmin[msg.sender]);
196          _tokenURIs[tokenId] = _tokenURI;
197:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L194-L197

```solidity
File: src/MergingPool.sol

/// @audit winnersPerPeriod:  updateWinnersPerPeriod()
106      function updateWinnersPerPeriod(uint256 newWinnersPerPeriodAmount) external {
107          require(isAdmin[msg.sender]);
108          winnersPerPeriod = newWinnersPerPeriodAmount;
109:     }    

/// @audit totalPoints:  addPoints()
/// @audit fighterPoints:  addPoints()
195      function addPoints(uint256 tokenId, uint256 points) public {
196          require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");
197          fighterPoints[tokenId] += points;
198          totalPoints += points;
199          emit PointsAdded(tokenId, points);
200:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L200,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L200

```solidity
File: src/RankedBattle.sol

/// @audit _gameServerAddress:  setGameServerAddress()
184      function setGameServerAddress(address gameServerAddress) external {
185          require(msg.sender == _ownerAddress);
186          _gameServerAddress = gameServerAddress;
187:     }

/// @audit _stakeAtRiskAddress:  setStakeAtRiskAddress()
192      function setStakeAtRiskAddress(address stakeAtRiskAddress) external {
193          require(msg.sender == _ownerAddress);
194          _stakeAtRiskAddress = stakeAtRiskAddress;
195          _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);
196:     }

/// @audit bpsLostPerLoss:  setBpsLostPerLoss()
226      function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {
227          require(isAdmin[msg.sender]);
228          bpsLostPerLoss = bpsLostPerLoss_;
229:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L187,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L196,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L229

```solidity
File: src/StakeAtRisk.sol

/// @audit roundId:  setNewRound()
78       function setNewRound(uint256 roundId_) external {
79           require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");
80           bool success = _sweepLostStake();
81           if (success) {
82               roundId = roundId_;
83           }
84:      }

/// @audit amountLost:  updateAtRiskRecords()
/// @audit totalStakeAtRisk:  updateAtRiskRecords()
/// @audit stakeAtRisk:  updateAtRiskRecords()
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L78-L84,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

### [G-15]<a name="g-15"></a> Assembly: Use scratch space for building calldata

If an external call's calldata can fit into two or fewer words, use the scratch space to build the calldata, rather than allowing Solidity to do a memory expansion.

*There are 24 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

251:             _mintpassInstance.burn(mintpassIdsToBurn[i]);

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

375:         _neuronInstance.approveSpender(msg.sender, rerollCost);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L251-L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L373-L373,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L375-L375

```solidity
File: src/GameItems.sol

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

163:         _neuronInstance.approveSpender(msg.sender, price);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L150-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L163-L163

```solidity
File: src/MergingPool.sol

125:             currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L125-L125

```solidity
File: src/RankedBattle.sol

237:         _stakeAtRiskInstance.setNewRound(roundId);

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

258              stakingFactor[tokenId] = _getStakingFactor(
259                  tokenId, 
260                  _stakeAtRiskInstance.getStakeAtRisk(tokenId)
261:             );

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

277          stakingFactor[tokenId] = _getStakingFactor(
278              tokenId, 
279              _stakeAtRiskInstance.getStakeAtRisk(tokenId)
280:         );

283:         bool success = _neuronInstance.transfer(msg.sender, amount);

308:             _neuronInstance.mint(msg.sender, claimableNRN);

333:         address fighterOwner = _fighterFarmInstance.ownerOf(tokenId);

336:             _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 

337:             _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST

341:         uint256 stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

346:             _voltageManagerInstance.spendVoltage(fighterOwner, VOLTAGE_COST);

430:         stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

493:                 bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L237-L237,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L247-L247,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L258-L261,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L277-L280,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L283-L283,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L308-L308,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L333-L333,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L336-L336,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L337-L337,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L341-L341,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L430-L430,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L493-L493

```solidity
File: src/StakeAtRisk.sol

100:         bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

143:         return _neuronInstance.transfer(treasuryAddress, totalStakeAtRisk[roundId]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L100-L100,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L143-L143

### [G-16]<a name="g-16"></a> State variables should be cached in stack variables rather than re-reading them from storage

The instances below point to the second+ access of a state variable within a function. Caching of a state variable replaces each Gwarmaccess (**100 gas**) with a much cheaper stack read. Other less obvious fixes/optimizations include having local memory caches of state variable structs, or having local caches of state variable contracts/addresses.

*There are 78 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit attributes on line 47
49:               attributeProbabilities[0][attributes[i]] = probabilities[i];

/// @audit attributes on line 49
50:               attributeToDnaDivisor[attributes[i]] = defaultAttributeDivisor[i];

/// @audit attributes on line 70
72:           uint256 attributesLength = attributes.length;

/// @audit attributes on line 72
74:               attributeToDnaDivisor[attributes[i]] = attributeDivisors[i];

/// @audit attributes on line 96
98:               uint256 attributesLength = attributes.length;

/// @audit attributes on line 98
107:                      uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;

/// @audit attributes on line 107
108:                      uint256 attributeIndex = dnaToIndex(generation, rarityRank, attributes[i]);

/// @audit attributes on line 135
137:              attributeProbabilities[generation][attributes[i]] = probabilities[i];

/// @audit attributes on line 147
149:              attributeProbabilities[generation][attributes[i]] = new uint8[](0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L50,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L72,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L108,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L137,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L149

```solidity
File: src/FighterFarm.sol

/// @audit rerollCost on line 373
375:          _neuronInstance.approveSpender(msg.sender, rerollCost);

/// @audit rerollCost on line 375
376:          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

/// @audit generation on line 131
133:          return generation[fighterType];

/// @audit generation on line 512
524:                  generation[fighterType],

/// @audit generation on line 524
530:          FighterOps.fighterCreatedEmitter(newId, weight, element, generation[fighterType]);

/// @audit _mintpassInstance on line 250
251:              _mintpassInstance.burn(mintpassIdsToBurn[i]);

/// @audit _neuronInstance on line 373
375:          _neuronInstance.approveSpender(msg.sender, rerollCost);

/// @audit _neuronInstance on line 375
376:          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

/// @audit fighters on line 291
292:          fighters[tokenId].modelType = modelType;

/// @audit fighters on line 381
382:              fighters[tokenId].weight = weight;

/// @audit fighters on line 382
383:              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(

/// @audit fighters on line 383
386:                  fighters[tokenId].iconsType,

/// @audit fighters on line 386
387:                  fighters[tokenId].dendroidBool

/// @audit fighters on line 507
516:          fighters.push(

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L375,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L376,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L133,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L524,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L530,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L375,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L376,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L292,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L382,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L386,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L387,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L516

```solidity
File: src/GameItems.sol

/// @audit allGameItemAttributes on line 149
152:              allGameItemAttributes[tokenId].finiteSupply == false || 

/// @audit allGameItemAttributes on line 152
154:                  allGameItemAttributes[tokenId].finiteSupply == true && 

/// @audit allGameItemAttributes on line 154
155:                  quantity <= allGameItemAttributes[tokenId].itemsRemaining

/// @audit allGameItemAttributes on line 155
170:              if (allGameItemAttributes[tokenId].finiteSupply) {

/// @audit allGameItemAttributes on line 170
171:                  allGameItemAttributes[tokenId].itemsRemaining -= quantity;

/// @audit _ownerAddress on line 96
98:           isAdmin[_ownerAddress] = true;

/// @audit _itemCount on line 231
233:          setTokenURI(_itemCount, tokenURI);

/// @audit _itemCount on line 233
234:          _itemCount += 1;

/// @audit _neuronInstance on line 150
163:          _neuronInstance.approveSpender(msg.sender, price);

/// @audit _neuronInstance on line 163
164:          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);

/// @audit allGameItemAttributes[tokenId].finiteSupply on line 152
154:                  allGameItemAttributes[tokenId].finiteSupply == true && 

/// @audit allGameItemAttributes[tokenId].finiteSupply on line 154
170:              if (allGameItemAttributes[tokenId].finiteSupply) {

/// @audit allGameItemAttributes[tokenId].itemsRemaining on line 155
171:                  allGameItemAttributes[tokenId].itemsRemaining -= quantity;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L154,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L170,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L233,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L234,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L163,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L154,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L170,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171

```solidity
File: src/MergingPool.sol

/// @audit roundId on line 121
129:          winnerAddresses[roundId] = currentWinnerAddresses;

/// @audit roundId on line 129
130:          isSelectionComplete[roundId] = true;

/// @audit roundId on line 130
131:          roundId += 1;

/// @audit _ownerAddress on line 76
79:           isAdmin[_ownerAddress] = true;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L79

```solidity
File: src/Neuron.sol

/// @audit treasuryAddress on line 72
74:           _mint(treasuryAddress, INITIAL_TREASURY_MINT);

/// @audit treasuryAddress on line 140
143:          transferFrom(treasuryAddress, msg.sender, amount);

/// @audit _ownerAddress on line 71
73:           isAdmin[_ownerAddress] = true;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L143,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L73

```solidity
File: src/RankedBattle.sol

/// @audit roundId on line 235
236:          roundId += 1;

/// @audit roundId on line 236
237:          _stakeAtRiskInstance.setNewRound(roundId);

/// @audit roundId on line 237
/// @audit roundId on line 238
238:          rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];

/// @audit roundId on line 248
262:              _calculatedStakingFactor[tokenId][roundId] = true;

/// @audit roundId on line 281
282:          hasUnstaked[tokenId][roundId] = true;

/// @audit roundId on line 295
299:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

/// @audit roundId on line 366
367:            rankedNrnDistribution[roundId], 

/// @audit roundId on line 367
368:            totalAccumulatedPoints[roundId]

/// @audit roundId on line 433
435:              _calculatedStakingFactor[tokenId][roundId] = true;

/// @audit roundId on line 435
466:              accumulatedPointsPerFighter[tokenId][roundId] += points;

/// @audit roundId on line 466
467:              accumulatedPointsPerAddress[fighterOwner][roundId] += points;

/// @audit roundId on line 467
468:              totalAccumulatedPoints[roundId] += points;

/// @audit roundId on line 468
479:              if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {

/// @audit roundId on line 479
482:                  if (points > accumulatedPointsPerFighter[tokenId][roundId]) {

/// @audit roundId on line 482
483:                      points = accumulatedPointsPerFighter[tokenId][roundId];

/// @audit roundId on line 483
485:                  accumulatedPointsPerFighter[tokenId][roundId] -= points;

/// @audit roundId on line 485
486:                  accumulatedPointsPerAddress[fighterOwner][roundId] -= points;

/// @audit roundId on line 486
487:                  totalAccumulatedPoints[roundId] -= points;

/// @audit _stakeAtRiskAddress on line 194
195:          _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);

/// @audit _ownerAddress on line 152
156:          isAdmin[_ownerAddress] = true;

/// @audit _neuronInstance on line 247
250:          _neuronInstance.approveStaker(msg.sender, address(this), amount);

/// @audit _neuronInstance on line 250
251:          bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);

/// @audit _fighterFarmInstance on line 246
254:                  _fighterFarmInstance.updateFighterStaking(tokenId, true);

/// @audit _fighterFarmInstance on line 271
286:                  _fighterFarmInstance.updateFighterStaking(tokenId, false);

/// @audit _voltageManagerInstance on line 336
337:              _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST

/// @audit _voltageManagerInstance on line 337
346:              _voltageManagerInstance.spendVoltage(fighterOwner, VOLTAGE_COST);

/// @audit _stakeAtRiskInstance on line 430
461:                  _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);

/// @audit _stakeAtRiskInstance on line 461
495:                      _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L236,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L237,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L238,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L238,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L262,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L282,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L367,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L368,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L435,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L466,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L467,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L468,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L479,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L482,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L483,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L485,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L486,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L487,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L254,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L286,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L337,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L461,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L495

```solidity
File: src/StakeAtRisk.sol

/// @audit roundId on line 96
102:              stakeAtRisk[roundId][fighterId] -= nrnToReclaim;

/// @audit roundId on line 102
103:              totalStakeAtRisk[roundId] -= nrnToReclaim;

/// @audit roundId on line 123
124:          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;

/// @audit _rankedBattleAddress on line 94
100:          bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L100

```solidity
File: src/VoltageManager.sol

/// @audit _ownerAddress on line 52
54:           isAdmin[_ownerAddress] = true;

/// @audit _gameItemsContractInstance on line 95
96:           _gameItemsContractInstance.burn(msg.sender, 0, 1);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L54,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L96

### [G-17]<a name="g-17"></a> Use the inputs/results of assignments rather than re-reading state variables

When a state variable is assigned, it saves gas to use the value being assigned, later in the function, rather than re-reading the state variable itself. If needed, it can also be stored to a local variable, and be used in that way. Both options avoid a Gwarmaccess (**100 gas**). Note that if the operation is, say `+=`, the assignment also results in a value which can be used. The instances below point to the first reference after the assignment, since later references are already covered by issues describing the caching of state variable values.

*There are 3 instance(s) of this issue:*

```solidity
File: src/Neuron.sol

/// @audit use result of assignment of treasuryAddress, here
74:          _mint(treasuryAddress, INITIAL_TREASURY_MINT);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L74-L74

```solidity
File: src/RankedBattle.sol

/// @audit use result of assignment of _stakeAtRiskAddress, here
195:         _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);

/// @audit use result of assignment of roundId, here
237:         _stakeAtRiskInstance.setNewRound(roundId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L195-L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L237-L237

### [G-18]<a name="g-18"></a> Assembly: Use scratch space for calculating small `keccak256` hashes

If the arguments to the encode call can fit into the scratch space (two words or fewer), then it's more efficient to use assembly to generate the hash (**80 gas**):
`keccak256(abi.encodePacked(x, y))` -> `assembly {mstore(0x00, a); mstore(0x20, b); let hash := keccak256(0x00, 0x40); }`

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

214:                 uint256(keccak256(abi.encode(msg.sender, fighters.length))),

324:             uint256(keccak256(abi.encode(msg.sender, fighters.length))), 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L214-L214,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L324-L324

### [G-19]<a name="g-19"></a> `++i`/`i++` should be `unchecked{++i}`/`unchecked{i++}` when it is not possible for them to overflow, as is the case when used in `for`- and `while`-loops

The `unchecked` keyword is new in solidity version 0.8.0, so this only applies to that version or higher, which these instances are. This saves **30-40 gas [per loop](https://gist.github.com/hrkrshnn/ee8fabd532058307229d65dcd5836ddc#the-increment-in-for-loop-post-condition-can-be-made-unchecked)**

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:           for (uint8 i = 0; i < attributesLength; i++) {

73:           for (uint8 i = 0; i < attributesLength; i++) {

99:               for (uint8 i = 0; i < attributesLength; i++) {

136:          for (uint8 i = 0; i < attributesLength; i++) {

148:          for (uint8 i = 0; i < attributesLength; i++) {

178:          for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178

```solidity
File: src/FighterFarm.sol

211:          for (uint16 i = 0; i < totalToMint; i++) {

249:          for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249

```solidity
File: src/MergingPool.sol

124:          for (uint256 i = 0; i < winnersLength; i++) {

149:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:              for (uint32 j = 0; j < winnersLength; j++) {

176:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:              for (uint32 j = 0; j < winnersLength; j++) {

207:          for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207

```solidity
File: src/Neuron.sol

131:          for (uint32 i = 0; i < recipientsLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131

```solidity
File: src/RankedBattle.sol

299:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

390:          for (uint32 i = lowerBound; i < roundId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L390

### [G-20]<a name="g-20"></a> `do`-`while` is cheaper than `for`-loops when the initial check can be skipped

`for (uint256 i; i < len; ++i){ ... }` -> `do { ...; ++i } while (i < len);`

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:          for (uint8 i = 0; i < attributesLength; i++) {

73:          for (uint8 i = 0; i < attributesLength; i++) {

99:              for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136-L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178-L178

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L249

```solidity
File: src/MergingPool.sol

124:         for (uint256 i = 0; i < winnersLength; i++) {

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:             for (uint32 j = 0; j < winnersLength; j++) {

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124-L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L149-L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178-L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207-L207

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131-L131

```solidity
File: src/RankedBattle.sol

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

390:         for (uint32 i = lowerBound; i < roundId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L390-L390

### [G-21]<a name="g-21"></a> Avoid contract existence checks by using low-level calls

Prior to 0.8.10 the compiler inserted extra code, including `EXTCODESIZE` (**100 gas**), to check for contract existence for external function calls. In more recent solidity versions, the compiler will not insert these checks if the external call has a return value. Similar behavior can be achieved in earlier versions by using low-level calls, since low-level calls never check for contract existence. Note that it [still](https://gist.github.com/IllIllI000/fbd5861a8e587cb1c1aab55a106bb9a7) saves gas, even if the return value is not directly used.

*There are 28 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

206:         require(Verification.verify(msgHash, signature, _delegatedAddress));

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

376:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

383              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
384                  newDna,
385                  generation[fighterType],
386                  fighters[tokenId].iconsType,
387                  fighters[tokenId].dendroidBool
388:             );

416:         return super.supportsInterface(_interfaceId);

436:         return FighterOps.viewFighterInfo(fighters[tokenId], ownerOf(tokenId));

510          FighterOps.FighterPhysicalAttributes memory attrs = _aiArenaHelperInstance.createPhysicalAttributes(
511              newDna,
512              generation[fighterType],
513              iconsType,
514              dendroidBool
515:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L206-L206,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L373-L373,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L376-L376,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L388,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L416-L416,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L436-L436,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L510-L515

```solidity
File: src/GameItems.sol

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

164:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);

261:         return super.uri(tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L150-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L261-L261

```solidity
File: src/MergingPool.sol

125:             currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L125-L125

```solidity
File: src/RankedBattle.sol

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

251:         bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);

260:                 _stakeAtRiskInstance.getStakeAtRisk(tokenId)

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

279:             _stakeAtRiskInstance.getStakeAtRisk(tokenId)

283:         bool success = _neuronInstance.transfer(msg.sender, amount);

333:         address fighterOwner = _fighterFarmInstance.ownerOf(tokenId);

336:             _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 

337:             _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST

341:         uint256 stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

430:         stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

493:                 bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L247-L247,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L251-L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L260-L260,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L279-L279,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L283-L283,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L333-L333,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L336-L336,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L337-L337,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L341-L341,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L430-L430,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L493-L493

```solidity
File: src/StakeAtRisk.sol

100:         bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

143:         return _neuronInstance.transfer(treasuryAddress, totalStakeAtRisk[roundId]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L100-L100,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L143-L143

```solidity
File: src/VoltageManager.sol

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95

### [G-22]<a name="g-22"></a> Avoid transferring amounts of zero in order to save gas

Skipping the external call when nothing will be transferred, will save at least **100 gas**

*There are 5 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

376:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L376-L376

```solidity
File: src/GameItems.sol

164:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);

302:         super.safeTransferFrom(from, to, tokenId, amount, data);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L302-L302

```solidity
File: src/RankedBattle.sol

283:         bool success = _neuronInstance.transfer(msg.sender, amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L283-L283

```solidity
File: src/StakeAtRisk.sol

100:         bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L100-L100

### [G-23]<a name="g-23"></a> Consider pre-calculating the address of `address(this)` to save gas

Use `foundry`'s [`script.sol`](https://book.getfoundry.sh/reference/forge-std/compute-create-address) or `solady`'s [`LibRlp.sol`](https://github.com/Vectorized/solady/blob/main/src/utils/LibRLP.sol) to save the value in a constant, which will avoid having to spend gas to push the value on the stack every time it's used.

*There are 2 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

250:         _neuronInstance.approveStaker(msg.sender, address(this), amount);

251:         bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L251-L251

### [G-24]<a name="g-24"></a> Consider using `ERC721A` over `ERC721`

[ERC721A](https://www.azuki.com/erc721a) is much more gas-efficient for minting multiple NFTs in the same transaction

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

### [G-25]<a name="g-25"></a> Consider using `solady`'s token contracts to save gas

They're written using heavily-optimized assembly, and will your users a lot of gas

*There are 4 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit ERC721
/// @audit ERC721Enumerable
16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

/// @audit ERC1155
10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/Neuron.sol

/// @audit ERC20
11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

### [G-26]<a name="g-26"></a> Consider using solady's `FixedPointMathLib`

Saves gas, and works to avoid unnecessary [overflows](https://github.com/Vectorized/solady/blob/6cce088e69d6e46671f2f622318102bd5db77a65/src/utils/FixedPointMathLib.sol#L267).

*There are 5 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

301              claimableNRN += (
302                  accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   
303:             ) / totalAccumulatedPoints[currentRound];

392              claimableNRN += (
393                  accumulatedPointsPerAddress[claimer][i] * nrnDistribution
394:             ) / totalAccumulatedPoints[i];

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

449:             uint256 mergingPoints = (points * mergingPortion) / 100;

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L301-L303,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L392-L394,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L439-L439,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L449-L449,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L528-L528

### [G-27]<a name="g-27"></a> Multiple `address`/ID mappings can be combined into a single `mapping` of an `address`/ID to a `struct`

Saves a storage slot for each of the removed mappings (i.e. this finding is not about runtime savings). The instances below refer to both mappings using the same key in the same function, so the mappings are related.

*There are 10 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit combine into a `struct`: _tokenURIs,numRerolls
16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

/// @audit combine into a `struct`: isSelectionComplete,winnerAddresses
9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/RankedBattle.sol

/// @audit combine into a `struct`: _calculatedStakingFactor,amountStaked,hasUnstaked,stakingFactor
/// @audit combine into a `struct`: accumulatedPointsPerAddress,amountClaimed,numRoundsClaimed
/// @audit combine into a `struct`: accumulatedPointsPerAddress,numRoundsClaimed
/// @audit combine into a `struct`: rankedNrnDistribution,totalAccumulatedPoints
/// @audit combine into a `struct`: _calculatedStakingFactor,accumulatedPointsPerFighter,amountStaked,stakingFactor
16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

/// @audit combine into a `struct`: stakeAtRisk,totalStakeAtRisk
10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

/// @audit combine into a `struct`: ownerVoltage,ownerVoltageReplenishTime
9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [G-28]<a name="g-28"></a> Reduce deployment costs by tweaking contracts' metadata

See [this](https://www.rareskills.io/post/solidity-metadata) link, at its bottom, for full details

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/FighterFarm.sol

16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/Neuron.sol

11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

```solidity
File: src/RankedBattle.sol

16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [G-29]<a name="g-29"></a> Reduce gas usage by moving to Solidity 0.8.19 or later

See [this](https://blog.soliditylang.org/2023/02/22/solidity-0.8.19-release-announcement/#preventing-dead-code-in-runtime-bytecode) link for the full details. Additionally, every new release has new optimizations, which will save gas.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

3:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L3-L3

```solidity
File: src/FighterFarm.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L2-L2

```solidity
File: src/GameItems.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L2-L2

```solidity
File: src/MergingPool.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L2-L2

```solidity
File: src/Neuron.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L2-L2

```solidity
File: src/RankedBattle.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L2-L2

```solidity
File: src/StakeAtRisk.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L2-L2

```solidity
File: src/VoltageManager.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L2-L2

### [G-30]<a name="g-30"></a> State variable written in a loop

The code should be refactored such that updates made to the state variable are instead accumulated/tracked in a local variable, then be written a single time outside the loop, converting a Gsreset (**2900 gas**) to a stack write for each iteration

*There are 1 instance(s) of this issue:*

```solidity
File: src/MergingPool.sol

/// @audit totalPoints
124          for (uint256 i = 0; i < winnersLength; i++) {
125              currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);
126              totalPoints -= fighterPoints[winners[i]];
127              fighterPoints[winners[i]] = 0;
128:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L126-L126

### [G-31]<a name="g-31"></a> Using `bool`s for storage incurs overhead

```solidity
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.
```
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/58f635312aa21f947cae5f8578638a85aa2519f5/contracts/security/ReentrancyGuard.sol#L23-L27
Use `uint256(0)` and `uint256(1)` for true/false to avoid a Gwarmaccess (**[100 gas](https://gist.github.com/IllIllI000/1b70014db712f8572a72378321250058)**) for the extra SLOAD

*There are 12 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

76:      mapping(uint256 => bool) public fighterStaked;

82:      mapping(address => bool) public hasStakerRole;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L76-L76,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L82-L82

```solidity
File: src/GameItems.sol

80:      mapping(address => bool) public allowedBurningAddresses;

83:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L80-L80,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L83-L83

```solidity
File: src/MergingPool.sol

57:      mapping(uint256 => bool) public isSelectionComplete;

60:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L57-L57,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L60-L60

```solidity
File: src/Neuron.sol

56:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L56-L56

```solidity
File: src/RankedBattle.sol

101:     mapping(address => bool) public isAdmin;

125:     mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

134:     mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L125-L125,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L134-L134

```solidity
File: src/VoltageManager.sol

33:      mapping(address => bool) public allowedVoltageSpenders;

42:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L42-L42

### [G-32]<a name="g-32"></a> State variable read in a loop

The state variable should be cached in and read from a local variable, or accumulated in a local variable then written to storage once outside of the loop, rather than reading/updating it on every iteration of the loop, which will replace each Gwarmaccess (**100 gas**) with a much cheaper stack read.

*There are 8 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit fighters
211          for (uint16 i = 0; i < totalToMint; i++) {
212              _createNewFighter(
213                  msg.sender, 
214                  uint256(keccak256(abi.encode(msg.sender, fighters.length))),
215                  modelHashes[i], 
216                  modelTypes[i],
217                  i < numToMint[0] ? 0 : 1,
218                  0,
219                  [uint256(100), uint256(100)]
220              );
221:         }

/// @audit _mintpassInstance
/// @audit _mintpassInstance
249          for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {
250              require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));
251              _mintpassInstance.burn(mintpassIdsToBurn[i]);
252              _createNewFighter(
253                  msg.sender, 
254                  uint256(keccak256(abi.encode(mintPassDnas[i]))), 
255                  modelHashes[i], 
256                  modelTypes[i],
257                  fighterTypes[i],
258                  iconsTypes[i],
259                  [uint256(100), uint256(100)]
260              );
261:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L214-L214,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L251-L251

```solidity
File: src/MergingPool.sol

/// @audit _fighterFarmInstance
/// @audit totalPoints
124          for (uint256 i = 0; i < winnersLength; i++) {
125              currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);
126              totalPoints -= fighterPoints[winners[i]];
127              fighterPoints[winners[i]] = 0;
128:         }

/// @audit _fighterFarmInstance
149          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {
150              numRoundsClaimed[msg.sender] += 1;
151              winnersLength = winnerAddresses[currentRound].length;
152              for (uint32 j = 0; j < winnersLength; j++) {
153                  if (msg.sender == winnerAddresses[currentRound][j]) {
154                      _fighterFarmInstance.mintFromMergingPool(
155                          msg.sender,
156                          modelURIs[claimIndex],
157                          modelTypes[claimIndex],
158                          customAttributes[claimIndex]
159                      );
160                      claimIndex += 1;
161                  }
162              }
163:         }

/// @audit _fighterFarmInstance
152              for (uint32 j = 0; j < winnersLength; j++) {
153                  if (msg.sender == winnerAddresses[currentRound][j]) {
154                      _fighterFarmInstance.mintFromMergingPool(
155                          msg.sender,
156                          modelURIs[claimIndex],
157                          modelTypes[claimIndex],
158                          customAttributes[claimIndex]
159                      );
160                      claimIndex += 1;
161                  }
162:             }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L125-L125,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L154-L154,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L154-L154

```solidity
File: src/Neuron.sol

/// @audit treasuryAddress
131          for (uint32 i = 0; i < recipientsLength; i++) {
132              _approve(treasuryAddress, recipients[i], amounts[i]);
133:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L132-L132

### [G-33]<a name="g-33"></a> Multiple accesses of a mapping/array should use a local variable cache

The instances below point to the second+ access of a value inside a mapping/array, within a function. Caching a mapping's value in a local `storage` or `calldata` variable when the value is accessed [multiple times](https://gist.github.com/IllIllI000/ec23a57daa30a8f8ca8b9681c8ccefb0), saves **~42 gas per access** due to not having to recalculate the key's keccak256 hash (`Gkeccak256` - **30 gas**) and that calculation's associated stack operations. Caching an array's struct avoids recalculating the array offsets into memory/calldata

*There are 24 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit nftsClaimed...[]
209:         nftsClaimed[msg.sender][0] += numToMint[0];

/// @audit nftsClaimed...[]
210:         nftsClaimed[msg.sender][1] += numToMint[1];

/// @audit numRerolls...[]
378:             numRerolls[tokenId] += 1;

/// @audit numRerolls...[]
379:             uint256 dna = uint256(keccak256(abi.encode(msg.sender, tokenId, numRerolls[tokenId])));

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L209-L209,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L378-L378,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L379-L379

```solidity
File: src/GameItems.sol

/// @audit dailyAllowanceReplenishTime...[]
166:             if (dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp) {

/// @audit allowanceRemaining...[]
169:             allowanceRemaining[msg.sender][tokenId] -= quantity;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L166-L166,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L169-L169

```solidity
File: src/MergingPool.sol

/// @audit isSelectionComplete...[]
130:         isSelectionComplete[roundId] = true;

/// @audit numRoundsClaimed...[]
150:             numRoundsClaimed[msg.sender] += 1;

/// @audit winnerAddresses...[]
153:                 if (msg.sender == winnerAddresses[currentRound][j]) {

/// @audit winnerAddresses...[]
179:                 if (claimer == winnerAddresses[currentRound][j]) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L150-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L153-L153,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L179-L179

```solidity
File: src/RankedBattle.sol

/// @audit amountStaked...[]
256:             amountStaked[tokenId] += amount;

/// @audit amountStaked...[]
275:         amountStaked[tokenId] -= amount;

/// @audit amountStaked...[]
285:             if (amountStaked[tokenId] == 0) {

/// @audit numRoundsClaimed...[]
298:         uint32 lowerBound = numRoundsClaimed[msg.sender];

/// @audit numRoundsClaimed...[]
304:             numRoundsClaimed[msg.sender] += 1;

/// @audit amountStaked...[]
462:                 amountStaked[tokenId] += curStakeAtRisk;

/// @audit amountStaked...[]
476:             if (curStakeAtRisk > amountStaked[tokenId]) {

/// @audit amountStaked...[]
477:                 curStakeAtRisk = amountStaked[tokenId];

/// @audit accumulatedPointsPerFighter...[]
485:                 accumulatedPointsPerFighter[tokenId][roundId] -= points;

/// @audit amountStaked...[]
496:                     amountStaked[tokenId] -= curStakeAtRisk;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L275-L275,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L285-L285,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L298-L298,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L304-L304,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L462-L462,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L476-L476,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L477-L477,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L485-L485,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L496-L496

```solidity
File: src/StakeAtRisk.sol

/// @audit stakeAtRisk...[]
102:             stakeAtRisk[roundId][fighterId] -= nrnToReclaim;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L102-L102

```solidity
File: src/VoltageManager.sol

/// @audit ownerVoltage...[]
97:          ownerVoltage[msg.sender] = 100;

/// @audit ownerVoltage...[]
98:          emit VoltageRemaining(msg.sender, ownerVoltage[msg.sender]);

/// @audit ownerVoltage...[]
111:         emit VoltageRemaining(spender, ownerVoltage[spender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L97-L97,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L111-L111

### [G-34]<a name="g-34"></a> Multiple accesses of a storage array should use a local variable cache

The instances below point to the second+ access of a value inside a storage array, within a function. Caching an array index value in a local `storage` or `calldata` variable when the value is accessed [multiple times](https://gist.github.com/IllIllI000/ec23a57daa30a8f8ca8b9681c8ccefb0), saves **~42 gas per access** due to not having to recalculate the array's keccak256 hash (`Gkeccak256` - **30 gas**) and that calculation's associated stack operations.

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit attributes...[]
50:              attributeToDnaDivisor[attributes[i]] = defaultAttributeDivisor[i];

/// @audit attributes...[]
108:                     uint256 attributeIndex = dnaToIndex(generation, rarityRank, attributes[i]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L50-L50,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L108-L108

```solidity
File: src/FighterFarm.sol

/// @audit generation...[]
133:         return generation[fighterType];

/// @audit fighters...[]
292:         fighters[tokenId].modelType = modelType;

/// @audit fighters...[]
382:             fighters[tokenId].weight = weight;

/// @audit fighters...[]
383:             fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(

/// @audit fighters...[]
386:                 fighters[tokenId].iconsType,

/// @audit fighters...[]
387:                 fighters[tokenId].dendroidBool

/// @audit generation...[]
524:                 generation[fighterType],

/// @audit generation...[]
530:         FighterOps.fighterCreatedEmitter(newId, weight, element, generation[fighterType]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L133-L133,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L292-L292,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L382-L382,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L383,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L386-L386,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L387-L387,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L524-L524,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L530-L530

```solidity
File: src/GameItems.sol

/// @audit allGameItemAttributes...[]
152:             allGameItemAttributes[tokenId].finiteSupply == false || 

/// @audit allGameItemAttributes...[]
154:                 allGameItemAttributes[tokenId].finiteSupply == true && 

/// @audit allGameItemAttributes...[]
155:                 quantity <= allGameItemAttributes[tokenId].itemsRemaining

/// @audit allGameItemAttributes...[]
170:             if (allGameItemAttributes[tokenId].finiteSupply) {

/// @audit allGameItemAttributes...[]
171:                 allGameItemAttributes[tokenId].itemsRemaining -= quantity;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L154-L154,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L155-L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L170-L170,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L171-L171

```solidity
File: src/MergingPool.sol

/// @audit winnerAddresses...[]
153:                 if (msg.sender == winnerAddresses[currentRound][j]) {

/// @audit winnerAddresses...[]
179:                 if (claimer == winnerAddresses[currentRound][j]) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L153-L153,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L179-L179

### [G-35]<a name="g-35"></a> Combine `mapping`s referenced in the same function by the same key

Reads and subsequent writes can also be cheaper when a function requires both values and they both fit in the same storage slot (i.e. runtime gas savings). Even if the values can't be packed, if both fields are accessed in the same function (as is the case for these instances), combining them can save **~42 gas per access** due to [not having to recalculate the key's keccak256 hash](https://gist.github.com/IllIllI000/639032d73e35d7e968ff58d8784bc445) (Gkeccak256 - 30 gas) and that calculation's associated stack operations.

*There are 16 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit combine into a `struct`: _tokenURIs,numRerolls
370      function reRoll(uint8 tokenId, uint8 fighterType) public {
371          require(msg.sender == ownerOf(tokenId));
372          require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);
373          require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");
374  
375          _neuronInstance.approveSpender(msg.sender, rerollCost);
376          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);
377          if (success) {
378              numRerolls[tokenId] += 1;
379              uint256 dna = uint256(keccak256(abi.encode(msg.sender, tokenId, numRerolls[tokenId])));
380              (uint256 element, uint256 weight, uint256 newDna) = _createFighterBase(dna, fighterType);
381              fighters[tokenId].element = element;
382              fighters[tokenId].weight = weight;
383              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
384                  newDna,
385                  generation[fighterType],
386                  fighters[tokenId].iconsType,
387                  fighters[tokenId].dendroidBool
388              );
389              _tokenURIs[tokenId] = "";
390          }
391:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370-L391

```solidity
File: src/GameItems.sol

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
147      function mint(uint256 tokenId, uint256 quantity) external {
148          require(tokenId < _itemCount);
149          uint256 price = allGameItemAttributes[tokenId].itemPrice * quantity;
150          require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");
151          require(
152              allGameItemAttributes[tokenId].finiteSupply == false || 
153              (
154                  allGameItemAttributes[tokenId].finiteSupply == true && 
155                  quantity <= allGameItemAttributes[tokenId].itemsRemaining
156              )
157          );
158          require(
159              dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 
160              quantity <= allowanceRemaining[msg.sender][tokenId]
161          );
162  
163          _neuronInstance.approveSpender(msg.sender, price);
164          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);
165          if (success) {
166              if (dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp) {
167                  _replenishDailyAllowance(tokenId);
168              }
169              allowanceRemaining[msg.sender][tokenId] -= quantity;
170              if (allGameItemAttributes[tokenId].finiteSupply) {
171                  allGameItemAttributes[tokenId].itemsRemaining -= quantity;
172              }
173              _mint(msg.sender, tokenId, quantity, bytes("random"));
174              emit BoughtItem(msg.sender, tokenId, quantity);
175          }
176:     }

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
268      function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {
269          uint256 remaining = allowanceRemaining[owner][tokenId];
270          if (dailyAllowanceReplenishTime[owner][tokenId] <= block.timestamp) {
271              remaining = allGameItemAttributes[tokenId].dailyAllowance;
272          }
273          return remaining;
274:     }

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
312      function _replenishDailyAllowance(uint256 tokenId) private {
313          allowanceRemaining[msg.sender][tokenId] = allGameItemAttributes[tokenId].dailyAllowance;
314          dailyAllowanceReplenishTime[msg.sender][tokenId] = uint32(block.timestamp + 1 days);
315:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268-L274,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L312-L315

```solidity
File: src/MergingPool.sol

/// @audit combine into a `struct`: isSelectionComplete,winnerAddresses
118      function pickWinner(uint256[] calldata winners) external {
119          require(isAdmin[msg.sender]);
120          require(winners.length == winnersPerPeriod, "Incorrect number of winners");
121          require(!isSelectionComplete[roundId], "Winners are already selected");
122          uint256 winnersLength = winners.length;
123          address[] memory currentWinnerAddresses = new address[](winnersLength);
124          for (uint256 i = 0; i < winnersLength; i++) {
125              currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);
126              totalPoints -= fighterPoints[winners[i]];
127              fighterPoints[winners[i]] = 0;
128          }
129          winnerAddresses[roundId] = currentWinnerAddresses;
130          isSelectionComplete[roundId] = true;
131          roundId += 1;
132:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L118-L132

```solidity
File: src/RankedBattle.sol

/// @audit combine into a `struct`: rankedNrnDistribution,totalAccumulatedPoints
233      function setNewRound() external {
234          require(isAdmin[msg.sender]);
235          require(totalAccumulatedPoints[roundId] > 0);
236          roundId += 1;
237          _stakeAtRiskInstance.setNewRound(roundId);
238          rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];
239:     }

/// @audit combine into a `struct`: _calculatedStakingFactor,amountStaked,hasUnstaked,stakingFactor
244      function stakeNRN(uint256 amount, uint256 tokenId) external {
245          require(amount > 0, "Amount cannot be 0");
246          require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
247          require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");
248          require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");
249  
250          _neuronInstance.approveStaker(msg.sender, address(this), amount);
251          bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);
252          if (success) {
253              if (amountStaked[tokenId] == 0) {
254                  _fighterFarmInstance.updateFighterStaking(tokenId, true);
255              }
256              amountStaked[tokenId] += amount;
257              globalStakedAmount += amount;
258              stakingFactor[tokenId] = _getStakingFactor(
259                  tokenId, 
260                  _stakeAtRiskInstance.getStakeAtRisk(tokenId)
261              );
262              _calculatedStakingFactor[tokenId][roundId] = true;
263              emit Staked(msg.sender, amount);
264          }
265:     }

/// @audit combine into a `struct`: _calculatedStakingFactor,amountStaked,hasUnstaked,stakingFactor
270      function unstakeNRN(uint256 amount, uint256 tokenId) external {
271          require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
272          if (amount > amountStaked[tokenId]) {
273              amount = amountStaked[tokenId];
274          }
275          amountStaked[tokenId] -= amount;
276          globalStakedAmount -= amount;
277          stakingFactor[tokenId] = _getStakingFactor(
278              tokenId, 
279              _stakeAtRiskInstance.getStakeAtRisk(tokenId)
280          );
281          _calculatedStakingFactor[tokenId][roundId] = true;
282          hasUnstaked[tokenId][roundId] = true;
283          bool success = _neuronInstance.transfer(msg.sender, amount);
284          if (success) {
285              if (amountStaked[tokenId] == 0) {
286                  _fighterFarmInstance.updateFighterStaking(tokenId, false);
287              }
288              emit Unstaked(msg.sender, amount);
289          }
290:     }

/// @audit combine into a `struct`: accumulatedPointsPerAddress,amountClaimed,numRoundsClaimed
294      function claimNRN() external {
295          require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");
296          uint256 claimableNRN = 0;
297          uint256 nrnDistribution;
298          uint32 lowerBound = numRoundsClaimed[msg.sender];
299          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {
300              nrnDistribution = getNrnDistribution(currentRound);
301              claimableNRN += (
302                  accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   
303              ) / totalAccumulatedPoints[currentRound];
304              numRoundsClaimed[msg.sender] += 1;
305          }
306          if (claimableNRN > 0) {
307              amountClaimed[msg.sender] += claimableNRN;
308              _neuronInstance.mint(msg.sender, claimableNRN);
309              emit Claimed(msg.sender, claimableNRN);
310          }
311:     }

/// @audit combine into a `struct`: rankedNrnDistribution,totalAccumulatedPoints
364      function getCurrentStakingData() external view returns(uint256, uint256, uint256) {
365        return (
366            roundId,
367            rankedNrnDistribution[roundId], 
368            totalAccumulatedPoints[roundId]
369        );
370:     }

/// @audit combine into a `struct`: accumulatedPointsPerAddress,numRoundsClaimed
386      function getUnclaimedNRN(address claimer) public view returns(uint256) {
387          uint256 claimableNRN = 0;
388          uint256 nrnDistribution;   
389          uint32 lowerBound = numRoundsClaimed[claimer];
390          for (uint32 i = lowerBound; i < roundId; i++) {
391              nrnDistribution = getNrnDistribution(i);
392              claimableNRN += (
393                  accumulatedPointsPerAddress[claimer][i] * nrnDistribution
394              ) / totalAccumulatedPoints[i];
395          }
396          return claimableNRN;
397:     } 

/// @audit combine into a `struct`: _calculatedStakingFactor,accumulatedPointsPerFighter,amountStaked,stakingFactor
416      function _addResultPoints(
417          uint8 battleResult, 
418          uint256 tokenId, 
419          uint256 eloFactor, 
420          uint256 mergingPortion,
421          address fighterOwner
422      ) 
423          private 
424      {
425          uint256 stakeAtRisk;
426          uint256 curStakeAtRisk;
427          uint256 points = 0;
428  
429          /// Check how many NRNs the fighter has at risk
430          stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);
431  
432          /// Calculate the staking factor if it has not already been calculated for this round 
433          if (_calculatedStakingFactor[tokenId][roundId] == false) {
434              stakingFactor[tokenId] = _getStakingFactor(tokenId, stakeAtRisk);
435              _calculatedStakingFactor[tokenId][roundId] = true;
436          }
437  
438          /// Potential amount of NRNs to put at risk or retrieve from the stake-at-risk contract
439          curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;
440          if (battleResult == 0) {
441              /// If the user won the match
442  
443              /// If the user has no NRNs at risk, then they can earn points
444              if (stakeAtRisk == 0) {
445                  points = stakingFactor[tokenId] * eloFactor;
446              }
447  
448              /// Divert a portion of the points to the merging pool
449              uint256 mergingPoints = (points * mergingPortion) / 100;
450              points -= mergingPoints;
451              _mergingPoolInstance.addPoints(tokenId, mergingPoints);
452  
453              /// Do not allow users to reclaim more NRNs than they have at risk
454              if (curStakeAtRisk > stakeAtRisk) {
455                  curStakeAtRisk = stakeAtRisk;
456              }
457  
458              /// If the user has stake-at-risk for their fighter, reclaim a portion
459              /// Reclaiming stake-at-risk puts the NRN back into their staking pool
460              if (curStakeAtRisk > 0) {
461                  _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);
462                  amountStaked[tokenId] += curStakeAtRisk;
463              }
464  
465              /// Add points to the fighter for this round
466              accumulatedPointsPerFighter[tokenId][roundId] += points;
467              accumulatedPointsPerAddress[fighterOwner][roundId] += points;
468              totalAccumulatedPoints[roundId] += points;
469              if (points > 0) {
470                  emit PointsChanged(tokenId, points, true);
471              }
472          } else if (battleResult == 2) {
473              /// If the user lost the match
474  
475              /// Do not allow users to lose more NRNs than they have in their staking pool
476              if (curStakeAtRisk > amountStaked[tokenId]) {
477                  curStakeAtRisk = amountStaked[tokenId];
478              }
479              if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {
480                  /// If the fighter has a positive point balance for this round, deduct points 
481                  points = stakingFactor[tokenId] * eloFactor;
482                  if (points > accumulatedPointsPerFighter[tokenId][roundId]) {
483                      points = accumulatedPointsPerFighter[tokenId][roundId];
484                  }
485                  accumulatedPointsPerFighter[tokenId][roundId] -= points;
486                  accumulatedPointsPerAddress[fighterOwner][roundId] -= points;
487                  totalAccumulatedPoints[roundId] -= points;
488                  if (points > 0) {
489                      emit PointsChanged(tokenId, points, false);
490                  }
491              } else {
492                  /// If the fighter does not have any points for this round, NRNs become at risk of being lost
493                  bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);
494                  if (success) {
495                      _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);
496                      amountStaked[tokenId] -= curStakeAtRisk;
497                  }
498              }
499          }
500:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L233-L239,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L244-L265,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L270-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L294-L311,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L364-L370,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386-L397,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L500

```solidity
File: src/StakeAtRisk.sol

/// @audit combine into a `struct`: stakeAtRisk,totalStakeAtRisk
93       function reclaimNRN(uint256 nrnToReclaim, uint256 fighterId, address fighterOwner) external {
94           require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
95           require(
96               stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97               "Fighter does not have enough stake at risk"
98           );
99   
100          bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);
101          if (success) {
102              stakeAtRisk[roundId][fighterId] -= nrnToReclaim;
103              totalStakeAtRisk[roundId] -= nrnToReclaim;
104              amountLost[fighterOwner] -= nrnToReclaim;
105              emit ReclaimedStake(fighterId, nrnToReclaim);
106          }
107:     }

/// @audit combine into a `struct`: stakeAtRisk,totalStakeAtRisk
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L93-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

```solidity
File: src/VoltageManager.sol

/// @audit combine into a `struct`: ownerVoltage,ownerVoltageReplenishTime
105      function spendVoltage(address spender, uint8 voltageSpent) public {
106          require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);
107          if (ownerVoltageReplenishTime[spender] <= block.timestamp) {
108              _replenishVoltage(spender);
109          }
110          ownerVoltage[spender] -= voltageSpent;
111          emit VoltageRemaining(spender, ownerVoltage[spender]);
112:     }

/// @audit combine into a `struct`: ownerVoltage,ownerVoltageReplenishTime
117      function _replenishVoltage(address owner) private {
118          ownerVoltage[owner] = 100;
119          ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);
120:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L105-L112,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L117-L120

### [G-36]<a name="g-36"></a> Usage of `uints`/`ints` smaller than 32 bytes (256 bits) incurs overhead

> When using elements that are smaller than 32 bytes, your contracts gas usage may be higher. This is because the EVM operates on 32 bytes at a time. Therefore, if the element is smaller than that, the EVM must use more operations in order to reduce the size of the element from 32 bytes to the desired size.

https://docs.soliditylang.org/en/v0.8.11/internals/layout_in_storage.html
Each operation involving a `uint8` costs an extra [**22-28 gas**](https://gist.github.com/IllIllI000/9388d20c70f9a4632eb3ca7836f54977) (depending on whether the other operand is also a variable of type `uint8`) as compared to ones involving `uint256`, due to the compiler having to clear the higher bits of the memory word before operating on the `uint8`, as well as the associated stack operations of doing so. Use a larger size then downcast where needed

*There are 1 instance(s) of this issue:*

```solidity
File: src/VoltageManager.sol

119:         ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L119-L119

### [G-37]<a name="g-37"></a> Functions guaranteed to revert when called by normal users can be marked `payable`

If a function modifier such as `onlyOwner` is used, or a function checks `msg.sender` some other way, the function will revert if a normal user tries to pay the function. Marking the function as `payable` will lower the gas cost for legitimate callers because the compiler will not include checks for whether a payment was provided. The extra opcodes avoided are `CALLVALUE`(2),`DUP1`(3),`ISZERO`(3),`PUSH2`(3),`JUMPI`(10),`PUSH1`(3),`DUP1`(3),`REVERT`(0),`JUMPDEST`(1),`POP`(2), which costs an average of about **21 gas per call** to the function, in addition to the extra deployment cost

*There are 67 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

41:      constructor(uint8[][] memory probabilities) {

61:      function transferOwnership(address newOwnerAddress) external {

68:      function addAttributeDivisor(uint8[] memory attributeDivisors) external {

131:     function addAttributeProbabilities(uint256 generation, uint8[][] memory probabilities) public {

144:     function deleteAttributeProbabilities(uint8 generation) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L41-L41,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L144-L144

```solidity
File: src/FighterFarm.sol

120:     function transferOwnership(address newOwnerAddress) external {

129:     function incrementGeneration(uint8 fighterType) external returns (uint8) {

139:     function addStaker(address newStaker) external {

147:     function instantiateAIArenaHelperContract(address aiArenaHelperAddress) external {

155:     function instantiateMintpassContract(address mintpassAddress) external {

163:     function instantiateNeuronContract(address neuronAddress) external {

171:     function setMergingPoolAddress(address mergingPoolAddress) external {

180:     function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {

191      function claimFighters(
192          uint8[2] calldata numToMint,
193          bytes calldata signature,
194          string[] calldata modelHashes,
195          string[] calldata modelTypes
196      ) 
197          external 
198:     {

233      function redeemMintPass(
234          uint256[] calldata mintpassIdsToBurn,
235          uint8[] calldata fighterTypes,
236          uint8[] calldata iconsTypes,
237          string[] calldata mintPassDnas,
238          string[] calldata modelHashes,
239          string[] calldata modelTypes
240      ) 
241          external 
242:     {

268:     function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {

283      function updateModel(
284          uint256 tokenId, 
285          string calldata modelHash,
286          string calldata modelType
287      ) 
288          external
289:     {

313      function mintFromMergingPool(
314          address to, 
315          string calldata modelHash, 
316          string calldata modelType, 
317          uint256[2] calldata customAttributes
318      ) 
319          public 
320:     {

338      function transferFrom(
339          address from, 
340          address to, 
341          uint256 tokenId
342      ) 
343          public 
344          override(ERC721, IERC721)
345:     {

355      function safeTransferFrom(
356          address from, 
357          address to, 
358          uint256 tokenId
359      ) 
360          public 
361          override(ERC721, IERC721)
362:     {

370:     function reRoll(uint8 tokenId, uint8 fighterType) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L129-L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L139-L139,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L155-L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L163-L163,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L180-L180,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L191-L198,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L233-L242,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L268-L268,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L283-L289,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L313-L320,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L338-L345,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L355-L362,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370-L370

```solidity
File: src/GameItems.sol

108:     function transferOwnership(address newOwnerAddress) external {

117:     function adjustAdminAccess(address adminAddress, bool access) external {

126:     function adjustTransferability(uint256 tokenId, bool transferable) external {

139:     function instantiateNeuronContract(address nrnAddress) external {

147:     function mint(uint256 tokenId, uint256 quantity) external {

185:     function setAllowedBurningAddresses(address newBurningAddress) public {

194:     function setTokenURI(uint256 tokenId, string memory _tokenURI) public {

208      function createGameItem(
209          string memory name_,
210          string memory tokenURI,
211          bool finiteSupply,
212          bool transferable,
213          uint256 itemsRemaining,
214          uint256 itemPrice,
215          uint16 dailyAllowance
216      ) 
217          public 
218:     {

242:     function burn(address account, uint256 tokenId, uint256 amount) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L108,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L117-L117,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L139-L139,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L194-L194,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L208-L218,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L242-L242

```solidity
File: src/MergingPool.sol

89:      function transferOwnership(address newOwnerAddress) external {

98:      function adjustAdminAccess(address adminAddress, bool access) external {

106:     function updateWinnersPerPeriod(uint256 newWinnersPerPeriodAmount) external {

118:     function pickWinner(uint256[] calldata winners) external {

195:     function addPoints(uint256 tokenId, uint256 points) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L89,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L106,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L195

```solidity
File: src/Neuron.sol

85:      function transferOwnership(address newOwnerAddress) external {

93:      function addMinter(address newMinterAddress) external {

101:     function addStaker(address newStakerAddress) external {

109:     function addSpender(address newSpenderAddress) external {

118:     function adjustAdminAccess(address adminAddress, bool access) external {

127:     function setupAirdrop(address[] calldata recipients, uint256[] calldata amounts) external {

138:     function claim(uint256 amount) external {

155:     function mint(address to, uint256 amount) public virtual {

171:     function approveSpender(address account, uint256 amount) public {

184:     function approveStaker(address owner, address spender, uint256 amount) public {

196:     function burnFrom(address account, uint256 amount) public virtual {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L93-L93,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L138-L138,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L155-L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L184-L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L196-L196

```solidity
File: src/RankedBattle.sol

167:     function transferOwnership(address newOwnerAddress) external {

176:     function adjustAdminAccess(address adminAddress, bool access) external {

184:     function setGameServerAddress(address gameServerAddress) external {

192:     function setStakeAtRiskAddress(address stakeAtRiskAddress) external {

201:     function instantiateNeuronContract(address nrnAddress) external {

209:     function instantiateMergingPoolContract(address mergingPoolAddress) external {

218:     function setRankedNrnDistribution(uint256 newDistribution) external {

226:     function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {

233:     function setNewRound() external {

244:     function stakeNRN(uint256 amount, uint256 tokenId) external {

270:     function unstakeNRN(uint256 amount, uint256 tokenId) external {

294:     function claimNRN() external {

322      function updateBattleRecord(
323          uint256 tokenId, 
324          uint256 mergingPortion,
325          uint8 battleResult,
326          uint256 eloFactor,
327          bool initiatorBool
328      ) 
329          external 
330:     {   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L167,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L192,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L201-L201,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L209-L209,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L218-L218,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L226,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L233-L233,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L244-L244,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L270-L270,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L294-L294,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L322-L330

```solidity
File: src/StakeAtRisk.sol

78:      function setNewRound(uint256 roundId_) external {

93:      function reclaimNRN(uint256 nrnToReclaim, uint256 fighterId, address fighterOwner) external {

115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L78-L78,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L93-L93,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L121

```solidity
File: src/VoltageManager.sol

64:      function transferOwnership(address newOwnerAddress) external {

73:      function adjustAdminAccess(address adminAddress, bool access) external {

82:      function adjustAllowedVoltageSpenders(address allowedVoltageSpender, bool allowed) external {

93:      function useVoltageBattery() public {

105:     function spendVoltage(address spender, uint8 voltageSpent) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L93-L93,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L105-L105

### [G-38]<a name="g-38"></a> Constructors can be marked `payable`

Payable functions cost less gas to execute, since the compiler does not have to add extra checks to ensure that a payment wasn't provided. A constructor can safely be marked as payable, since only the deployer would be able to pass funds, and the project itself would not pass any funds.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

41:       constructor(uint8[][] memory probabilities) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L41

```solidity
File: src/FighterFarm.sol

104       constructor(address ownerAddress, address delegatedAddress, address treasuryAddress_)
105:          ERC721("AI Arena Fighter", "FTR")

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L105

```solidity
File: src/GameItems.sol

95:       constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95

```solidity
File: src/MergingPool.sol

71        constructor(
72            address ownerAddress, 
73            address rankedBattleAddress, 
74:           address fighterFarmAddress

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L71-L74

```solidity
File: src/Neuron.sol

68        constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
69:           ERC20("Neuron", "NRN")

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L69

```solidity
File: src/RankedBattle.sol

146       constructor(
147         address ownerAddress, 
148         address gameServerAddress,
149         address fighterFarmAddress,
150:        address voltageManagerAddress

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L146-L150

```solidity
File: src/StakeAtRisk.sol

60        constructor(
61            address treasuryAddress_,
62            address nrnAddress,
63:           address rankedBattleAddress

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L60-L63

```solidity
File: src/VoltageManager.sol

51:       constructor(address ownerAddress, address gameItemsContractAddress) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51

### [G-39]<a name="g-39"></a> `unchecked {}`  can be used on the division of two `uint`s in order to save gas

The division cannot overflow, since both the numerator and the denominator are non-negative

*There are 6 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

107:                     uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L107-L107

```solidity
File: src/RankedBattle.sol

301              claimableNRN += (
302                  accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   
303:             ) / totalAccumulatedPoints[currentRound];

392              claimableNRN += (
393                  accumulatedPointsPerAddress[claimer][i] * nrnDistribution
394:             ) / totalAccumulatedPoints[i];

439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

449:             uint256 mergingPoints = (points * mergingPortion) / 100;

528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L301-L303,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L392-L394,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L439-L439,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L449-L449,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L528-L528

### [G-40]<a name="g-40"></a> `private` functions only called once can be inlined to save gas

Not inlining costs **20 to 40 gas** because of two extra `JUMP` instructions and additional stack operations needed for function calls. The inliner can do it only for 'simple' cases:
> Now to get back to the point why we require the routine to be simple: As soon as you do more complicated things like for example branching, calling external contracts, the Common Subexpression Eliminator cannot re-construct the code anymore or does not do full symbolic evaluation of the expressions. 

https://soliditylang.org/blog/2021/03/02/saving-gas-with-simple-inliner/

Therefore, the instances below contain branching or use op-codes with side-effects

*There are 5 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

312:     function _replenishDailyAllowance(uint256 tokenId) private {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L312-L312

```solidity
File: src/RankedBattle.sol

416      function _addResultPoints(
417          uint8 battleResult, 
418          uint256 tokenId, 
419          uint256 eloFactor, 
420          uint256 mergingPortion,
421          address fighterOwner
422      ) 
423          private 
424:     {

505:     function _updateRecord(uint256 tokenId, uint8 battleResult) private {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L424,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L505-L505

```solidity
File: src/StakeAtRisk.sol

142:     function _sweepLostStake() private returns(bool) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L142-L142

```solidity
File: src/VoltageManager.sol

117:     function _replenishVoltage(address owner) private {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L117-L117

### [G-41]<a name="g-41"></a> Assembly: Use scratch space when building emitted events with two data arguments

Using the [scratch space](https://gist.github.com/IllIllI000/87c4f03139fa03780fa548b8e4b02b5b) for more than one, but at most two words worth of data (non-indexed arguments) will save gas over needing Solidity's abi memory expansion used for emitting normally.

*There are 10 instance(s) of this issue:*

```solidity
File: src/MergingPool.sol

165:             emit Claimed(msg.sender, claimIndex);

199:         emit PointsAdded(tokenId, points);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L165-L165,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L199-L199

```solidity
File: src/Neuron.sol

144:         emit TokensClaimed(msg.sender, amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L144-L144

```solidity
File: src/RankedBattle.sol

263:             emit Staked(msg.sender, amount);

288:             emit Unstaked(msg.sender, amount);

309:             emit Claimed(msg.sender, claimableNRN);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L263-L263,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L288-L288,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L309-L309

```solidity
File: src/StakeAtRisk.sol

105:             emit ReclaimedStake(fighterId, nrnToReclaim);

126:         emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L105-L105,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L126-L126

```solidity
File: src/VoltageManager.sol

98:          emit VoltageRemaining(msg.sender, ownerVoltage[msg.sender]);

111:         emit VoltageRemaining(spender, ownerVoltage[spender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L111-L111

### [G-42]<a name="g-42"></a> Use local variables for emitting packed storage variables

Saves **14 gas** due to not having to clear the other bits of the [slot](https://gist.github.com/IllIllI000/f9cf10ee73bfd02d736beeab348c7441).

*There are 2 instance(s) of this issue:*

```solidity
File: src/VoltageManager.sol

/// @audit ownerVoltage
98:          emit VoltageRemaining(msg.sender, ownerVoltage[msg.sender]);

/// @audit ownerVoltage
111:         emit VoltageRemaining(spender, ownerVoltage[spender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L111-L111

### [G-43]<a name="g-43"></a> Counting down when iterating, saves gas

Counting down saves **6 [gas](https://gist.github.com/IllIllI000/764476152f228f8a25a41f1ca14003f5)** _per loop_, since checks for zero are more efficient than checks against any other value

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:          for (uint8 i = 0; i < attributesLength; i++) {

73:          for (uint8 i = 0; i < attributesLength; i++) {

99:              for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136-L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178-L178

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L249

```solidity
File: src/MergingPool.sol

124:         for (uint256 i = 0; i < winnersLength; i++) {

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:             for (uint32 j = 0; j < winnersLength; j++) {

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124-L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L149-L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178-L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207-L207

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131-L131

```solidity
File: src/RankedBattle.sol

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

390:         for (uint32 i = lowerBound; i < roundId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L390-L390

### [G-44]<a name="g-44"></a> `x += y` costs more gas than `x = x + y` for basic-typed state variables

Using the addition operator instead of plus-equals saves **[10 gas](https://gist.github.com/IllIllI000/cbbfb267425b898e5be734d4008d4fe8)** because of extra `PUSH`es and `POP`s associated with the manipulation of the state variable when using `+=` for basic-typed state variables

*There are 9 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

294:         totalNumTrained += 1;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L294-L294

```solidity
File: src/GameItems.sol

234:         _itemCount += 1;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L234-L234

```solidity
File: src/MergingPool.sol

126:             totalPoints -= fighterPoints[winners[i]];

131:         roundId += 1;

198:         totalPoints += points;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L198-L198

```solidity
File: src/RankedBattle.sol

236:         roundId += 1;

257:             globalStakedAmount += amount;

276:         globalStakedAmount -= amount;

348:         totalBattles += 1;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L236-L236,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L257-L257,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L276-L276,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L348-L348

### [G-45]<a name="g-45"></a> Don't compare boolean expressions to boolean literals

`if (<x> == true)` => `if (<x>)`, `if (<x> == false)` => `if (!<x>)`

*There are 4 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

152:              allGameItemAttributes[tokenId].finiteSupply == false || 

154:                  allGameItemAttributes[tokenId].finiteSupply == true && 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L154

```solidity
File: src/RankedBattle.sol

248:          require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

433:          if (_calculatedStakingFactor[tokenId][roundId] == false) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L433

### [G-46]<a name="g-46"></a> Emitting constants wastes gas

Every event parameter costs `Glogdata` (**8 gas**) per byte. You can avoid this extra cost, in cases where you're emitting a constant, by creating a second version of the event, which doesn't have the parameter (and have users look to the contract's variables for its value instead), and using the new event in the cases shown below.

*There are 2 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

470:                 emit PointsChanged(tokenId, points, true);

489:                     emit PointsChanged(tokenId, points, false);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L489-L489

### [G-47]<a name="g-47"></a> `++i` costs less gas than `i++`, especially when it's used in `for`-loops (`--i`/`i--` too)

Saves **5 gas per loop**

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:           for (uint8 i = 0; i < attributesLength; i++) {

73:           for (uint8 i = 0; i < attributesLength; i++) {

99:               for (uint8 i = 0; i < attributesLength; i++) {

136:          for (uint8 i = 0; i < attributesLength; i++) {

148:          for (uint8 i = 0; i < attributesLength; i++) {

178:          for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178

```solidity
File: src/FighterFarm.sol

211:          for (uint16 i = 0; i < totalToMint; i++) {

249:          for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249

```solidity
File: src/MergingPool.sol

124:          for (uint256 i = 0; i < winnersLength; i++) {

149:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:              for (uint32 j = 0; j < winnersLength; j++) {

176:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:              for (uint32 j = 0; j < winnersLength; j++) {

207:          for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207

```solidity
File: src/Neuron.sol

131:          for (uint32 i = 0; i < recipientsLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131

```solidity
File: src/RankedBattle.sol

299:          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

390:          for (uint32 i = lowerBound; i < roundId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L390

### [G-48]<a name="g-48"></a> `>=` costs less gas than `>`

The compiler uses opcodes `GT` and `ISZERO` for solidity code that uses `>`, but only requires `LT` for `>=`, [which saves **3 gas**](https://gist.github.com/IllIllI000/3dc79d25acccfa16dee4e83ffdc6ffde). If `<` is being used, the condition can be inverted. In cases where a for-loop is being used, one can count down rather than up, in order to use the optimal operator

*There are 41 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:          for (uint8 i = 0; i < attributesLength; i++) {

73:          for (uint8 i = 0; i < attributesLength; i++) {

99:              for (uint8 i = 0; i < attributesLength; i++) {

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136-L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178-L178

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

217:                 i < numToMint[0] ? 0 : 1,

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

372:         require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);

495:         require(balanceOf(to) < MAX_FIGHTERS_ALLOWED);

542:           balanceOf(to) < MAX_FIGHTERS_ALLOWED &&

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L217-L217,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L249,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L372-L372,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L495-L495,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L542-L542

```solidity
File: src/GameItems.sol

148:         require(tokenId < _itemCount);

258:         if (bytes(customURI).length > 0) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L258-L258

```solidity
File: src/MergingPool.sol

124:         for (uint256 i = 0; i < winnersLength; i++) {

149:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

152:             for (uint32 j = 0; j < winnersLength; j++) {

164:         if (claimIndex > 0) {

176:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124-L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L149-L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178-L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207-L207

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L156-L156

```solidity
File: src/RankedBattle.sol

235:         require(totalAccumulatedPoints[roundId] > 0);

245:         require(amount > 0, "Amount cannot be 0");

272:         if (amount > amountStaked[tokenId]) {

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

299:         for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {

306:         if (claimableNRN > 0) {

342:         if (amountStaked[tokenId] + stakeAtRisk > 0) {

390:         for (uint32 i = lowerBound; i < roundId; i++) {

454:             if (curStakeAtRisk > stakeAtRisk) {

460:             if (curStakeAtRisk > 0) {

469:             if (points > 0) {

476:             if (curStakeAtRisk > amountStaked[tokenId]) {

479:             if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {

482:                 if (points > accumulatedPointsPerFighter[tokenId][roundId]) {

488:                 if (points > 0) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L235-L235,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L245-L245,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L272-L272,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L295-L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L299-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L306-L306,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L342-L342,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L390-L390,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L454-L454,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L460-L460,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L469-L469,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L476-L476,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L479-L479,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L482-L482,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L488-L488

```solidity
File: src/VoltageManager.sol

94:          require(ownerVoltage[msg.sender] < 100);

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95

### [G-49]<a name="g-49"></a> `require()`/`revert()` strings longer than 32 bytes cost extra gas

Each extra memory word of bytes past the original 32 [incurs an MSTORE](https://gist.github.com/hrkrshnn/ee8fabd532058307229d65dcd5836ddc#consider-having-short-revert-strings) which costs **3 gas**

*There are 13 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

133:          require(probabilities.length == 6, "Invalid number of attribute arrays");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133

```solidity
File: src/MergingPool.sol

196:          require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L196

```solidity
File: src/Neuron.sol

139           require(
140               allowance(treasuryAddress, msg.sender) >= amount, 
141               "ERC20: claim amount exceeds allowance"
142:          );

156:          require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

157:          require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

172           require(
173               hasRole(SPENDER_ROLE, msg.sender), 
174               "ERC20: must have spender role to approve spending"
175:          );

185           require(
186               hasRole(STAKER_ROLE, msg.sender), 
187               "ERC20: must have staker role to approve staking"
188:          );

197           require(
198               allowance(account, msg.sender) >= amount, 
199               "ERC20: burn amount exceeds allowance"
200:          );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L197-L200,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L172-L175,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L185-L188

```solidity
File: src/RankedBattle.sol

248:          require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

295:          require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L248

```solidity
File: src/StakeAtRisk.sol

94:           require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

95            require(
96                stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97                "Fighter does not have enough stake at risk"
98:           );

122:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L95-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94

### [G-50]<a name="g-50"></a> Enable IR-based code generation

By using `--via-ir` or `{"viaIR": true}`, the compiler is able to use more advanced [multi-function optimizations](https://docs.soliditylang.org/en/v0.8.17/ir-breaking-changes.html#solidity-ir-based-codegen-changes), for extra gas savings.

*There are 0 instance(s) of this issue:*

```solidity
File: Various Files
```


### [G-51]<a name="g-51"></a> Multiple accesses of a `memory`/`calldata` array should use a local variable cache

The instances below point to the second+ access of a value inside a `memory`/`calldata` array, within a function. Caching avoids recalculating the array offsets into `memory`/`calldata`

*There are 8 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit numToMint...[]
/// @audit numToMint...[]
207:         uint16 totalToMint = uint16(numToMint[0] + numToMint[1]);

/// @audit numToMint...[]
209:         nftsClaimed[msg.sender][0] += numToMint[0];

/// @audit numToMint...[]
210:         nftsClaimed[msg.sender][1] += numToMint[1];

/// @audit numToMint...[]
217:                 i < numToMint[0] ? 0 : 1,

/// @audit mintpassIdsToBurn...[]
251:             _mintpassInstance.burn(mintpassIdsToBurn[i]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L217-L217,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L251-L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L207-L207,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L207-L207,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L209-L209

```solidity
File: src/MergingPool.sol

/// @audit winners...[]
126:             totalPoints -= fighterPoints[winners[i]];

/// @audit winners...[]
127:             fighterPoints[winners[i]] = 0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L126-L126,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L127-L127

### [G-52]<a name="g-52"></a> Optimize names to save gas

`public`/`external` function names and `public` member variable names can be optimized to save gas. See [this](https://gist.github.com/IllIllI000/a5d8b486a8259f9f77891a919febd1a9) link for an example of how it works. Below are the interfaces/abstract contracts that can be optimized so that the most frequently-called functions use the least amount of gas possible during method lookup. Method IDs that have two leading zero bytes can save **128 gas** each during deployment, and renaming functions to have lower method IDs will save **22 gas** per call, [per sorted position shifted](https://medium.com/joyso/solidity-how-does-function-name-affect-gas-consumption-in-smart-contract-47d270d8ac92)

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit  dnaToIndex(), transferOwnership(), addAttributeDivisor(), createPhysicalAttributes(), addAttributeProbabilities(), deleteAttributeProbabilities(), getAttributeProbabilities()
10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/FighterFarm.sol

/// @audit  setTokenURI(), claimFighters(), redeemMintPass(), updateFighterStaking(), updateModel(), doesTokenExist(), mintFromMergingPool(), reRoll(), contractURI(), getAllFighterInfo(), transferOwnership(), incrementGeneration(), addStaker(), instantiateAIArenaHelperContract(), instantiateMintpassContract(), instantiateNeuronContract(), setMergingPoolAddress()
16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

/// @audit  transferOwnership(), adjustAdminAccess(), adjustTransferability(), instantiateNeuronContract(), mint(), setAllowedBurningAddresses(), setTokenURI(), createGameItem(), burn(), contractURI(), getAllowanceRemaining(), remainingSupply(), uniqueTokensOutstanding()
10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

/// @audit  transferOwnership(), adjustAdminAccess(), updateWinnersPerPeriod(), pickWinner(), claimRewards(), getUnclaimedRewards(), addPoints(), getFighterPoints()
9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/Neuron.sol

/// @audit  approveSpender(), approveStaker(), transferOwnership(), burnFrom(), addMinter(), addStaker(), addSpender(), adjustAdminAccess(), setupAirdrop(), claim(), mint(), burn()
11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

```solidity
File: src/RankedBattle.sol

/// @audit  transferOwnership(), adjustAdminAccess(), setGameServerAddress(), setStakeAtRiskAddress(), instantiateNeuronContract(), instantiateMergingPoolContract(), setRankedNrnDistribution(), setBpsLostPerLoss(), setNewRound(), stakeNRN(), unstakeNRN(), claimNRN(), updateBattleRecord(), getBattleRecord(), getCurrentStakingData(), getNrnDistribution(), getUnclaimedNRN()
16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

/// @audit  setNewRound(), reclaimNRN(), updateAtRiskRecords(), getStakeAtRisk()
10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

/// @audit  transferOwnership(), adjustAdminAccess(), adjustAllowedVoltageSpenders(), useVoltageBattery(), spendVoltage()
9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [G-53]<a name="g-53"></a> Stack variable is only used once

If the variable is only accessed once, it's cheaper to use the assigned value directly that one time, and save the **3 gas** the extra stack assignment would spend

*There are 16 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

199          bytes32 msgHash = bytes32(keccak256(abi.encode(
200              msg.sender, 
201              numToMint[0], 
202              numToMint[1],
203              nftsClaimed[msg.sender][0],
204              nftsClaimed[msg.sender][1]
205:         )));

376:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);

379:             uint256 dna = uint256(keccak256(abi.encode(msg.sender, tokenId, numRerolls[tokenId])));

380:             (uint256 element, uint256 weight, uint256 newDna) = _createFighterBase(dna, fighterType);

470:         uint256 element = dna % numElements[generation[fighterType]];

471:         uint256 weight = dna % 31 + 65;

472:         uint256 newDna = fighterType == 0 ? dna : uint256(fighterType);

510          FighterOps.FighterPhysicalAttributes memory attrs = _aiArenaHelperInstance.createPhysicalAttributes(
511              newDna,
512              generation[fighterType],
513              iconsType,
514              dendroidBool
515:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L471-L471,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L472-L472,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L510-L515,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L376-L376,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L199-L205,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L380-L380,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L379-L379

```solidity
File: src/GameItems.sol

164:         bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L164-L164

```solidity
File: src/Neuron.sol

201:         uint256 decreasedAllowance = allowance(account, msg.sender) - amount;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L201-L201

```solidity
File: src/RankedBattle.sol

251:         bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);

283:         bool success = _neuronInstance.transfer(msg.sender, amount);

341:         uint256 stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);

493:                 bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L283-L283,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L251-L251,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L341-L341,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L493-L493

```solidity
File: src/StakeAtRisk.sol

80:          bool success = _sweepLostStake();

100:         bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L80-L80,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L100-L100

### [G-54]<a name="g-54"></a> Splitting `require()` statements that use `&&` saves gas

See [this issue](https://github.com/code-423n4/2022-01-xdefi-findings/issues/128) which describes the fact that there is a larger deployment gas cost, but with enough runtime calls, the change ends up being cheaper by **3 gas**

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

208:         require(modelHashes.length == totalToMint && modelTypes.length == totalToMint);

243          require(
244              mintpassIdsToBurn.length == mintPassDnas.length && 
245              mintPassDnas.length == fighterTypes.length && 
246              fighterTypes.length == modelHashes.length &&
247              modelHashes.length == modelTypes.length
248:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L243-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L208-L208

### [G-55]<a name="g-55"></a> Update OpenZeppelin dependency to save gas

Every release contains new gas optimizations. Use the latest version to take advantage of this

*There are 4 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

9:   import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L9-L9

```solidity
File: src/GameItems.sol

5:   import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L5-L5

```solidity
File: src/Neuron.sol

4:   import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

5:   import "@openzeppelin/contracts/access/AccessControl.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L4-L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L5-L5

### [G-56]<a name="g-56"></a> Use custom errors rather than `revert()`/`require()` strings to save gas

Custom errors are available from solidity version 0.8.4. Custom errors save [**~50 gas**](https://gist.github.com/IllIllI000/ad1bd0d29a0101b25e57c293b4b0c746) each time they're hit by [avoiding having to allocate and store the revert string](https://blog.soliditylang.org/2021/04/21/custom-errors/#errors-in-depth). Not defining the strings also save deployment gas

*There are 22 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133-L133

```solidity
File: src/FighterFarm.sol

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L373-L373

```solidity
File: src/GameItems.sol

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L150-L150

```solidity
File: src/MergingPool.sol

120:         require(winners.length == winnersPerPeriod, "Incorrect number of winners");

121:         require(!isSelectionComplete[roundId], "Winners are already selected");

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L196-L196

```solidity
File: src/Neuron.sol

139          require(
140              allowance(treasuryAddress, msg.sender) >= amount, 
141              "ERC20: claim amount exceeds allowance"
142:         );

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

157:         require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

172          require(
173              hasRole(SPENDER_ROLE, msg.sender), 
174              "ERC20: must have spender role to approve spending"
175:         );

185          require(
186              hasRole(STAKER_ROLE, msg.sender), 
187              "ERC20: must have staker role to approve staking"
188:         );

197          require(
198              allowance(account, msg.sender) >= amount, 
199              "ERC20: burn amount exceeds allowance"
200:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L185-L188,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L197-L200,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L172-L175

```solidity
File: src/RankedBattle.sol

245:         require(amount > 0, "Amount cannot be 0");

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

248:         require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L295-L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L248-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L247-L247,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L245-L245

```solidity
File: src/StakeAtRisk.sol

79:          require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

95           require(
96               stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97               "Fighter does not have enough stake at risk"
98:          );

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L95-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

### [G-57]<a name="g-57"></a> Use short-circuit evaluation to avoid external calls

By evaluating expressions involving constants, literals, and local variables before ones involving external calls, you can avoid unnecessarily executing the calls in the unhappy path.

*There are 1 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

/// @audit move the expression involving `ownerVoltageReplenishTime()` to the right
335              !initiatorBool ||
336              _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 
337:             _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L335-L337

### [G-58]<a name="g-58"></a> Using `private` rather than `public`, saves gas

For constants, the values can be read from the verified contract source code, or if there are multiple values there can be a single getter function that [returns a tuple](https://github.com/code-423n4/2022-08-frax/blob/90f55a9ce4e25bceed3a74290b854341d8de6afa/src/contracts/FraxlendPair.sol#L156-L178) of the values of all currently-public constants. Saves **3406-3606 gas** in deployment gas due to the compiler not having to create non-payable getter functions for deployment calldata, not having to store the bytes of the value outside of where it's used, and not adding another entry to the method ID table

*There are 64 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

17:      string[] public attributes = ["head", "eyes", "mouth", "body", "hands", "feet"];

20:      uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

30:      mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

33:      mapping(string => uint8) public attributeToDnaDivisor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L30-L30,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L17-L17

```solidity
File: src/FighterFarm.sol

33:      uint8 public constant MAX_FIGHTERS_ALLOWED = 10;

36:      uint8[2] public maxRerollsAllowed = [3, 3];

39:      uint256 public rerollCost = 1000 * 10**18;    

42:      uint8[2] public generation = [0, 0];

45:      uint32 public totalNumTrained;

48:      address public treasuryAddress;

69:      FighterOps.Fighter[] public fighters;

76:      mapping(uint256 => bool) public fighterStaked;

79:      mapping(uint256 => uint8) public numRerolls;

82:      mapping(address => bool) public hasStakerRole;

85:      mapping(uint8 => uint8) public numElements;

88:      mapping(address => mapping(uint8 => uint8)) public nftsClaimed;

91:      mapping(uint256 => uint32) public numTrained;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L88-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L91-L91,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L76-L76,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L42-L42,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L45-L45

```solidity
File: src/GameItems.sol

55:      GameItemAttributes[] public allGameItemAttributes;

58:      address public treasuryAddress;

74:      mapping(address => mapping(uint256 => uint256)) public allowanceRemaining;

77:      mapping(address => mapping(uint256 => uint256)) public dailyAllowanceReplenishTime;

80:      mapping(address => bool) public allowedBurningAddresses;

83:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L80-L80,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L83-L83,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L55-L55,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L58-L58,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L77-L77

```solidity
File: src/MergingPool.sol

26:      uint256 public winnersPerPeriod = 2;

29:      uint256 public roundId = 0;

32:      uint256 public totalPoints = 0;    

48:      mapping(address => uint32) public numRoundsClaimed;

51:      mapping(uint256 => uint256) public fighterPoints;

54:      mapping(uint256 => address[]) public winnerAddresses;    

57:      mapping(uint256 => bool) public isSelectionComplete;

60:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L51-L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L54-L54,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L57-L57,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L60-L60,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L26-L26,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L29-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L32-L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L48-L48

```solidity
File: src/Neuron.sol

28:      bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

31:      bytes32 public constant SPENDER_ROLE = keccak256("SPENDER_ROLE");

34:      bytes32 public constant STAKER_ROLE = keccak256("STAKER_ROLE");

37:      uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

40:      uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

43:      uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

46:      address public treasuryAddress;

56:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L43-L43,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L28-L28,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L31-L31,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L34-L34,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L37-L37,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L40-L40,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L46-L46,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L56-L56

```solidity
File: src/RankedBattle.sol

53:      uint8 public constant VOLTAGE_COST = 10;

56:      uint256 public totalBattles = 0;

59:      uint256 public globalStakedAmount = 0;

62:      uint256 public roundId = 0;

66:      uint256 public bpsLostPerLoss = 10;

101:     mapping(address => bool) public isAdmin;

104:     mapping(uint256 => BattleRecord) public fighterBattleRecord;

107:     mapping(address => uint256) public amountClaimed;

110:     mapping(address => uint32) public numRoundsClaimed;

113:     mapping(address => mapping(uint256 => uint256)) public accumulatedPointsPerAddress;

116:     mapping(uint256 => mapping(uint256 => uint256)) public accumulatedPointsPerFighter;

119:     mapping(uint256 => uint256) public totalAccumulatedPoints;

122:     mapping(uint256 => uint256) public rankedNrnDistribution;

125:     mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

128:     mapping(uint256 => uint256) public amountStaked;

131:     mapping(uint256 => uint256) public stakingFactor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L66-L66,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L113-L113,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L116-L116,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L122-L122,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L125-L125,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L128-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L59-L59,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L56-L56,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L53-L53

```solidity
File: src/StakeAtRisk.sol

27:      uint256 public roundId = 0;    

30:      address public treasuryAddress;

43:      mapping(uint256 => uint256) public totalStakeAtRisk;

46:      mapping(uint256 => mapping(uint256 => uint256)) public stakeAtRisk;

49:      mapping(address => uint256) public amountLost;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L49-L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L27-L27,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L30-L30,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L43-L43,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L46-L46

```solidity
File: src/VoltageManager.sol

33:      mapping(address => bool) public allowedVoltageSpenders;

36:      mapping(address => uint32) public ownerVoltageReplenishTime;

39:      mapping(address => uint8) public ownerVoltage;

42:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L42-L42

### NonCritical Risk Issues

### [N-01]<a name="n-01"></a> `constant`s should be defined rather than using magic numbers

Even [assembly](https://github.com/code-423n4/2022-05-opensea-seaport/blob/9d7ce4d08bf3c3010304a0476a785c70c0e90ae7/contracts/lib/TokenTransferrer.sol#L35-L39) can benefit from using readable constants instead of hex/numeric literals

*There are 42 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit 3
/// @audit 5
/// @audit 7
/// @audit 11
/// @audit 13
20:      uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

/// @audit 99
/// @audit 99
/// @audit 99
/// @audit 99
/// @audit 99
/// @audit 99
94:              return FighterOps.FighterPhysicalAttributes(99, 99, 99, 99, 99, 99);

/// @audit 4
/// @audit 3
103:                   i == 4 && iconsType == 3 // Custom icons hands (bowling ball)

/// @audit 50
105:                     finalAttributeProbabilityIndexes[i] = 50;

/// @audit 100
107:                     uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;

/// @audit 3
116:                 finalAttributeProbabilityIndexes[3],

/// @audit 4
117:                 finalAttributeProbabilityIndexes[4],

/// @audit 5
118:                 finalAttributeProbabilityIndexes[5]

/// @audit 6
133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L103-L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L103-L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L105-L105,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L116-L116,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L117-L117,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133-L133

```solidity
File: src/FighterFarm.sol

/// @audit 3
/// @audit 3
36:      uint8[2] public maxRerollsAllowed = [3, 3];

/// @audit 1000
/// @audit 18
39:      uint256 public rerollCost = 1000 * 10**18;    

/// @audit 3
110:         numElements[0] = 3;

/// @audit 100
/// @audit 100
219:                 [uint256(100), uint256(100)]

/// @audit 100
/// @audit 100
259:                 [uint256(100), uint256(100)]

/// @audit 6
428:             uint256[6] memory,

/// @audit 31
/// @audit 65
471:         uint256 weight = dna % 31 + 65;

/// @audit 100
499:         if (customAttributes[0] == 100) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L259-L259,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L259-L259,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L428-L428,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L471-L471,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L471-L471,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L499-L499

```solidity
File: src/RankedBattle.sol

/// @audit 5000
/// @audit 18
157:         rankedNrnDistribution[0] = 5000 * 10**18;

/// @audit 18
220:         rankedNrnDistribution[roundId] = newDistribution * 10**18;

/// @audit 100
332:         require(mergingPortion <= 100);

/// @audit 4
439:         curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

/// @audit 100
449:             uint256 mergingPoints = (points * mergingPortion) / 100;

/// @audit 18
528:           (amountStaked[tokenId] + stakeAtRisk) / 10**18

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L220-L220,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L332-L332,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L439-L439,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L449-L449,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L528-L528

```solidity
File: src/VoltageManager.sol

/// @audit 100
94:          require(ownerVoltage[msg.sender] < 100);

/// @audit 100
97:          ownerVoltage[msg.sender] = 100;

/// @audit 100
118:         ownerVoltage[owner] = 100;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L97-L97,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L118-L118

### [N-02]<a name="n-02"></a> `public` functions not called by the contract should be declared `external` instead

Contracts [are allowed](https://docs.soliditylang.org/en/latest/contracts.html#function-overriding) to override their parents' functions and change the visibility from `external` to `public`.

*There are 27 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

144:      function deleteAttributeProbabilities(uint8 generation) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L144

```solidity
File: src/FighterFarm.sol

313       function mintFromMergingPool(
314           address to, 
315           string calldata modelHash, 
316           string calldata modelType, 
317:          uint256[2] calldata customAttributes

355       function safeTransferFrom(
356           address from, 
357           address to, 
358:          uint256 tokenId

370:      function reRoll(uint8 tokenId, uint8 fighterType) public {

395:      function contractURI() public pure returns (string memory) {

402:      function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {

410       function supportsInterface(bytes4 _interfaceId)
411           public
412           view
413           override(ERC721, ERC721Enumerable)
414:          returns (bool)

421       function getAllFighterInfo(
422           uint256 tokenId
423       )
424           public
425           view
426           returns (
427               address,
428               uint256[6] memory,
429               uint256,
430               uint256,
431               string memory,
432               string memory,
433:              uint16

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L313-L317,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L355-L358,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L395,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L410-L414,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L421-L433

```solidity
File: src/GameItems.sol

185:      function setAllowedBurningAddresses(address newBurningAddress) public {

208       function createGameItem(
209           string memory name_,
210           string memory tokenURI,
211           bool finiteSupply,
212           bool transferable,
213           uint256 itemsRemaining,
214           uint256 itemPrice,
215:          uint16 dailyAllowance

242:      function burn(address account, uint256 tokenId, uint256 amount) public {

249:      function contractURI() public pure returns (string memory) {

256:      function uri(uint256 tokenId) public view override returns (string memory) {

268:      function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {

279:      function remainingSupply(uint256 tokenId) public view returns (uint256) {

285:      function uniqueTokensOutstanding() public view returns (uint256) {

291       function safeTransferFrom(
292           address from, 
293           address to, 
294           uint256 tokenId,
295           uint256 amount,
296:          bytes memory data

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L208-L215,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L242,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L249,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L279,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L285,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L296

```solidity
File: src/MergingPool.sol

195:      function addPoints(uint256 tokenId, uint256 points) public {

205:      function getFighterPoints(uint256 maxId) public view returns(uint256[] memory) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L205

```solidity
File: src/Neuron.sol

155:      function mint(address to, uint256 amount) public virtual {

163:      function burn(uint256 amount) public virtual {

171:      function approveSpender(address account, uint256 amount) public {

184:      function approveStaker(address owner, address spender, uint256 amount) public {

196:      function burnFrom(address account, uint256 amount) public virtual {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L155,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L163,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L196

```solidity
File: src/RankedBattle.sol

386:      function getUnclaimedNRN(address claimer) public view returns(uint256) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386

```solidity
File: src/VoltageManager.sol

93        function useVoltageBattery() public {
94:           require(ownerVoltage[msg.sender] < 100);

105:      function spendVoltage(address spender, uint8 voltageSpent) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L93-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L105

### [N-03]<a name="n-03"></a> `require()`/`revert()` statements should have descriptive reason strings



*There are 67 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

70:          require(attributeDivisors.length == attributes.length);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L70-L70,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

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

243          require(
244              mintpassIdsToBurn.length == mintPassDnas.length && 
245              mintPassDnas.length == fighterTypes.length && 
246              fighterTypes.length == modelHashes.length &&
247              modelHashes.length == modelTypes.length
248:         );

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


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L181-L181,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L206-L206,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L208-L208,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L243-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L269-L269,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L290-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L321-L321,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L363-L363,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L371-L371,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L372-L372,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L495-L495

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

148:         require(tokenId < _itemCount);

151          require(
152              allGameItemAttributes[tokenId].finiteSupply == false || 
153              (
154                  allGameItemAttributes[tokenId].finiteSupply == true && 
155                  quantity <= allGameItemAttributes[tokenId].itemsRemaining
156              )
157:         );

158          require(
159              dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 
160              quantity <= allowanceRemaining[msg.sender][tokenId]
161:         );

186:         require(isAdmin[msg.sender]);

195:         require(isAdmin[msg.sender]);

219:         require(isAdmin[msg.sender]);

243:         require(allowedBurningAddresses[msg.sender]);

301:         require(allGameItemAttributes[tokenId].transferable);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L151-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L158-L161,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L186-L186,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L195-L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L243-L243,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L301-L301

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

107:         require(isAdmin[msg.sender]);

119:         require(isAdmin[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L119-L119

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

128:         require(isAdmin[msg.sender]);

129:         require(recipients.length == amounts.length);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L128-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L129-L129

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

334          require(
335              !initiatorBool ||
336              _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 
337              _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST
338:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L227-L227,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L234-L234,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L235-L235,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L331-L331,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L332-L332,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L334-L338

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

83:          require(isAdmin[msg.sender]);

94:          require(ownerVoltage[msg.sender] < 100);

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

106:         require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L83-L83,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L106-L106

### [N-04]<a name="n-04"></a> Adding a `return` statement when the function defines a named return variable, is redundant

Once the return variable has been assigned (or has its default value), there is no need to explicitly return it at the end of the function, since it's returned automatically.

*There are 1 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

185          return attributeProbabilityIndex;
186      }
187  }
188: 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L185-L188

### [N-05]<a name="n-05"></a> Array indices should be referenced via `enum`s rather than via numeric literals



*There are 23 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

49:              attributeProbabilities[0][attributes[i]] = probabilities[i];

113:                 finalAttributeProbabilityIndexes[0],

114:                 finalAttributeProbabilityIndexes[1],

115:                 finalAttributeProbabilityIndexes[2],

116:                 finalAttributeProbabilityIndexes[3],

117:                 finalAttributeProbabilityIndexes[4],

118:                 finalAttributeProbabilityIndexes[5]

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L49-L49,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L113-L113,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L114-L114,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L115-L115,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L116-L116,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L117-L117,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L118-L118

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


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L201-L201,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L203-L203,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L204-L204,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L207-L207,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L207-L207,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L209-L209,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L209-L209,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L217-L217,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L499-L499,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L503-L503,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L504-L504

```solidity
File: src/RankedBattle.sol

157:         rankedNrnDistribution[0] = 5000 * 10**18;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157-L157

### [N-06]<a name="n-06"></a> Array is `push()`ed but not `pop()`ed

Array entries are added but are never removed. Consider whether this should be the case, or whether there should be a maximum, or whether old entries should be removed. Cases where there are specific potential problems will be flagged separately under a different issue.

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

516:         fighters.push(

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L516-L516

```solidity
File: src/GameItems.sol

220:         allGameItemAttributes.push(

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L220-L220

### [N-07]<a name="n-07"></a> Common functions should be refactored to a common base contract

The functions below have the same implementation as is seen in other files. The functions should be refactored into functions of a common base contract

*There are 14 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

61       function transferOwnership(address newOwnerAddress) external {
62           require(msg.sender == _ownerAddress);
63           _ownerAddress = newOwnerAddress;
64:      }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L64

```solidity
File: src/FighterFarm.sol

120      function transferOwnership(address newOwnerAddress) external {
121          require(msg.sender == _ownerAddress);
122          _ownerAddress = newOwnerAddress;
123:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L123

```solidity
File: src/GameItems.sol

108      function transferOwnership(address newOwnerAddress) external {
109          require(msg.sender == _ownerAddress);
110          _ownerAddress = newOwnerAddress;
111:     }

117      function adjustAdminAccess(address adminAddress, bool access) external {
118          require(msg.sender == _ownerAddress);
119          isAdmin[adminAddress] = access;
120:     }  

139      function instantiateNeuronContract(address nrnAddress) external {
140          require(msg.sender == _ownerAddress);
141          _neuronInstance = Neuron(nrnAddress);
142:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L111,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L117-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L139-L142

```solidity
File: src/MergingPool.sol

89       function transferOwnership(address newOwnerAddress) external {
90           require(msg.sender == _ownerAddress);
91           _ownerAddress = newOwnerAddress;
92:      }

98       function adjustAdminAccess(address adminAddress, bool access) external {
99           require(msg.sender == _ownerAddress);
100          isAdmin[adminAddress] = access;
101:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L92,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L98-L101

```solidity
File: src/Neuron.sol

85       function transferOwnership(address newOwnerAddress) external {
86           require(msg.sender == _ownerAddress);
87           _ownerAddress = newOwnerAddress;
88:      }

118      function adjustAdminAccess(address adminAddress, bool access) external {
119          require(msg.sender == _ownerAddress);
120          isAdmin[adminAddress] = access;
121:     }  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L118-L121

```solidity
File: src/RankedBattle.sol

167      function transferOwnership(address newOwnerAddress) external {
168          require(msg.sender == _ownerAddress);
169          _ownerAddress = newOwnerAddress;
170:     }

176      function adjustAdminAccess(address adminAddress, bool access) external {
177          require(msg.sender == _ownerAddress);
178          isAdmin[adminAddress] = access;
179:     }  

201      function instantiateNeuronContract(address nrnAddress) external {
202          require(msg.sender == _ownerAddress);
203          _neuronInstance = Neuron(nrnAddress);
204:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L170,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L176-L179,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L201-L204

```solidity
File: src/VoltageManager.sol

64       function transferOwnership(address newOwnerAddress) external {
65           require(msg.sender == _ownerAddress);
66           _ownerAddress = newOwnerAddress;
67:      }

73       function adjustAdminAccess(address adminAddress, bool access) external {
74           require(msg.sender == _ownerAddress);
75           isAdmin[adminAddress] = access;
76:      }  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L67,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L73-L76

### [N-08]<a name="n-08"></a> Consider adding a block/deny-list

Doing so will significantly increase centralization, but will help to prevent hackers from using stolen tokens

*There are 6 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit IERC721 handles tokens
16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

/// @audit IERC1155 handles tokens
10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/Neuron.sol

/// @audit IERC20 handles tokens
11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

```solidity
File: src/RankedBattle.sol

/// @audit RankedBattle handles tokens
16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

/// @audit StakeAtRisk handles tokens
10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

/// @audit VoltageManager handles tokens
9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [N-09]<a name="n-09"></a> Consider adding emergency-stop functionality

Adding a way to quickly halt protocol functionality in an emergency, rather than having to pause individual contracts one-by-one, will make in-progress hack mitigation faster and much less stressful.

*There are 4 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/MergingPool.sol

9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/RankedBattle.sol

16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/VoltageManager.sol

9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [N-10]<a name="n-10"></a> Consider adding formal verification proofs

Consider using formal verification to mathematically prove that your code does what is intended, and does not have any edge cases with unexpected behavior. The solidity compiler itself has this functionality [built in](https://docs.soliditylang.org/en/latest/smtchecker.html#smtchecker-and-formal-verification)

*There are 0 instance(s) of this issue:*

```solidity
File: Various Files
```


### [N-11]<a name="n-11"></a> Consider adding validation of user inputs

There are no validations done on the arguments below. Consider that the Solidity [documentation](https://docs.soliditylang.org/en/latest/control-structures.html#panic-via-assert-and-error-via-require) states that `Properly functioning code should never create a Panic, not even on invalid external input. If this happens, then there is a bug in your contract which you should fix`. This means that there should be explicit checks for expected ranges of inputs. Underflows/overflows result in panics should not be used as range checks, and allowing funds to be sent to  `0x0`, which is the default value of address variables and has many gotchas, should be avoided.

*There are 42 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit newOwnerAddress
61       function transferOwnership(address newOwnerAddress) external {
62           require(msg.sender == _ownerAddress);
63           _ownerAddress = newOwnerAddress;
64:      }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L64

```solidity
File: src/FighterFarm.sol

/// @audit newOwnerAddress
120      function transferOwnership(address newOwnerAddress) external {
121          require(msg.sender == _ownerAddress);
122          _ownerAddress = newOwnerAddress;
123:     }

/// @audit newStaker
139      function addStaker(address newStaker) external {
140          require(msg.sender == _ownerAddress);
141          hasStakerRole[newStaker] = true;
142:     }

/// @audit aiArenaHelperAddress
147      function instantiateAIArenaHelperContract(address aiArenaHelperAddress) external {
148          require(msg.sender == _ownerAddress);
149          _aiArenaHelperInstance = AiArenaHelper(aiArenaHelperAddress);
150:     }

/// @audit mintpassAddress
155      function instantiateMintpassContract(address mintpassAddress) external {
156          require(msg.sender == _ownerAddress);
157          _mintpassInstance = AAMintPass(mintpassAddress);
158:     }

/// @audit neuronAddress
163      function instantiateNeuronContract(address neuronAddress) external {
164          require(msg.sender == _ownerAddress);
165          _neuronInstance = Neuron(neuronAddress);
166:     }

/// @audit mergingPoolAddress
171      function setMergingPoolAddress(address mergingPoolAddress) external {
172          require(msg.sender == _ownerAddress);
173          _mergingPoolAddress = mergingPoolAddress;
174:     }

/// @audit from
338      function transferFrom(
339          address from, 
340          address to, 
341          uint256 tokenId
342      ) 
343          public 
344          override(ERC721, IERC721)
345      {
346          require(_ableToTransfer(tokenId, to));
347          _transfer(from, to, tokenId);
348:     }

/// @audit from
355      function safeTransferFrom(
356          address from, 
357          address to, 
358          uint256 tokenId
359      ) 
360          public 
361          override(ERC721, IERC721)
362      {
363          require(_ableToTransfer(tokenId, to));
364          _safeTransfer(from, to, tokenId, "");
365:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L123,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L147-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L155-L158,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L163-L166,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L338-L348,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L355-L365

```solidity
File: src/GameItems.sol

/// @audit newOwnerAddress
108      function transferOwnership(address newOwnerAddress) external {
109          require(msg.sender == _ownerAddress);
110          _ownerAddress = newOwnerAddress;
111:     }

/// @audit adminAddress
117      function adjustAdminAccess(address adminAddress, bool access) external {
118          require(msg.sender == _ownerAddress);
119          isAdmin[adminAddress] = access;
120:     }  

/// @audit nrnAddress
139      function instantiateNeuronContract(address nrnAddress) external {
140          require(msg.sender == _ownerAddress);
141          _neuronInstance = Neuron(nrnAddress);
142:     }

/// @audit newBurningAddress
185      function setAllowedBurningAddresses(address newBurningAddress) public {
186          require(isAdmin[msg.sender]);
187          allowedBurningAddresses[newBurningAddress] = true;
188:     }

/// @audit account
242      function burn(address account, uint256 tokenId, uint256 amount) public {
243          require(allowedBurningAddresses[msg.sender]);
244          _burn(account, tokenId, amount);
245:     }

/// @audit owner
268      function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {
269          uint256 remaining = allowanceRemaining[owner][tokenId];
270          if (dailyAllowanceReplenishTime[owner][tokenId] <= block.timestamp) {
271              remaining = allGameItemAttributes[tokenId].dailyAllowance;
272          }
273          return remaining;
274:     }

/// @audit to
/// @audit data
/// @audit from
291      function safeTransferFrom(
292          address from, 
293          address to, 
294          uint256 tokenId,
295          uint256 amount,
296          bytes memory data
297      ) 
298          public 
299          override(ERC1155)
300      {
301          require(allGameItemAttributes[tokenId].transferable);
302          super.safeTransferFrom(from, to, tokenId, amount, data);
303:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L111,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L117-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L185-L188,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L242-L245,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268-L274,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L303,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L303,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L303

```solidity
File: src/MergingPool.sol

/// @audit newOwnerAddress
89       function transferOwnership(address newOwnerAddress) external {
90           require(msg.sender == _ownerAddress);
91           _ownerAddress = newOwnerAddress;
92:      }

/// @audit adminAddress
98       function adjustAdminAccess(address adminAddress, bool access) external {
99           require(msg.sender == _ownerAddress);
100          isAdmin[adminAddress] = access;
101:     }   

/// @audit claimer
172      function getUnclaimedRewards(address claimer) external view returns(uint256) {
173          uint256 winnersLength;
174          uint256 numRewards = 0;
175          uint32 lowerBound = numRoundsClaimed[claimer];
176          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {
177              winnersLength = winnerAddresses[currentRound].length;
178              for (uint32 j = 0; j < winnersLength; j++) {
179                  if (claimer == winnerAddresses[currentRound][j]) {
180                      numRewards += 1;
181                  }
182              }
183          }
184          return numRewards;
185:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L92,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L98-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L172-L185

```solidity
File: src/Neuron.sol

/// @audit newOwnerAddress
85       function transferOwnership(address newOwnerAddress) external {
86           require(msg.sender == _ownerAddress);
87           _ownerAddress = newOwnerAddress;
88:      }

/// @audit newMinterAddress
93       function addMinter(address newMinterAddress) external {
94           require(msg.sender == _ownerAddress);
95           _setupRole(MINTER_ROLE, newMinterAddress);
96:      }

/// @audit newStakerAddress
101      function addStaker(address newStakerAddress) external {
102          require(msg.sender == _ownerAddress);
103          _setupRole(STAKER_ROLE, newStakerAddress);
104:     }

/// @audit newSpenderAddress
109      function addSpender(address newSpenderAddress) external {
110          require(msg.sender == _ownerAddress);
111          _setupRole(SPENDER_ROLE, newSpenderAddress);
112:     }

/// @audit adminAddress
118      function adjustAdminAccess(address adminAddress, bool access) external {
119          require(msg.sender == _ownerAddress);
120          isAdmin[adminAddress] = access;
121:     }  

/// @audit to
155      function mint(address to, uint256 amount) public virtual {
156          require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");
157          require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");
158          _mint(to, amount);
159:     }

/// @audit account
171      function approveSpender(address account, uint256 amount) public {
172          require(
173              hasRole(SPENDER_ROLE, msg.sender), 
174              "ERC20: must have spender role to approve spending"
175          );
176          _approve(account, msg.sender, amount);
177:     }

/// @audit spender
/// @audit owner
184      function approveStaker(address owner, address spender, uint256 amount) public {
185          require(
186              hasRole(STAKER_ROLE, msg.sender), 
187              "ERC20: must have staker role to approve staking"
188          );
189          _approve(owner, spender, amount);
190:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L93-L96,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L101-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L109-L112,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L118-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L155-L159,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L171-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L184-L190,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L184-L190

```solidity
File: src/RankedBattle.sol

/// @audit newOwnerAddress
167      function transferOwnership(address newOwnerAddress) external {
168          require(msg.sender == _ownerAddress);
169          _ownerAddress = newOwnerAddress;
170:     }

/// @audit adminAddress
176      function adjustAdminAccess(address adminAddress, bool access) external {
177          require(msg.sender == _ownerAddress);
178          isAdmin[adminAddress] = access;
179:     }  

/// @audit gameServerAddress
184      function setGameServerAddress(address gameServerAddress) external {
185          require(msg.sender == _ownerAddress);
186          _gameServerAddress = gameServerAddress;
187:     }

/// @audit stakeAtRiskAddress
192      function setStakeAtRiskAddress(address stakeAtRiskAddress) external {
193          require(msg.sender == _ownerAddress);
194          _stakeAtRiskAddress = stakeAtRiskAddress;
195          _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);
196:     }

/// @audit nrnAddress
201      function instantiateNeuronContract(address nrnAddress) external {
202          require(msg.sender == _ownerAddress);
203          _neuronInstance = Neuron(nrnAddress);
204:     }

/// @audit mergingPoolAddress
209      function instantiateMergingPoolContract(address mergingPoolAddress) external {
210          require(msg.sender == _ownerAddress);
211          _mergingPoolInstance = MergingPool(mergingPoolAddress);
212:     }

/// @audit claimer
386      function getUnclaimedNRN(address claimer) public view returns(uint256) {
387          uint256 claimableNRN = 0;
388          uint256 nrnDistribution;   
389          uint32 lowerBound = numRoundsClaimed[claimer];
390          for (uint32 i = lowerBound; i < roundId; i++) {
391              nrnDistribution = getNrnDistribution(i);
392              claimableNRN += (
393                  accumulatedPointsPerAddress[claimer][i] * nrnDistribution
394              ) / totalAccumulatedPoints[i];
395          }
396          return claimableNRN;
397:     } 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L170,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L176-L179,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L187,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L196,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L201-L204,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L209-L212,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386-L397

```solidity
File: src/StakeAtRisk.sol

/// @audit fighterOwner
93       function reclaimNRN(uint256 nrnToReclaim, uint256 fighterId, address fighterOwner) external {
94           require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
95           require(
96               stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97               "Fighter does not have enough stake at risk"
98           );
99   
100          bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);
101          if (success) {
102              stakeAtRisk[roundId][fighterId] -= nrnToReclaim;
103              totalStakeAtRisk[roundId] -= nrnToReclaim;
104              amountLost[fighterOwner] -= nrnToReclaim;
105              emit ReclaimedStake(fighterId, nrnToReclaim);
106          }
107:     }

/// @audit fighterOwner
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L93-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

```solidity
File: src/VoltageManager.sol

/// @audit newOwnerAddress
64       function transferOwnership(address newOwnerAddress) external {
65           require(msg.sender == _ownerAddress);
66           _ownerAddress = newOwnerAddress;
67:      }

/// @audit adminAddress
73       function adjustAdminAccess(address adminAddress, bool access) external {
74           require(msg.sender == _ownerAddress);
75           isAdmin[adminAddress] = access;
76:      }  

/// @audit allowedVoltageSpender
82       function adjustAllowedVoltageSpenders(address allowedVoltageSpender, bool allowed) external {
83           require(isAdmin[msg.sender]);
84           allowedVoltageSpenders[allowedVoltageSpender] = allowed;
85:      }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L67,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L73-L76,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L82-L85

### [N-12]<a name="n-12"></a> Consider bounding input array length

The functions below take in an unbounded array, and make function calls for entries in the array. While the function will revert if it eventually runs out of gas, it may be a nicer user experience to `require()` that the length of the array is below some reasonable maximum, so that the user doesn't have to use up a full transaction's gas only to see that the transaction reverts.

*There are 4 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

99               for (uint8 i = 0; i < attributesLength; i++) {
100                  if (
101                    i == 0 && iconsType == 2 || // Custom icons head (beta helmet)
102                    i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)
103                    i == 4 && iconsType == 3 // Custom icons hands (bowling ball)
104                  ) {
105                      finalAttributeProbabilityIndexes[i] = 50;
106                  } else {
107                      uint256 rarityRank = (dna / attributeToDnaDivisor[attributes[i]]) % 100;
108                      uint256 attributeIndex = dnaToIndex(generation, rarityRank, attributes[i]);
109                      finalAttributeProbabilityIndexes[i] = attributeIndex;
110                  }
111:             }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99-L111

```solidity
File: src/FighterFarm.sol

211          for (uint16 i = 0; i < totalToMint; i++) {
212              _createNewFighter(
213                  msg.sender, 
214                  uint256(keccak256(abi.encode(msg.sender, fighters.length))),
215                  modelHashes[i], 
216                  modelTypes[i],
217                  i < numToMint[0] ? 0 : 1,
218                  0,
219                  [uint256(100), uint256(100)]
220              );
221:         }

249          for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {
250              require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));
251              _mintpassInstance.burn(mintpassIdsToBurn[i]);
252              _createNewFighter(
253                  msg.sender, 
254                  uint256(keccak256(abi.encode(mintPassDnas[i]))), 
255                  modelHashes[i], 
256                  modelTypes[i],
257                  fighterTypes[i],
258                  iconsTypes[i],
259                  [uint256(100), uint256(100)]
260              );
261:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L221,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L261

```solidity
File: src/Neuron.sol

131          for (uint32 i = 0; i < recipientsLength; i++) {
132              _approve(treasuryAddress, recipients[i], amounts[i]);
133:         }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131-L133

### [N-13]<a name="n-13"></a> Consider defining system-wide constants in a single file

`ContA.X = 0`, `ContB.Y = 1`, `ContC.Z = 2` -> `ContConstants.X = 0`, `ContConstants.Y = 1`, `ContConstants.Z = 2`; `ContA.X = X`, `ContB.Y = Y`, `ContC.Z = Z`,

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

33:      uint8 public constant MAX_FIGHTERS_ALLOWED = 10;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L33-L33

```solidity
File: src/RankedBattle.sol

53:      uint8 public constant VOLTAGE_COST = 10;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L53-L53

### [N-14]<a name="n-14"></a> Consider disallowing transfers to `address(this)`

Consider preventing a contract's tokens from being transferred to the contract itself

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

338      function transferFrom(
339          address from, 
340          address to, 
341          uint256 tokenId
342      ) 
343          public 
344          override(ERC721, IERC721)
345:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L338-L345

### [N-15]<a name="n-15"></a> Consider emitting an event at the end of the constructor

This will allow users to easily exactly pinpoint when and by whom a contract was constructed

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

41:      constructor(uint8[][] memory probabilities) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L41-L41

```solidity
File: src/FighterFarm.sol

104      constructor(address ownerAddress, address delegatedAddress, address treasuryAddress_)
105          ERC721("AI Arena Fighter", "FTR")
106:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L106

```solidity
File: src/GameItems.sol

95:      constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95

```solidity
File: src/MergingPool.sol

71       constructor(
72           address ownerAddress, 
73           address rankedBattleAddress, 
74           address fighterFarmAddress
75:      ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L71-L75

```solidity
File: src/Neuron.sol

68       constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
69           ERC20("Neuron", "NRN")
70:      {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L70

```solidity
File: src/RankedBattle.sol

146      constructor(
147        address ownerAddress, 
148        address gameServerAddress,
149        address fighterFarmAddress,
150        address voltageManagerAddress
151:     ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L146-L151

```solidity
File: src/StakeAtRisk.sol

60       constructor(
61           address treasuryAddress_,
62           address nrnAddress,
63           address rankedBattleAddress
64:      ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L60-L64

```solidity
File: src/VoltageManager.sol

51:      constructor(address ownerAddress, address gameItemsContractAddress) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51-L51

### [N-16]<a name="n-16"></a> Consider making contracts `Upgradeable`

This allows for bugs to be fixed in production, at the expense of _significantly_ increasing centralization.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/FighterFarm.sol

16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/Neuron.sol

11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

```solidity
File: src/RankedBattle.sol

16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [N-17]<a name="n-17"></a> Consider moving `msg.sender` checks to common `modifier`s

Note that these may not be specifically checks against the _address_ of `msg.sender`, but may also be checks against behavior of the address, such as ERC165 checks.

*There are 67 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

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

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

269:         require(hasStakerRole[msg.sender]);

290:         require(msg.sender == ownerOf(tokenId));

321:         require(msg.sender == _mergingPoolAddress);

371:         require(msg.sender == ownerOf(tokenId));

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L181-L181,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L269-L269,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L290-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L321-L321,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L371-L371,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L373-L373

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

158          require(
159              dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 
160              quantity <= allowanceRemaining[msg.sender][tokenId]
161:         );

186:         require(isAdmin[msg.sender]);

195:         require(isAdmin[msg.sender]);

219:         require(isAdmin[msg.sender]);

243:         require(allowedBurningAddresses[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L150-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L158-L161,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L186-L186,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L195-L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L243-L243

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

107:         require(isAdmin[msg.sender]);

119:         require(isAdmin[msg.sender]);

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L196-L196

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

128:         require(isAdmin[msg.sender]);

139          require(
140              allowance(treasuryAddress, msg.sender) >= amount, 
141              "ERC20: claim amount exceeds allowance"
142:         );

157:         require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

172          require(
173              hasRole(SPENDER_ROLE, msg.sender), 
174              "ERC20: must have spender role to approve spending"
175:         );

185          require(
186              hasRole(STAKER_ROLE, msg.sender), 
187              "ERC20: must have staker role to approve staking"
188:         );

197          require(
198              allowance(account, msg.sender) >= amount, 
199              "ERC20: burn amount exceeds allowance"
200:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L128-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L172-L175,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L185-L188,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L197-L200

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

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

331:         require(msg.sender == _gameServerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L227-L227,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L234-L234,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L247-L247,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L295-L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L331-L331

```solidity
File: src/StakeAtRisk.sol

79:          require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

83:          require(isAdmin[msg.sender]);

94:          require(ownerVoltage[msg.sender] < 100);

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

106:         require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L83-L83,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L106-L106

### [N-18]<a name="n-18"></a> Consider moving duplicated strings to constants



*There are 4 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271

```solidity
File: src/StakeAtRisk.sol

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

### [N-19]<a name="n-19"></a> Consider providing a ranged getter for array state variables

While the compiler automatically provides a getter for accessing single elements within a public state variable array, it doesn't provide a way to fetch the whole array, or subsets thereof. Consider adding a function to allow the fetching of slices of the array, especially if the contract doesn't already have multicall functionality.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

17:      string[] public attributes = ["head", "eyes", "mouth", "body", "hands", "feet"];

20:      uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

30:      mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L17-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L30-L30

```solidity
File: src/FighterFarm.sol

36:      uint8[2] public maxRerollsAllowed = [3, 3];

42:      uint8[2] public generation = [0, 0];

69:      FighterOps.Fighter[] public fighters;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L42-L42,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L69-L69

```solidity
File: src/GameItems.sol

55:      GameItemAttributes[] public allGameItemAttributes;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L55-L55

```solidity
File: src/MergingPool.sol

54:      mapping(uint256 => address[]) public winnerAddresses;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L54-L54

### [N-20]<a name="n-20"></a> Consider returning a `struct` rather than having multiple `return` values



*There are 4 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

421      function getAllFighterInfo(
422          uint256 tokenId
423      )
424          public
425          view
426          returns (
427              address,
428              uint256[6] memory,
429              uint256,
430              uint256,
431              string memory,
432              string memory,
433              uint16
434          )
435:     {

462      function _createFighterBase(
463          uint256 dna, 
464          uint8 fighterType
465      ) 
466          private 
467          view 
468          returns (uint256, uint256, uint256) 
469:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L421-L435,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L462-L469

```solidity
File: src/RankedBattle.sol

354:     function getBattleRecord(uint256 tokenId) external view returns(uint32, uint32, uint32) {

364:     function getCurrentStakingData() external view returns(uint256, uint256, uint256) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L354-L354,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L364-L364

### [N-21]<a name="n-21"></a> Consider splitting complex checks into multiple steps

Assign the expression's parts to intermediate local variables, and check against those instead

*There are 1 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

152              allGameItemAttributes[tokenId].finiteSupply == false || 
153              (
154                  allGameItemAttributes[tokenId].finiteSupply == true && 
155                  quantity <= allGameItemAttributes[tokenId].itemsRemaining
156:             )

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L152-L156

### [N-22]<a name="n-22"></a> Consider using `AccessControlDefaultAdminRules` rather than `AccessControl`

`AccessControlDefaultAdminRules` implements multiple [security best practices](https://docs.openzeppelin.com/contracts/4.x/api/access#AccessControlDefaultAdminRules) on top of the normal `AccessControl` rules, so consider using it instead, or adding it to the contract inheritance constructor tree of any contract that extends it

*There are 1 instance(s) of this issue:*

```solidity
File: src/Neuron.sol

11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

### [N-23]<a name="n-23"></a> Consider using `delete` rather than assigning zero/false to clear values

The `delete` keyword more closely matches the semantics of what is being done, and draws more attention to the changing of state, which may lead to a more thorough audit of its associated logic

*There are 1 instance(s) of this issue:*

```solidity
File: src/MergingPool.sol

127:             fighterPoints[winners[i]] = 0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L127-L127

### [N-24]<a name="n-24"></a> Consider using a `struct` rather than having many function input parameters

Often times, a subset of the parameters would be more clear if they were passed as a struct

*There are 5 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

233      function redeemMintPass(
234          uint256[] calldata mintpassIdsToBurn,
235          uint8[] calldata fighterTypes,
236          uint8[] calldata iconsTypes,
237          string[] calldata mintPassDnas,
238          string[] calldata modelHashes,
239          string[] calldata modelTypes
240      ) 
241          external 
242:     {

484      function _createNewFighter(
485          address to, 
486          uint256 dna, 
487          string memory modelHash,
488          string memory modelType, 
489          uint8 fighterType,
490          uint8 iconsType,
491          uint256[2] memory customAttributes
492      ) 
493          private 
494:     {  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L233-L242,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L484-L494

```solidity
File: src/GameItems.sol

208      function createGameItem(
209          string memory name_,
210          string memory tokenURI,
211          bool finiteSupply,
212          bool transferable,
213          uint256 itemsRemaining,
214          uint256 itemPrice,
215          uint16 dailyAllowance
216      ) 
217          public 
218:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L208-L218

```solidity
File: src/RankedBattle.sol

322      function updateBattleRecord(
323          uint256 tokenId, 
324          uint256 mergingPortion,
325          uint8 battleResult,
326          uint256 eloFactor,
327          bool initiatorBool
328      ) 
329          external 
330:     {   

416      function _addResultPoints(
417          uint8 battleResult, 
418          uint256 tokenId, 
419          uint256 eloFactor, 
420          uint256 mergingPortion,
421          address fighterOwner
422      ) 
423          private 
424:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L322-L330,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L424

### [N-25]<a name="n-25"></a> Consider using descriptive `constant`s when passing zero as a function argument

Passing zero as a function argument can sometimes result in a security issue (e.g. passing zero as the slippage parameter). Consider using a `constant` variable with a descriptive name, so it's clear that the argument is intentionally being used, and for the right reasons.

*There are 7 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

45:          addAttributeProbabilities(0, probabilities);

149:             attributeProbabilities[generation][attributes[i]] = new uint8[](0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L45-L45,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L149-L149

```solidity
File: src/FighterFarm.sol

218:                 0,

327:             0,

328:             0,

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L218-L218,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L327-L327,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L328-L328

```solidity
File: src/VoltageManager.sol

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

96:          _gameItemsContractInstance.burn(msg.sender, 0, 1);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L96-L96

### [N-26]<a name="n-26"></a> Consider using named function arguments

When calling functions in external contracts with multiple arguments, consider using [named](https://docs.soliditylang.org/en/latest/control-structures.html#function-calls-with-named-parameters) function parameters, rather than positional ones.

*There are 12 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

383              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
384                  newDna,
385                  generation[fighterType],
386                  fighters[tokenId].iconsType,
387                  fighters[tokenId].dendroidBool
388:             );

510          FighterOps.FighterPhysicalAttributes memory attrs = _aiArenaHelperInstance.createPhysicalAttributes(
511              newDna,
512              generation[fighterType],
513              iconsType,
514              dendroidBool
515:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L383-L388,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L510-L515

```solidity
File: src/MergingPool.sol

154                      _fighterFarmInstance.mintFromMergingPool(
155                          msg.sender,
156                          modelURIs[claimIndex],
157                          modelTypes[claimIndex],
158                          customAttributes[claimIndex]
159:                     );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L154-L159

```solidity
File: src/RankedBattle.sol

254:                 _fighterFarmInstance.updateFighterStaking(tokenId, true);

286:                 _fighterFarmInstance.updateFighterStaking(tokenId, false);

308:             _neuronInstance.mint(msg.sender, claimableNRN);

346:             _voltageManagerInstance.spendVoltage(fighterOwner, VOLTAGE_COST);

451:             _mergingPoolInstance.addPoints(tokenId, mergingPoints);

461:                 _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);

495:                     _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L254-L254,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L286-L286,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L308-L308,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L451-L451,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L461-L461,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L495-L495

```solidity
File: src/VoltageManager.sol

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

96:          _gameItemsContractInstance.burn(msg.sender, 0, 1);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L96-L96

### [N-27]<a name="n-27"></a> Consider using named mappings

Consider moving to solidity version 0.8.18 or later, and using [named mappings](https://ethereum.stackexchange.com/a/145555) to make it easier to understand the purpose of each mapping

*There are 48 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

30:      mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

30:      mapping(uint256 => mapping(string => uint8[])) public attributeProbabilities;

33:      mapping(string => uint8) public attributeToDnaDivisor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L30-L30,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L30-L30,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L33-L33

```solidity
File: src/FighterFarm.sol

76:      mapping(uint256 => bool) public fighterStaked;

79:      mapping(uint256 => uint8) public numRerolls;

82:      mapping(address => bool) public hasStakerRole;

85:      mapping(uint8 => uint8) public numElements;

88:      mapping(address => mapping(uint8 => uint8)) public nftsClaimed;

88:      mapping(address => mapping(uint8 => uint8)) public nftsClaimed;

91:      mapping(uint256 => uint32) public numTrained;

94:      mapping(uint256 => string) private _tokenURIs;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L76-L76,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L88-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L88-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L91-L91,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L94-L94

```solidity
File: src/GameItems.sol

74:      mapping(address => mapping(uint256 => uint256)) public allowanceRemaining;

74:      mapping(address => mapping(uint256 => uint256)) public allowanceRemaining;

77:      mapping(address => mapping(uint256 => uint256)) public dailyAllowanceReplenishTime;

77:      mapping(address => mapping(uint256 => uint256)) public dailyAllowanceReplenishTime;

80:      mapping(address => bool) public allowedBurningAddresses;

83:      mapping(address => bool) public isAdmin;

86:      mapping(uint256 => string) private _tokenURIs;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L77-L77,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L77-L77,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L80-L80,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L83-L83,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L86-L86

```solidity
File: src/MergingPool.sol

48:      mapping(address => uint32) public numRoundsClaimed;

51:      mapping(uint256 => uint256) public fighterPoints;

54:      mapping(uint256 => address[]) public winnerAddresses;    

57:      mapping(uint256 => bool) public isSelectionComplete;

60:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L51-L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L54-L54,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L57-L57,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L60-L60

```solidity
File: src/Neuron.sol

56:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L56-L56

```solidity
File: src/RankedBattle.sol

101:     mapping(address => bool) public isAdmin;

104:     mapping(uint256 => BattleRecord) public fighterBattleRecord;

107:     mapping(address => uint256) public amountClaimed;

110:     mapping(address => uint32) public numRoundsClaimed;

113:     mapping(address => mapping(uint256 => uint256)) public accumulatedPointsPerAddress;

113:     mapping(address => mapping(uint256 => uint256)) public accumulatedPointsPerAddress;

116:     mapping(uint256 => mapping(uint256 => uint256)) public accumulatedPointsPerFighter;

116:     mapping(uint256 => mapping(uint256 => uint256)) public accumulatedPointsPerFighter;

119:     mapping(uint256 => uint256) public totalAccumulatedPoints;

122:     mapping(uint256 => uint256) public rankedNrnDistribution;

125:     mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

125:     mapping(uint256 => mapping(uint256 => bool)) public hasUnstaked;

128:     mapping(uint256 => uint256) public amountStaked;

131:     mapping(uint256 => uint256) public stakingFactor;

134:     mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

134:     mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L113-L113,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L113-L113,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L116-L116,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L116-L116,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L122-L122,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L125-L125,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L125-L125,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L128-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L131-L131,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L134-L134,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L134-L134

```solidity
File: src/StakeAtRisk.sol

43:      mapping(uint256 => uint256) public totalStakeAtRisk;

46:      mapping(uint256 => mapping(uint256 => uint256)) public stakeAtRisk;

46:      mapping(uint256 => mapping(uint256 => uint256)) public stakeAtRisk;

49:      mapping(address => uint256) public amountLost;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L43-L43,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L46-L46,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L46-L46,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L49-L49

```solidity
File: src/VoltageManager.sol

33:      mapping(address => bool) public allowedVoltageSpenders;

36:      mapping(address => uint32) public ownerVoltageReplenishTime;

39:      mapping(address => uint8) public ownerVoltage;

42:      mapping(address => bool) public isAdmin;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L42-L42

### [N-28]<a name="n-28"></a> Consider using named returns

Using named returns makes the code more self-documenting, makes it easier to fill out NatSpec, and in some cases can save gas. The cases below are where there currently is at most one return statement, which is ideal for named returns.

*There are 22 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

157      function getAttributeProbabilities(uint256 generation, string memory attribute) 
158          public 
159          view 
160          returns (uint8[] memory) 
161:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L157-L161

```solidity
File: src/FighterFarm.sol

129:     function incrementGeneration(uint8 fighterType) external returns (uint8) {

299:     function doesTokenExist(uint256 tokenId) external view returns (bool) {

395:     function contractURI() public pure returns (string memory) {

402:     function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {

410      function supportsInterface(bytes4 _interfaceId)
411          public
412          view
413          override(ERC721, ERC721Enumerable)
414          returns (bool)
415:     {

421      function getAllFighterInfo(
422          uint256 tokenId
423      )
424          public
425          view
426          returns (
427              address,
428              uint256[6] memory,
429              uint256,
430              uint256,
431              string memory,
432              string memory,
433              uint16
434          )
435:     {

462      function _createFighterBase(
463          uint256 dna, 
464          uint8 fighterType
465      ) 
466          private 
467          view 
468          returns (uint256, uint256, uint256) 
469:     {

539:     function _ableToTransfer(uint256 tokenId, address to) private view returns(bool) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L129-L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L299-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L395-L395,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402-L402,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L410-L415,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L421-L435,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L462-L469,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L539-L539

```solidity
File: src/GameItems.sol

249:     function contractURI() public pure returns (string memory) {

268:     function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {

279:     function remainingSupply(uint256 tokenId) public view returns (uint256) {

285:     function uniqueTokensOutstanding() public view returns (uint256) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L249-L249,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268-L268,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L279-L279,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L285-L285

```solidity
File: src/MergingPool.sol

172:     function getUnclaimedRewards(address claimer) external view returns(uint256) {

205:     function getFighterPoints(uint256 maxId) public view returns(uint256[] memory) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L205-L205

```solidity
File: src/RankedBattle.sol

354:     function getBattleRecord(uint256 tokenId) external view returns(uint32, uint32, uint32) {

364:     function getCurrentStakingData() external view returns(uint256, uint256, uint256) {

379:     function getNrnDistribution(uint256 roundId_) public view returns(uint256) {

386:     function getUnclaimedNRN(address claimer) public view returns(uint256) {

519      function _getStakingFactor(
520          uint256 tokenId, 
521          uint256 stakeAtRisk
522      ) 
523          private 
524          view 
525          returns (uint256) 
526:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L354-L354,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L364-L364,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L379-L379,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386-L386,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L519-L526

```solidity
File: src/StakeAtRisk.sol

132:     function getStakeAtRisk(uint256 fighterId) external view returns(uint256) {

142:     function _sweepLostStake() private returns(bool) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L142-L142

### [N-29]<a name="n-29"></a> Consider using the `using`-`for` syntax

The `using`-`for` [syntax](https://docs.soliditylang.org/en/latest/contracts.html#using-for) is the more common way of calling library functions.

*There are 4 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

206:         require(Verification.verify(msgHash, signature, _delegatedAddress));

436:         return FighterOps.viewFighterInfo(fighters[tokenId], ownerOf(tokenId));

530:         FighterOps.fighterCreatedEmitter(newId, weight, element, generation[fighterType]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L206-L206,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L436-L436,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L530-L530

```solidity
File: src/RankedBattle.sol

527        uint256 stakingFactor_ = FixedPointMathLib.sqrt(
528            (amountStaked[tokenId] + stakeAtRisk) / 10**18
529:       );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L527-L529

### [N-30]<a name="n-30"></a> Constants in comparisons should appear on the left side

Doing so will prevent [typo bugs](https://www.moserware.com/2008/01/constants-on-left-are-better-but-this.html) where the first '!', '>', '<', or '=' at the beginning of the operator is missing.

*There are 40 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

101:                   i == 0 && iconsType == 2 || // Custom icons head (beta helmet)

101:                   i == 0 && iconsType == 2 || // Custom icons head (beta helmet)

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

102:                   i == 1 && iconsType > 0 || // Custom icons eyes (red diamond)

103:                   i == 4 && iconsType == 3 // Custom icons hands (bowling ball)

103:                   i == 4 && iconsType == 3 // Custom icons hands (bowling ball)

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L101-L101,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L103-L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L103-L103,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133-L133

```solidity
File: src/FighterFarm.sol

472:         uint256 newDna = fighterType == 0 ? dna : uint256(fighterType);

495:         require(balanceOf(to) < MAX_FIGHTERS_ALLOWED);

499:         if (customAttributes[0] == 100) {

509:         bool dendroidBool = fighterType == 1;

542:           balanceOf(to) < MAX_FIGHTERS_ALLOWED &&

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L472-L472,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L495-L495,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L499-L499,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L509-L509,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L542-L542

```solidity
File: src/GameItems.sol

152:             allGameItemAttributes[tokenId].finiteSupply == false || 

154:                 allGameItemAttributes[tokenId].finiteSupply == true && 

258:         if (bytes(customURI).length > 0) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L154-L154,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L258-L258

```solidity
File: src/MergingPool.sol

164:         if (claimIndex > 0) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L164-L164

```solidity
File: src/Neuron.sol

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L156-L156

```solidity
File: src/RankedBattle.sol

235:         require(totalAccumulatedPoints[roundId] > 0);

245:         require(amount > 0, "Amount cannot be 0");

248:         require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

253:             if (amountStaked[tokenId] == 0) {

285:             if (amountStaked[tokenId] == 0) {

306:         if (claimableNRN > 0) {

332:         require(mergingPortion <= 100);

337:             _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST

342:         if (amountStaked[tokenId] + stakeAtRisk > 0) {

433:         if (_calculatedStakingFactor[tokenId][roundId] == false) {

440:         if (battleResult == 0) {

444:             if (stakeAtRisk == 0) {

460:             if (curStakeAtRisk > 0) {

469:             if (points > 0) {

472:         } else if (battleResult == 2) {

479:             if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {

488:                 if (points > 0) {

506:         if (battleResult == 0) {

508:         } else if (battleResult == 1) {

510:         } else if (battleResult == 2) {

530:       if (stakingFactor_ == 0) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L235-L235,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L245-L245,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L248-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L253-L253,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L285-L285,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L306-L306,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L332-L332,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L337-L337,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L342-L342,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L433-L433,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L440-L440,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L444-L444,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L460-L460,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L469-L469,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L472-L472,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L479-L479,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L488-L488,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L506-L506,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L508-L508,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L510-L510,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L530-L530

```solidity
File: src/VoltageManager.sol

94:          require(ownerVoltage[msg.sender] < 100);

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95

### [N-31]<a name="n-31"></a> Contract timekeeping will break earlier than the Ethereum network itself will stop working

When a timestamp is downcast from `uint256` to `uint32`, the value will wrap in the year 2106, and the contracts will break. Other downcasts will have different endpoints. Consider whether your contract is intended to live past the size of the type being used.

*There are 2 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

314:         dailyAllowanceReplenishTime[msg.sender][tokenId] = uint32(block.timestamp + 1 days);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L314-L314

```solidity
File: src/VoltageManager.sol

119:         ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L119-L119

### [N-32]<a name="n-32"></a> Contracts should have all `public`/`external` functions exposed by `interface`s

The `contract`s should expose an `interface` so that other projects can more easily integrate with it, without having to develop their own non-standard variants.

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit  attributes(), defaultAttributeDivisor(), attributeProbabilities(), attributeToDnaDivisor(), transferOwnership(), addAttributeDivisor(), createPhysicalAttributes(), addAttributeProbabilities(), deleteAttributeProbabilities(), getAttributeProbabilities(), dnaToIndex()
10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/FighterFarm.sol

/// @audit  MAX_FIGHTERS_ALLOWED(), maxRerollsAllowed(), rerollCost(), generation(), totalNumTrained(), treasuryAddress(), fighters(), fighterStaked(), numRerolls(), hasStakerRole(), numElements(), nftsClaimed(), numTrained(), transferOwnership(), incrementGeneration(), addStaker(), instantiateAIArenaHelperContract(), instantiateMintpassContract(), instantiateNeuronContract(), setMergingPoolAddress(), setTokenURI(), claimFighters(), redeemMintPass(), updateFighterStaking(), updateModel(), doesTokenExist(), mintFromMergingPool(), reRoll(), contractURI(), getAllFighterInfo()
16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

/// @audit  name(), symbol(), allGameItemAttributes(), treasuryAddress(), allowanceRemaining(), dailyAllowanceReplenishTime(), allowedBurningAddresses(), isAdmin(), transferOwnership(), adjustAdminAccess(), adjustTransferability(), instantiateNeuronContract(), mint(), setAllowedBurningAddresses(), setTokenURI(), createGameItem(), burn(), contractURI(), getAllowanceRemaining(), remainingSupply(), uniqueTokensOutstanding()
10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

/// @audit  winnersPerPeriod(), roundId(), totalPoints(), numRoundsClaimed(), fighterPoints(), winnerAddresses(), isSelectionComplete(), isAdmin(), transferOwnership(), adjustAdminAccess(), updateWinnersPerPeriod(), pickWinner(), claimRewards(), getUnclaimedRewards(), addPoints(), getFighterPoints()
9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/Neuron.sol

/// @audit  MINTER_ROLE(), SPENDER_ROLE(), STAKER_ROLE(), INITIAL_TREASURY_MINT(), INITIAL_CONTRIBUTOR_MINT(), MAX_SUPPLY(), treasuryAddress(), isAdmin(), transferOwnership(), addMinter(), addStaker(), addSpender(), adjustAdminAccess(), setupAirdrop(), claim(), mint(), burn(), approveSpender(), approveStaker(), burnFrom()
11   contract Neuron is ERC20, AccessControl {
12   
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17:      /// @notice Event emitted when tokens are claimed.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L17

```solidity
File: src/RankedBattle.sol

/// @audit  VOLTAGE_COST(), totalBattles(), globalStakedAmount(), roundId(), bpsLostPerLoss(), isAdmin(), fighterBattleRecord(), amountClaimed(), numRoundsClaimed(), accumulatedPointsPerAddress(), accumulatedPointsPerFighter(), totalAccumulatedPoints(), rankedNrnDistribution(), hasUnstaked(), amountStaked(), stakingFactor(), transferOwnership(), adjustAdminAccess(), setGameServerAddress(), setStakeAtRiskAddress(), instantiateNeuronContract(), instantiateMergingPoolContract(), setRankedNrnDistribution(), setBpsLostPerLoss(), setNewRound(), stakeNRN(), unstakeNRN(), claimNRN(), updateBattleRecord(), getBattleRecord(), getCurrentStakingData(), getNrnDistribution(), getUnclaimedNRN()
16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

/// @audit  roundId(), treasuryAddress(), totalStakeAtRisk(), stakeAtRisk(), amountLost(), setNewRound(), reclaimNRN(), updateAtRiskRecords(), getStakeAtRisk()
10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

/// @audit  allowedVoltageSpenders(), ownerVoltageReplenishTime(), ownerVoltage(), isAdmin(), transferOwnership(), adjustAdminAccess(), adjustAllowedVoltageSpenders(), useVoltageBattery(), spendVoltage()
9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [N-33]<a name="n-33"></a> Contracts should have full test coverage

While 100% code coverage does not guarantee that there are no bugs, it often will catch easy-to-find bugs, and will ensure that there are fewer regressions when the code invariably has to be modified. Furthermore, in order to get full coverage, code authors will often have to re-organize their code so that it is more modular, so that each component can be tested separately, which reduces interdependencies between modules and layers, and makes for code that is easier to reason about and audit.

*There are 0 instance(s) of this issue:*

```solidity
File: Various Files
```


### [N-34]<a name="n-34"></a> Critical system parameter changes should be behind a timelock

From the point of view of a user, the changing of the owner of a contract is a high risk operation that may have outcomes ranging from an attacker gaining control over the protocol, to the function no longer functioning due to a typo in the destination address. To give users plenty of warning so that they can validate any ownership or other critical parameter changes, these changes should be behind a timelock.

*There are 11 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

68       function addAttributeDivisor(uint8[] memory attributeDivisors) external {
69           require(msg.sender == _ownerAddress);
70           require(attributeDivisors.length == attributes.length);
71   
72           uint256 attributesLength = attributes.length;
73           for (uint8 i = 0; i < attributesLength; i++) {
74               attributeToDnaDivisor[attributes[i]] = attributeDivisors[i];
75           }
76:      }    

131      function addAttributeProbabilities(uint256 generation, uint8[][] memory probabilities) public {
132          require(msg.sender == _ownerAddress);
133          require(probabilities.length == 6, "Invalid number of attribute arrays");
134  
135          uint256 attributesLength = attributes.length;
136          for (uint8 i = 0; i < attributesLength; i++) {
137              attributeProbabilities[generation][attributes[i]] = probabilities[i];
138          }
139:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L68-L76,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L131-L139

```solidity
File: src/FighterFarm.sol

268      function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {
269          require(hasStakerRole[msg.sender]);
270          fighterStaked[tokenId] = stakingStatus;
271          if (stakingStatus) {
272              emit Locked(tokenId);
273          } else {
274              emit Unlocked(tokenId);
275          }
276:     }

283      function updateModel(
284          uint256 tokenId, 
285          string calldata modelHash,
286          string calldata modelType
287      ) 
288          external
289      {
290          require(msg.sender == ownerOf(tokenId));
291          fighters[tokenId].modelHash = modelHash;
292          fighters[tokenId].modelType = modelType;
293          numTrained[tokenId] += 1;
294          totalNumTrained += 1;
295:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L268-L276,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L283-L295

```solidity
File: src/MergingPool.sol

195      function addPoints(uint256 tokenId, uint256 points) public {
196          require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");
197          fighterPoints[tokenId] += points;
198          totalPoints += points;
199          emit PointsAdded(tokenId, points);
200:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L200

```solidity
File: src/Neuron.sol

93       function addMinter(address newMinterAddress) external {
94           require(msg.sender == _ownerAddress);
95           _setupRole(MINTER_ROLE, newMinterAddress);
96:      }

101      function addStaker(address newStakerAddress) external {
102          require(msg.sender == _ownerAddress);
103          _setupRole(STAKER_ROLE, newStakerAddress);
104:     }

109      function addSpender(address newSpenderAddress) external {
110          require(msg.sender == _ownerAddress);
111          _setupRole(SPENDER_ROLE, newSpenderAddress);
112:     }

127      function setupAirdrop(address[] calldata recipients, uint256[] calldata amounts) external {
128          require(isAdmin[msg.sender]);
129          require(recipients.length == amounts.length);
130          uint256 recipientsLength = recipients.length;
131          for (uint32 i = 0; i < recipientsLength; i++) {
132              _approve(treasuryAddress, recipients[i], amounts[i]);
133          }
134:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L93-L96,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L101-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L109-L112,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L127-L134

```solidity
File: src/RankedBattle.sol

322      function updateBattleRecord(
323          uint256 tokenId, 
324          uint256 mergingPortion,
325          uint8 battleResult,
326          uint256 eloFactor,
327          bool initiatorBool
328      ) 
329          external 
330      {   
331          require(msg.sender == _gameServerAddress);
332          require(mergingPortion <= 100);
333          address fighterOwner = _fighterFarmInstance.ownerOf(tokenId);
334          require(
335              !initiatorBool ||
336              _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 
337              _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST
338          );
339  
340          _updateRecord(tokenId, battleResult);
341          uint256 stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);
342          if (amountStaked[tokenId] + stakeAtRisk > 0) {
343              _addResultPoints(battleResult, tokenId, eloFactor, mergingPortion, fighterOwner);
344          }
345          if (initiatorBool) {
346              _voltageManagerInstance.spendVoltage(fighterOwner, VOLTAGE_COST);
347          }
348          totalBattles += 1;
349:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L322-L349

```solidity
File: src/StakeAtRisk.sol

115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

### [N-35]<a name="n-35"></a> Custom errors should be used rather than `revert()`/`require()`

Custom errors are available from solidity version 0.8.4. Custom errors are more easily processed in `try`-`catch` blocks, and are easier to re-use and maintain.

*There are 89 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

70:          require(attributeDivisors.length == attributes.length);

132:         require(msg.sender == _ownerAddress);

133:         require(probabilities.length == 6, "Invalid number of attribute arrays");

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L70-L70,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L133-L133,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

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

243          require(
244              mintpassIdsToBurn.length == mintPassDnas.length && 
245              mintPassDnas.length == fighterTypes.length && 
246              fighterTypes.length == modelHashes.length &&
247              modelHashes.length == modelTypes.length
248:         );

250:             require(msg.sender == _mintpassInstance.ownerOf(mintpassIdsToBurn[i]));

269:         require(hasStakerRole[msg.sender]);

290:         require(msg.sender == ownerOf(tokenId));

321:         require(msg.sender == _mergingPoolAddress);

346:         require(_ableToTransfer(tokenId, to));

363:         require(_ableToTransfer(tokenId, to));

371:         require(msg.sender == ownerOf(tokenId));

372:         require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);

373:         require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");

495:         require(balanceOf(to) < MAX_FIGHTERS_ALLOWED);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L164-L164,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L181-L181,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L206-L206,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L208-L208,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L243-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L250-L250,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L269-L269,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L290-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L321-L321,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L363-L363,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L371-L371,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L372-L372,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L373-L373,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L495-L495

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

148:         require(tokenId < _itemCount);

150:         require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");

151          require(
152              allGameItemAttributes[tokenId].finiteSupply == false || 
153              (
154                  allGameItemAttributes[tokenId].finiteSupply == true && 
155                  quantity <= allGameItemAttributes[tokenId].itemsRemaining
156              )
157:         );

158          require(
159              dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 
160              quantity <= allowanceRemaining[msg.sender][tokenId]
161:         );

186:         require(isAdmin[msg.sender]);

195:         require(isAdmin[msg.sender]);

219:         require(isAdmin[msg.sender]);

243:         require(allowedBurningAddresses[msg.sender]);

301:         require(allGameItemAttributes[tokenId].transferable);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L150-L150,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L151-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L158-L161,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L186-L186,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L195-L195,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L243-L243,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L301-L301

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

107:         require(isAdmin[msg.sender]);

119:         require(isAdmin[msg.sender]);

120:         require(winners.length == winnersPerPeriod, "Incorrect number of winners");

121:         require(!isSelectionComplete[roundId], "Winners are already selected");

196:         require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L107-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L121-L121,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L196-L196

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

128:         require(isAdmin[msg.sender]);

129:         require(recipients.length == amounts.length);

139          require(
140              allowance(treasuryAddress, msg.sender) >= amount, 
141              "ERC20: claim amount exceeds allowance"
142:         );

156:         require(totalSupply() + amount < MAX_SUPPLY, "Trying to mint more than the max supply");

157:         require(hasRole(MINTER_ROLE, msg.sender), "ERC20: must have minter role to mint");

172          require(
173              hasRole(SPENDER_ROLE, msg.sender), 
174              "ERC20: must have spender role to approve spending"
175:         );

185          require(
186              hasRole(STAKER_ROLE, msg.sender), 
187              "ERC20: must have staker role to approve staking"
188:         );

197          require(
198              allowance(account, msg.sender) >= amount, 
199              "ERC20: burn amount exceeds allowance"
200:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L128-L128,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L129-L129,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L139-L142,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L156-L156,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L157-L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L172-L175,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L185-L188,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L197-L200

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

245:         require(amount > 0, "Amount cannot be 0");

246:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

247:         require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");

248:         require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");

271:         require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");

295:         require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");

331:         require(msg.sender == _gameServerAddress);

332:         require(mergingPortion <= 100);

334          require(
335              !initiatorBool ||
336              _voltageManagerInstance.ownerVoltageReplenishTime(fighterOwner) <= block.timestamp || 
337              _voltageManagerInstance.ownerVoltage(fighterOwner) >= VOLTAGE_COST
338:         );

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L219-L219,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L227-L227,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L234-L234,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L235-L235,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L245-L245,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L246-L246,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L247-L247,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L248-L248,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L271-L271,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L295-L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L331-L331,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L332-L332,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L334-L338

```solidity
File: src/StakeAtRisk.sol

79:          require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

95           require(
96               stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97               "Fighter does not have enough stake at risk"
98:          );

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L79-L79,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L95-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

83:          require(isAdmin[msg.sender]);

94:          require(ownerVoltage[msg.sender] < 100);

95:          require(_gameItemsContractInstance.balanceOf(msg.sender, 0) > 0);

106:         require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L83-L83,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L106-L106

### [N-36]<a name="n-36"></a> Duplicated `require()`/`revert()` checks should be refactored to a modifier or function



*There are 27 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

62:          require(msg.sender == _ownerAddress);

69:          require(msg.sender == _ownerAddress);

132:         require(msg.sender == _ownerAddress);

145:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L145-L145

```solidity
File: src/FighterFarm.sol

346:         require(_ableToTransfer(tokenId, to));

363:         require(_ableToTransfer(tokenId, to));

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L346-L346,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L363-L363

```solidity
File: src/GameItems.sol

109:         require(msg.sender == _ownerAddress);

118:         require(msg.sender == _ownerAddress);

127:         require(msg.sender == _ownerAddress);

140:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L109-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L118-L118,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L127-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L140-L140

```solidity
File: src/MergingPool.sol

90:          require(msg.sender == _ownerAddress);

99:          require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L90-L90,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L99-L99

```solidity
File: src/Neuron.sol

86:          require(msg.sender == _ownerAddress);

94:          require(msg.sender == _ownerAddress);

102:         require(msg.sender == _ownerAddress);

110:         require(msg.sender == _ownerAddress);

119:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L86-L86,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L102-L102,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L110-L110,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L119-L119

```solidity
File: src/RankedBattle.sol

168:         require(msg.sender == _ownerAddress);

177:         require(msg.sender == _ownerAddress);

185:         require(msg.sender == _ownerAddress);

193:         require(msg.sender == _ownerAddress);

202:         require(msg.sender == _ownerAddress);

210:         require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L168-L168,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L177-L177,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L185-L185,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L193-L193,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L202-L202,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L210-L210

```solidity
File: src/StakeAtRisk.sol

94:          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

122:         require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L122-L122

```solidity
File: src/VoltageManager.sol

65:          require(msg.sender == _ownerAddress);

74:          require(msg.sender == _ownerAddress);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L65-L65,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L74-L74

### [N-37]<a name="n-37"></a> Event is not properly `indexed`

Index event fields make the field more quickly accessible [to off-chain tools](https://ethereum.stackexchange.com/questions/40396/can-somebody-please-explain-the-concept-of-event-indexing) that parse events. This is especially useful when it comes to filtering based on an address. However, note that each index field costs extra gas during emission, so it's not necessarily best to index the maximum allowed per event (three fields). Where applicable, each `event` should use three `indexed` fields if there are three or more fields, and gas usage is not particularly of concern for the events in question. If there are fewer than three applicable fields, all of the applicable fields should be indexed.

*There are 16 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

23:       event Locked(uint256 tokenId);

26:       event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L23,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L26

```solidity
File: src/GameItems.sol

20:       event BoughtItem(address buyer, uint256 tokenId, uint256 quantity);

24:       event Locked(uint256 tokenId);

28:       event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L24,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L28

```solidity
File: src/MergingPool.sol

16:       event PointsAdded(uint256 tokenId, uint256 points);

19:       event Claimed(address claimer, uint32 amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L19

```solidity
File: src/Neuron.sol

18:       event TokensClaimed(address user, uint256 amount);

21:       event TokensMinted(address user, uint256 amount);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L21

```solidity
File: src/RankedBattle.sol

26:       event Staked(address from, uint256 amount);

29:       event Unstaked(address from, uint256 amount);

32:       event Claimed(address claimer, uint256 amount);

35:       event PointsChanged(uint256 tokenId, uint256 points, bool increased);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L26,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L35

```solidity
File: src/StakeAtRisk.sol

17:       event ReclaimedStake(uint256 fighterId, uint256 reclaimAmount);

20:       event IncreasedStakeAtRisk(uint256 fighterId, uint256 atRiskAmount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L20

```solidity
File: src/VoltageManager.sol

16:       event VoltageRemaining(address spender, uint8 voltage);  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L16

### [N-38]<a name="n-38"></a> Events are missing sender information

When an action is triggered based on a user's action, not being able to filter based on who triggered the action makes event processing a lot more cumbersome. Including the `msg.sender` the events of these types of action will make events much more useful to end users, especially when `msg.sender` is not `tx.origin`.

*There are 11 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

274:             emit Unlocked(tokenId);

272:             emit Locked(tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L274-L274,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L272-L272

```solidity
File: src/GameItems.sol

132:           emit Locked(tokenId);

130:           emit Unlocked(tokenId);

231:           emit Locked(_itemCount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L132-L132,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L130-L130,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L231-L231

```solidity
File: src/MergingPool.sol

199:         emit PointsAdded(tokenId, points);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L199-L199

```solidity
File: src/RankedBattle.sol

489:                     emit PointsChanged(tokenId, points, false);

470:                 emit PointsChanged(tokenId, points, true);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L489-L489,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470

```solidity
File: src/StakeAtRisk.sol

105:             emit ReclaimedStake(fighterId, nrnToReclaim);

126:         emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L105-L105,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L126-L126

```solidity
File: src/VoltageManager.sol

111:         emit VoltageRemaining(spender, ownerVoltage[spender]);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L111-L111

### [N-39]<a name="n-39"></a> Events that mark critical parameter changes should contain both the old and the new value

This should especially be done if the new value is not required to be different from the old value

*There are 6 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

272:             emit Locked(tokenId);

274:             emit Unlocked(tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L272-L272,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L274-L274

```solidity
File: src/MergingPool.sol

199:         emit PointsAdded(tokenId, points);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L199-L199

```solidity
File: src/RankedBattle.sol

470:                 emit PointsChanged(tokenId, points, true);

489:                     emit PointsChanged(tokenId, points, false);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L470-L470,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L489-L489

```solidity
File: src/StakeAtRisk.sol

126:         emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L126-L126

### [N-40]<a name="n-40"></a> Expressions for constant values should use `immutable` rather than `constant`

While it does not save gas for some simple binary expressions because the compiler knows that developers often make this mistake, it's still best to use the right tool for the task at hand. There is a difference between `constant` variables and `immutable` variables, and they should each be used in their appropriate contexts. `constants` should be used for literal values written into the code, and `immutable` variables should be used for expressions, or values calculated in, or passed into the constructor.

*There are 11 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

17:      string[] public attributes = ["head", "eyes", "mouth", "body", "hands", "feet"];

20:      uint8[] public defaultAttributeDivisor = [2, 3, 5, 7, 11, 13];

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L17-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L20-L20

```solidity
File: src/FighterFarm.sol

36:      uint8[2] public maxRerollsAllowed = [3, 3];

39:      uint256 public rerollCost = 1000 * 10**18;    

42:      uint8[2] public generation = [0, 0];

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L36-L36,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L42-L42

```solidity
File: src/Neuron.sol

28:      bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

31:      bytes32 public constant SPENDER_ROLE = keccak256("SPENDER_ROLE");

34:      bytes32 public constant STAKER_ROLE = keccak256("STAKER_ROLE");

37:      uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

40:      uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

43:      uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L28-L28,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L31-L31,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L34-L34,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L37-L37,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L40-L40,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L43-L43

### [N-41]<a name="n-41"></a> High cyclomatic complexity

Consider breaking down these blocks into more manageable units, by splitting things into utility functions, by reducing nesting, and by using early returns

*There are 1 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

416      function _addResultPoints(
417          uint8 battleResult, 
418          uint256 tokenId, 
419          uint256 eloFactor, 
420          uint256 mergingPortion,
421          address fighterOwner
422      ) 
423          private 
424      {
425          uint256 stakeAtRisk;
426          uint256 curStakeAtRisk;
427          uint256 points = 0;
428  
429          /// Check how many NRNs the fighter has at risk
430          stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);
431  
432          /// Calculate the staking factor if it has not already been calculated for this round 
433          if (_calculatedStakingFactor[tokenId][roundId] == false) {
434              stakingFactor[tokenId] = _getStakingFactor(tokenId, stakeAtRisk);
435              _calculatedStakingFactor[tokenId][roundId] = true;
436          }
437  
438          /// Potential amount of NRNs to put at risk or retrieve from the stake-at-risk contract
439          curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;
440          if (battleResult == 0) {
441              /// If the user won the match
442  
443              /// If the user has no NRNs at risk, then they can earn points
444              if (stakeAtRisk == 0) {
445                  points = stakingFactor[tokenId] * eloFactor;
446              }
447  
448              /// Divert a portion of the points to the merging pool
449              uint256 mergingPoints = (points * mergingPortion) / 100;
450              points -= mergingPoints;
451              _mergingPoolInstance.addPoints(tokenId, mergingPoints);
452  
453              /// Do not allow users to reclaim more NRNs than they have at risk
454              if (curStakeAtRisk > stakeAtRisk) {
455                  curStakeAtRisk = stakeAtRisk;
456              }
457  
458              /// If the user has stake-at-risk for their fighter, reclaim a portion
459              /// Reclaiming stake-at-risk puts the NRN back into their staking pool
460              if (curStakeAtRisk > 0) {
461                  _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);
462                  amountStaked[tokenId] += curStakeAtRisk;
463              }
464  
465              /// Add points to the fighter for this round
466              accumulatedPointsPerFighter[tokenId][roundId] += points;
467              accumulatedPointsPerAddress[fighterOwner][roundId] += points;
468              totalAccumulatedPoints[roundId] += points;
469              if (points > 0) {
470                  emit PointsChanged(tokenId, points, true);
471              }
472          } else if (battleResult == 2) {
473              /// If the user lost the match
474  
475              /// Do not allow users to lose more NRNs than they have in their staking pool
476              if (curStakeAtRisk > amountStaked[tokenId]) {
477                  curStakeAtRisk = amountStaked[tokenId];
478              }
479              if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {
480                  /// If the fighter has a positive point balance for this round, deduct points 
481                  points = stakingFactor[tokenId] * eloFactor;
482                  if (points > accumulatedPointsPerFighter[tokenId][roundId]) {
483                      points = accumulatedPointsPerFighter[tokenId][roundId];
484                  }
485                  accumulatedPointsPerFighter[tokenId][roundId] -= points;
486                  accumulatedPointsPerAddress[fighterOwner][roundId] -= points;
487                  totalAccumulatedPoints[roundId] -= points;
488                  if (points > 0) {
489                      emit PointsChanged(tokenId, points, false);
490                  }
491              } else {
492                  /// If the fighter does not have any points for this round, NRNs become at risk of being lost
493                  bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);
494                  if (success) {
495                      _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);
496                      amountStaked[tokenId] -= curStakeAtRisk;
497                  }
498              }
499          }
500:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L500

### [N-42]<a name="n-42"></a> Import declarations should import specific identifiers, rather than the whole file

Using import declarations of the form `import {<identifier_name>} from "some/file.sol"` avoids polluting the symbol namespace making flattened files smaller, and speeds up compilation (but does not save any gas)

*There are 5 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

9:    import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

10:   import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L9,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L10

```solidity
File: src/GameItems.sol

5:    import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L5

```solidity
File: src/Neuron.sol

4:    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

5:    import "@openzeppelin/contracts/access/AccessControl.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L5

### [N-43]<a name="n-43"></a> Imports should use double quotes rather than single quotes



*There are 1 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

9:    import { FixedPointMathLib } from './FixedPointMathLib.sol';

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L9

### [N-44]<a name="n-44"></a> Large multiples of ten should use scientific notation

Large multiples of ten should use scientific notation (e.g. `1e6`) rather than decimal literals (e.g. `1000000`), for readability

*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit 1000
39:      uint256 public rerollCost = 1000 * 10**18;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39

```solidity
File: src/RankedBattle.sol

/// @audit 5000
157:         rankedNrnDistribution[0] = 5000 * 10**18;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157-L157

### [N-45]<a name="n-45"></a> Large numeric literals should use underscores for readability



*There are 2 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit 1000
39:      uint256 public rerollCost = 1000 * 10**18;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39-L39

```solidity
File: src/RankedBattle.sol

/// @audit 5000
157:         rankedNrnDistribution[0] = 5000 * 10**18;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157-L157

### [N-46]<a name="n-46"></a> Large or complicated code bases should implement invariant tests

Large code bases, or code with lots of inline-assembly, complicated math, or complicated interactions between multiple contracts, should implement [invariant fuzzing tests](https://medium.com/coinmonks/smart-contract-fuzzing-d9b88e0b0a05). Invariant fuzzers such as Echidna require the test writer to come up with invariants which should not be violated under any circumstances, and the fuzzer tests various inputs and function calls to ensure that the invariants always hold. Even code with 100% code coverage can still have bugs due to the order of the operations a user performs, and invariant fuzzers, with properly and extensively-written invariants, can close this testing gap significantly.

*There are 0 instance(s) of this issue:*

```solidity
File: Various Files
```


### [N-47]<a name="n-47"></a> Long functions should be refactored into multiple, smaller, functions



*There are 1 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

/// @audit 85 lines (75 in the body)
416       function _addResultPoints(
417           uint8 battleResult, 
418           uint256 tokenId, 
419           uint256 eloFactor, 
420           uint256 mergingPortion,
421:          address fighterOwner

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L421

### [N-48]<a name="n-48"></a> Missing checks for `address(0x0)` in the constructor



*There are 20 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit ownerAddress
/// @audit delegatedAddress
/// @audit treasuryAddress_
104      constructor(address ownerAddress, address delegatedAddress, address treasuryAddress_)
105          ERC721("AI Arena Fighter", "FTR")
106:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L104

```solidity
File: src/GameItems.sol

/// @audit ownerAddress
/// @audit treasuryAddress_
95:      constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95

```solidity
File: src/MergingPool.sol

/// @audit ownerAddress
/// @audit rankedBattleAddress
/// @audit fighterFarmAddress
71       constructor(
72           address ownerAddress, 
73           address rankedBattleAddress, 
74           address fighterFarmAddress
75:      ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L72-L72,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L74-L74

```solidity
File: src/Neuron.sol

/// @audit ownerAddress
/// @audit treasuryAddress_
/// @audit contributorAddress
68       constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
69           ERC20("Neuron", "NRN")
70:      {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L68

```solidity
File: src/RankedBattle.sol

/// @audit ownerAddress
/// @audit gameServerAddress
/// @audit fighterFarmAddress
/// @audit voltageManagerAddress
146      constructor(
147        address ownerAddress, 
148        address gameServerAddress,
149        address fighterFarmAddress,
150        address voltageManagerAddress
151:     ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L149-L149,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L150-L150

```solidity
File: src/StakeAtRisk.sol

/// @audit treasuryAddress_
/// @audit nrnAddress
/// @audit rankedBattleAddress
60       constructor(
61           address treasuryAddress_,
62           address nrnAddress,
63           address rankedBattleAddress
64:      ) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L61-L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L63-L63

```solidity
File: src/VoltageManager.sol

/// @audit ownerAddress
/// @audit gameItemsContractAddress
51:      constructor(address ownerAddress, address gameItemsContractAddress) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51-L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51-L51

### [N-49]<a name="n-49"></a> Missing checks for empty parameters in the constructor



*There are 1 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit probabilities
41:      constructor(uint8[][] memory probabilities) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L41-L41

### [N-50]<a name="n-50"></a> Missing checks for uint state variable assignments

Consider whether reasonable bounds checks for variables would be useful

*There are 1 instance(s) of this issue:*

```solidity
File: src/RankedBattle.sol

/// @audit setBpsLostPerLoss(bpsLostPerLoss_)
228:         bpsLostPerLoss = bpsLostPerLoss_;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L226

### [N-51]<a name="n-51"></a> Missing event for critical parameter change

Events help non-contract tools to track changes

*There are 21 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit _ownerAddress:  transferOwnership()
61:      function transferOwnership(address newOwnerAddress) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L61-L61

```solidity
File: src/FighterFarm.sol

/// @audit _ownerAddress:  transferOwnership()
120:     function transferOwnership(address newOwnerAddress) external {

/// @audit _mergingPoolAddress:  setMergingPoolAddress()
171:     function setMergingPoolAddress(address mergingPoolAddress) external {

/// @audit _tokenURIs:  setTokenURI()
180:     function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {

/// @audit fighters:  updateModel()
283      function updateModel(
284          uint256 tokenId, 
285          string calldata modelHash,
286          string calldata modelType
287      ) 
288          external
289:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L120-L120,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L171,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L180-L180,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L283-L289

```solidity
File: src/GameItems.sol

/// @audit _ownerAddress:  transferOwnership()
108:     function transferOwnership(address newOwnerAddress) external {

/// @audit isAdmin:  adjustAdminAccess()
117:     function adjustAdminAccess(address adminAddress, bool access) external {

/// @audit _tokenURIs:  setTokenURI()
194:     function setTokenURI(uint256 tokenId, string memory _tokenURI) public {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L108-L108,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L117-L117,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L194-L194

```solidity
File: src/MergingPool.sol

/// @audit _ownerAddress:  transferOwnership()
89:      function transferOwnership(address newOwnerAddress) external {

/// @audit isAdmin:  adjustAdminAccess()
98:      function adjustAdminAccess(address adminAddress, bool access) external {

/// @audit winnersPerPeriod:  updateWinnersPerPeriod()
106:     function updateWinnersPerPeriod(uint256 newWinnersPerPeriodAmount) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L89-L89,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L98-L98,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L106

```solidity
File: src/Neuron.sol

/// @audit _ownerAddress:  transferOwnership()
85:      function transferOwnership(address newOwnerAddress) external {

/// @audit isAdmin:  adjustAdminAccess()
118:     function adjustAdminAccess(address adminAddress, bool access) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L118-L118

```solidity
File: src/RankedBattle.sol

/// @audit _ownerAddress:  transferOwnership()
167:     function transferOwnership(address newOwnerAddress) external {

/// @audit isAdmin:  adjustAdminAccess()
176:     function adjustAdminAccess(address adminAddress, bool access) external {

/// @audit _gameServerAddress:  setGameServerAddress()
184:     function setGameServerAddress(address gameServerAddress) external {

/// @audit _stakeAtRiskAddress:  setStakeAtRiskAddress()
192:     function setStakeAtRiskAddress(address stakeAtRiskAddress) external {

/// @audit bpsLostPerLoss:  setBpsLostPerLoss()
226:     function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L167-L167,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L184,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L192,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L226

```solidity
File: src/VoltageManager.sol

/// @audit _ownerAddress:  transferOwnership()
64:      function transferOwnership(address newOwnerAddress) external {

/// @audit isAdmin:  adjustAdminAccess()
73:      function adjustAdminAccess(address adminAddress, bool access) external {

/// @audit allowedVoltageSpenders:  adjustAllowedVoltageSpenders()
82:      function adjustAllowedVoltageSpenders(address allowedVoltageSpender, bool allowed) external {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L64-L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L82-L82

### [N-52]<a name="n-52"></a> Multiple `address`/ID mappings can be combined into a single `mapping` of an `address`/ID to a `struct`, for readability

Well-organized data structures make code reviews easier, which may lead to fewer bugs. Consider combining related mappings into mappings to structs, so it's clear what data is related. The instances below refer to both mappings using the same key in the same function, so the mappings are related.

*There are 16 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit combine into a `struct`: _tokenURIs,numRerolls
370      function reRoll(uint8 tokenId, uint8 fighterType) public {
371          require(msg.sender == ownerOf(tokenId));
372          require(numRerolls[tokenId] < maxRerollsAllowed[fighterType]);
373          require(_neuronInstance.balanceOf(msg.sender) >= rerollCost, "Not enough NRN for reroll");
374  
375          _neuronInstance.approveSpender(msg.sender, rerollCost);
376          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, rerollCost);
377          if (success) {
378              numRerolls[tokenId] += 1;
379              uint256 dna = uint256(keccak256(abi.encode(msg.sender, tokenId, numRerolls[tokenId])));
380              (uint256 element, uint256 weight, uint256 newDna) = _createFighterBase(dna, fighterType);
381              fighters[tokenId].element = element;
382              fighters[tokenId].weight = weight;
383              fighters[tokenId].physicalAttributes = _aiArenaHelperInstance.createPhysicalAttributes(
384                  newDna,
385                  generation[fighterType],
386                  fighters[tokenId].iconsType,
387                  fighters[tokenId].dendroidBool
388              );
389              _tokenURIs[tokenId] = "";
390          }
391:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370-L391

```solidity
File: src/GameItems.sol

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
147      function mint(uint256 tokenId, uint256 quantity) external {
148          require(tokenId < _itemCount);
149          uint256 price = allGameItemAttributes[tokenId].itemPrice * quantity;
150          require(_neuronInstance.balanceOf(msg.sender) >= price, "Not enough NRN for purchase");
151          require(
152              allGameItemAttributes[tokenId].finiteSupply == false || 
153              (
154                  allGameItemAttributes[tokenId].finiteSupply == true && 
155                  quantity <= allGameItemAttributes[tokenId].itemsRemaining
156              )
157          );
158          require(
159              dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp || 
160              quantity <= allowanceRemaining[msg.sender][tokenId]
161          );
162  
163          _neuronInstance.approveSpender(msg.sender, price);
164          bool success = _neuronInstance.transferFrom(msg.sender, treasuryAddress, price);
165          if (success) {
166              if (dailyAllowanceReplenishTime[msg.sender][tokenId] <= block.timestamp) {
167                  _replenishDailyAllowance(tokenId);
168              }
169              allowanceRemaining[msg.sender][tokenId] -= quantity;
170              if (allGameItemAttributes[tokenId].finiteSupply) {
171                  allGameItemAttributes[tokenId].itemsRemaining -= quantity;
172              }
173              _mint(msg.sender, tokenId, quantity, bytes("random"));
174              emit BoughtItem(msg.sender, tokenId, quantity);
175          }
176:     }

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
268      function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {
269          uint256 remaining = allowanceRemaining[owner][tokenId];
270          if (dailyAllowanceReplenishTime[owner][tokenId] <= block.timestamp) {
271              remaining = allGameItemAttributes[tokenId].dailyAllowance;
272          }
273          return remaining;
274:     }

/// @audit combine into a `struct`: allowanceRemaining,dailyAllowanceReplenishTime
312      function _replenishDailyAllowance(uint256 tokenId) private {
313          allowanceRemaining[msg.sender][tokenId] = allGameItemAttributes[tokenId].dailyAllowance;
314          dailyAllowanceReplenishTime[msg.sender][tokenId] = uint32(block.timestamp + 1 days);
315:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268-L274,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L312-L315

```solidity
File: src/MergingPool.sol

/// @audit combine into a `struct`: isSelectionComplete,winnerAddresses
118      function pickWinner(uint256[] calldata winners) external {
119          require(isAdmin[msg.sender]);
120          require(winners.length == winnersPerPeriod, "Incorrect number of winners");
121          require(!isSelectionComplete[roundId], "Winners are already selected");
122          uint256 winnersLength = winners.length;
123          address[] memory currentWinnerAddresses = new address[](winnersLength);
124          for (uint256 i = 0; i < winnersLength; i++) {
125              currentWinnerAddresses[i] = _fighterFarmInstance.ownerOf(winners[i]);
126              totalPoints -= fighterPoints[winners[i]];
127              fighterPoints[winners[i]] = 0;
128          }
129          winnerAddresses[roundId] = currentWinnerAddresses;
130          isSelectionComplete[roundId] = true;
131          roundId += 1;
132:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L118-L132

```solidity
File: src/RankedBattle.sol

/// @audit combine into a `struct`: rankedNrnDistribution,totalAccumulatedPoints
233      function setNewRound() external {
234          require(isAdmin[msg.sender]);
235          require(totalAccumulatedPoints[roundId] > 0);
236          roundId += 1;
237          _stakeAtRiskInstance.setNewRound(roundId);
238          rankedNrnDistribution[roundId] = rankedNrnDistribution[roundId - 1];
239:     }

/// @audit combine into a `struct`: _calculatedStakingFactor,amountStaked,hasUnstaked,stakingFactor
244      function stakeNRN(uint256 amount, uint256 tokenId) external {
245          require(amount > 0, "Amount cannot be 0");
246          require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
247          require(_neuronInstance.balanceOf(msg.sender) >= amount, "Stake amount exceeds balance");
248          require(hasUnstaked[tokenId][roundId] == false, "Cannot add stake after unstaking this round");
249  
250          _neuronInstance.approveStaker(msg.sender, address(this), amount);
251          bool success = _neuronInstance.transferFrom(msg.sender, address(this), amount);
252          if (success) {
253              if (amountStaked[tokenId] == 0) {
254                  _fighterFarmInstance.updateFighterStaking(tokenId, true);
255              }
256              amountStaked[tokenId] += amount;
257              globalStakedAmount += amount;
258              stakingFactor[tokenId] = _getStakingFactor(
259                  tokenId, 
260                  _stakeAtRiskInstance.getStakeAtRisk(tokenId)
261              );
262              _calculatedStakingFactor[tokenId][roundId] = true;
263              emit Staked(msg.sender, amount);
264          }
265:     }

/// @audit combine into a `struct`: _calculatedStakingFactor,amountStaked,hasUnstaked,stakingFactor
270      function unstakeNRN(uint256 amount, uint256 tokenId) external {
271          require(_fighterFarmInstance.ownerOf(tokenId) == msg.sender, "Caller does not own fighter");
272          if (amount > amountStaked[tokenId]) {
273              amount = amountStaked[tokenId];
274          }
275          amountStaked[tokenId] -= amount;
276          globalStakedAmount -= amount;
277          stakingFactor[tokenId] = _getStakingFactor(
278              tokenId, 
279              _stakeAtRiskInstance.getStakeAtRisk(tokenId)
280          );
281          _calculatedStakingFactor[tokenId][roundId] = true;
282          hasUnstaked[tokenId][roundId] = true;
283          bool success = _neuronInstance.transfer(msg.sender, amount);
284          if (success) {
285              if (amountStaked[tokenId] == 0) {
286                  _fighterFarmInstance.updateFighterStaking(tokenId, false);
287              }
288              emit Unstaked(msg.sender, amount);
289          }
290:     }

/// @audit combine into a `struct`: accumulatedPointsPerAddress,amountClaimed,numRoundsClaimed
294      function claimNRN() external {
295          require(numRoundsClaimed[msg.sender] < roundId, "Already claimed NRNs for this period");
296          uint256 claimableNRN = 0;
297          uint256 nrnDistribution;
298          uint32 lowerBound = numRoundsClaimed[msg.sender];
299          for (uint32 currentRound = lowerBound; currentRound < roundId; currentRound++) {
300              nrnDistribution = getNrnDistribution(currentRound);
301              claimableNRN += (
302                  accumulatedPointsPerAddress[msg.sender][currentRound] * nrnDistribution   
303              ) / totalAccumulatedPoints[currentRound];
304              numRoundsClaimed[msg.sender] += 1;
305          }
306          if (claimableNRN > 0) {
307              amountClaimed[msg.sender] += claimableNRN;
308              _neuronInstance.mint(msg.sender, claimableNRN);
309              emit Claimed(msg.sender, claimableNRN);
310          }
311:     }

/// @audit combine into a `struct`: rankedNrnDistribution,totalAccumulatedPoints
364      function getCurrentStakingData() external view returns(uint256, uint256, uint256) {
365        return (
366            roundId,
367            rankedNrnDistribution[roundId], 
368            totalAccumulatedPoints[roundId]
369        );
370:     }

/// @audit combine into a `struct`: accumulatedPointsPerAddress,numRoundsClaimed
386      function getUnclaimedNRN(address claimer) public view returns(uint256) {
387          uint256 claimableNRN = 0;
388          uint256 nrnDistribution;   
389          uint32 lowerBound = numRoundsClaimed[claimer];
390          for (uint32 i = lowerBound; i < roundId; i++) {
391              nrnDistribution = getNrnDistribution(i);
392              claimableNRN += (
393                  accumulatedPointsPerAddress[claimer][i] * nrnDistribution
394              ) / totalAccumulatedPoints[i];
395          }
396          return claimableNRN;
397:     } 

/// @audit combine into a `struct`: _calculatedStakingFactor,accumulatedPointsPerFighter,amountStaked,stakingFactor
416      function _addResultPoints(
417          uint8 battleResult, 
418          uint256 tokenId, 
419          uint256 eloFactor, 
420          uint256 mergingPortion,
421          address fighterOwner
422      ) 
423          private 
424      {
425          uint256 stakeAtRisk;
426          uint256 curStakeAtRisk;
427          uint256 points = 0;
428  
429          /// Check how many NRNs the fighter has at risk
430          stakeAtRisk = _stakeAtRiskInstance.getStakeAtRisk(tokenId);
431  
432          /// Calculate the staking factor if it has not already been calculated for this round 
433          if (_calculatedStakingFactor[tokenId][roundId] == false) {
434              stakingFactor[tokenId] = _getStakingFactor(tokenId, stakeAtRisk);
435              _calculatedStakingFactor[tokenId][roundId] = true;
436          }
437  
438          /// Potential amount of NRNs to put at risk or retrieve from the stake-at-risk contract
439          curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;
440          if (battleResult == 0) {
441              /// If the user won the match
442  
443              /// If the user has no NRNs at risk, then they can earn points
444              if (stakeAtRisk == 0) {
445                  points = stakingFactor[tokenId] * eloFactor;
446              }
447  
448              /// Divert a portion of the points to the merging pool
449              uint256 mergingPoints = (points * mergingPortion) / 100;
450              points -= mergingPoints;
451              _mergingPoolInstance.addPoints(tokenId, mergingPoints);
452  
453              /// Do not allow users to reclaim more NRNs than they have at risk
454              if (curStakeAtRisk > stakeAtRisk) {
455                  curStakeAtRisk = stakeAtRisk;
456              }
457  
458              /// If the user has stake-at-risk for their fighter, reclaim a portion
459              /// Reclaiming stake-at-risk puts the NRN back into their staking pool
460              if (curStakeAtRisk > 0) {
461                  _stakeAtRiskInstance.reclaimNRN(curStakeAtRisk, tokenId, fighterOwner);
462                  amountStaked[tokenId] += curStakeAtRisk;
463              }
464  
465              /// Add points to the fighter for this round
466              accumulatedPointsPerFighter[tokenId][roundId] += points;
467              accumulatedPointsPerAddress[fighterOwner][roundId] += points;
468              totalAccumulatedPoints[roundId] += points;
469              if (points > 0) {
470                  emit PointsChanged(tokenId, points, true);
471              }
472          } else if (battleResult == 2) {
473              /// If the user lost the match
474  
475              /// Do not allow users to lose more NRNs than they have in their staking pool
476              if (curStakeAtRisk > amountStaked[tokenId]) {
477                  curStakeAtRisk = amountStaked[tokenId];
478              }
479              if (accumulatedPointsPerFighter[tokenId][roundId] > 0) {
480                  /// If the fighter has a positive point balance for this round, deduct points 
481                  points = stakingFactor[tokenId] * eloFactor;
482                  if (points > accumulatedPointsPerFighter[tokenId][roundId]) {
483                      points = accumulatedPointsPerFighter[tokenId][roundId];
484                  }
485                  accumulatedPointsPerFighter[tokenId][roundId] -= points;
486                  accumulatedPointsPerAddress[fighterOwner][roundId] -= points;
487                  totalAccumulatedPoints[roundId] -= points;
488                  if (points > 0) {
489                      emit PointsChanged(tokenId, points, false);
490                  }
491              } else {
492                  /// If the fighter does not have any points for this round, NRNs become at risk of being lost
493                  bool success = _neuronInstance.transfer(_stakeAtRiskAddress, curStakeAtRisk);
494                  if (success) {
495                      _stakeAtRiskInstance.updateAtRiskRecords(curStakeAtRisk, tokenId, fighterOwner);
496                      amountStaked[tokenId] -= curStakeAtRisk;
497                  }
498              }
499          }
500:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L233-L239,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L244-L265,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L270-L290,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L294-L311,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L364-L370,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386-L397,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L416-L500

```solidity
File: src/StakeAtRisk.sol

/// @audit combine into a `struct`: stakeAtRisk,totalStakeAtRisk
93       function reclaimNRN(uint256 nrnToReclaim, uint256 fighterId, address fighterOwner) external {
94           require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
95           require(
96               stakeAtRisk[roundId][fighterId] >= nrnToReclaim, 
97               "Fighter does not have enough stake at risk"
98           );
99   
100          bool success = _neuronInstance.transfer(_rankedBattleAddress, nrnToReclaim);
101          if (success) {
102              stakeAtRisk[roundId][fighterId] -= nrnToReclaim;
103              totalStakeAtRisk[roundId] -= nrnToReclaim;
104              amountLost[fighterOwner] -= nrnToReclaim;
105              emit ReclaimedStake(fighterId, nrnToReclaim);
106          }
107:     }

/// @audit combine into a `struct`: stakeAtRisk,totalStakeAtRisk
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L93-L107,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

```solidity
File: src/VoltageManager.sol

/// @audit combine into a `struct`: ownerVoltage,ownerVoltageReplenishTime
105      function spendVoltage(address spender, uint8 voltageSpent) public {
106          require(spender == msg.sender || allowedVoltageSpenders[msg.sender]);
107          if (ownerVoltageReplenishTime[spender] <= block.timestamp) {
108              _replenishVoltage(spender);
109          }
110          ownerVoltage[spender] -= voltageSpent;
111          emit VoltageRemaining(spender, ownerVoltage[spender]);
112:     }

/// @audit combine into a `struct`: ownerVoltage,ownerVoltageReplenishTime
117      function _replenishVoltage(address owner) private {
118          ownerVoltage[owner] = 100;
119          ownerVoltageReplenishTime[owner] = uint32(block.timestamp + 1 days);
120:     }    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L105-L112,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L117-L120

### [N-53]<a name="n-53"></a> Named imports of parent contracts are missing



*There are 5 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit ERC721
/// @audit ERC721Enumerable
16:  contract FighterFarm is ERC721, ERC721Enumerable {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L16

```solidity
File: src/GameItems.sol

/// @audit ERC1155
10:  contract GameItems is ERC1155 {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L10

```solidity
File: src/Neuron.sol

/// @audit ERC20
/// @audit AccessControl
11:  contract Neuron is ERC20, AccessControl {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L11,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L11-L11

### [N-54]<a name="n-54"></a> NatSpec: Contract declarations should have `@dev` tags

`@dev` is used to explain extra details to developers

*There are 7 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

10   contract AiArenaHelper {
11   
12       /*//////////////////////////////////////////////////////////////
13                               STATE VARIABLES
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice List of attributes

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L10-L16

```solidity
File: src/FighterFarm.sol

16   contract FighterFarm is ERC721, ERC721Enumerable {
17   
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22:      /// @notice Event emitted when a fighter is locked and thus cannot be traded.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L16-L22

```solidity
File: src/GameItems.sol

10   contract GameItems is ERC1155 {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19:      /// @param quantity The quantity of the game item.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L10-L19

```solidity
File: src/MergingPool.sol

9    contract MergingPool {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when merging pool points are added.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L9-L15

```solidity
File: src/RankedBattle.sol

16   contract RankedBattle {
17   
18:      /// @dev Extend functionality of the FixedPointMathLib library to the uint data type.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L16-L18

```solidity
File: src/StakeAtRisk.sol

10   contract StakeAtRisk {
11   
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16:      /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L10-L16

```solidity
File: src/VoltageManager.sol

9    contract VoltageManager {
10   
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15:      /// @notice Event emitted when voltage amount is altered.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L9-L15

### [N-55]<a name="n-55"></a> NatSpec: Event `@param` tag is missing



*There are 30 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit Missing '@param tokenId'
18       /*//////////////////////////////////////////////////////////////
19                                   EVENTS
20       //////////////////////////////////////////////////////////////*/
21   
22       /// @notice Event emitted when a fighter is locked and thus cannot be traded.
23:      event Locked(uint256 tokenId);

/// @audit Missing '@param tokenId'
21   
22       /// @notice Event emitted when a fighter is locked and thus cannot be traded.
23       event Locked(uint256 tokenId);
24   
25       /// @notice Event emitted when a fighter is unlocked and can be traded.
26:      event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L18-L23,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L21-L26

```solidity
File: src/GameItems.sol

/// @audit Missing '@param buyer'
/// @audit Missing '@param tokenId'
/// @audit Missing '@param quantity'
15   
16       /// @notice Event emitted when a game item is bought.
17       /// @param buyer The address of the buyer.
18       /// @param tokenId The id of the game item.
19       /// @param quantity The quantity of the game item.
20:      event BoughtItem(address buyer, uint256 tokenId, uint256 quantity);

/// @audit Missing '@param tokenId'
19       /// @param quantity The quantity of the game item.
20       event BoughtItem(address buyer, uint256 tokenId, uint256 quantity);
21   
22       /// @notice Event emitted when an item is locked and thus cannot be traded.
23       /// @param tokenId The id of the game item.
24:      event Locked(uint256 tokenId);

/// @audit Missing '@param tokenId'
23       /// @param tokenId The id of the game item.
24       event Locked(uint256 tokenId);
25   
26       /// @notice Event emitted when an item is unlocked and can be traded.
27       /// @param tokenId The id of the game item.
28:      event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L15-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L15-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L15-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L19-L24,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L23-L28

```solidity
File: src/MergingPool.sol

/// @audit Missing '@param tokenId'
/// @audit Missing '@param points'
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15       /// @notice Event emitted when merging pool points are added.
16:      event PointsAdded(uint256 tokenId, uint256 points);

/// @audit Missing '@param claimer'
/// @audit Missing '@param amount'
14   
15       /// @notice Event emitted when merging pool points are added.
16       event PointsAdded(uint256 tokenId, uint256 points);
17   
18       /// @notice Event emitted when claimed.
19:      event Claimed(address claimer, uint32 amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L11-L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L11-L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L14-L19,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L14-L19

```solidity
File: src/Neuron.sol

/// @audit Missing '@param user'
/// @audit Missing '@param amount'
13       /*//////////////////////////////////////////////////////////////
14                                   EVENTS
15       //////////////////////////////////////////////////////////////*/
16   
17       /// @notice Event emitted when tokens are claimed.
18:      event TokensClaimed(address user, uint256 amount);

/// @audit Missing '@param user'
/// @audit Missing '@param amount'
16   
17       /// @notice Event emitted when tokens are claimed.
18       event TokensClaimed(address user, uint256 amount);
19   
20       /// @notice Event emitted when tokens are minted.
21:      event TokensMinted(address user, uint256 amount);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L13-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L13-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L16-L21,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L16-L21

```solidity
File: src/RankedBattle.sol

/// @audit Missing '@param from'
/// @audit Missing '@param amount'
21       /*//////////////////////////////////////////////////////////////
22                                   EVENTS
23       //////////////////////////////////////////////////////////////*/
24   
25       /// @notice Event emitted when staked.
26:      event Staked(address from, uint256 amount);

/// @audit Missing '@param from'
/// @audit Missing '@param amount'
24   
25       /// @notice Event emitted when staked.
26       event Staked(address from, uint256 amount);
27   
28       /// @notice Event emitted when unstaked.
29:      event Unstaked(address from, uint256 amount);

/// @audit Missing '@param claimer'
/// @audit Missing '@param amount'
27   
28       /// @notice Event emitted when unstaked.
29       event Unstaked(address from, uint256 amount);
30   
31       /// @notice Event emitted when claimed.
32:      event Claimed(address claimer, uint256 amount);

/// @audit Missing '@param tokenId'
/// @audit Missing '@param points'
/// @audit Missing '@param increased'
30   
31       /// @notice Event emitted when claimed.
32       event Claimed(address claimer, uint256 amount);
33   
34       /// @notice Event emitted when points are added or subtracted from a fighter.
35:      event PointsChanged(uint256 tokenId, uint256 points, bool increased);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L21-L26,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L21-L26,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L24-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L24-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L27-L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L27-L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L30-L35,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L30-L35,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L30-L35

```solidity
File: src/StakeAtRisk.sol

/// @audit Missing '@param fighterId'
/// @audit Missing '@param reclaimAmount'
12       /*//////////////////////////////////////////////////////////////
13                                   EVENTS
14       //////////////////////////////////////////////////////////////*/
15   
16       /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).
17:      event ReclaimedStake(uint256 fighterId, uint256 reclaimAmount);

/// @audit Missing '@param fighterId'
/// @audit Missing '@param atRiskAmount'
15   
16       /// @notice Event emitted when NRNs are reclaimed from this contract (after a win in ranked).
17       event ReclaimedStake(uint256 fighterId, uint256 reclaimAmount);
18   
19       /// @notice Event emitted when more NRNs are placed at risk.
20:      event IncreasedStakeAtRisk(uint256 fighterId, uint256 atRiskAmount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L12-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L12-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L15-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L15-L20

```solidity
File: src/VoltageManager.sol

/// @audit Missing '@param spender'
/// @audit Missing '@param voltage'
11       /*//////////////////////////////////////////////////////////////
12                                   EVENTS
13       //////////////////////////////////////////////////////////////*/
14   
15       /// @notice Event emitted when voltage amount is altered.
16:      event VoltageRemaining(address spender, uint8 voltage);  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L11-L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L11-L16

### [N-56]<a name="n-56"></a> NatSpec: Event declarations should have `@dev` tags

`@dev` is used to explain extra details to developers

*There are 16 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

23:      event Locked(uint256 tokenId);

26:      event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L23-L23,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L26-L26

```solidity
File: src/GameItems.sol

20:      event BoughtItem(address buyer, uint256 tokenId, uint256 quantity);

24:      event Locked(uint256 tokenId);

28:      event Unlocked(uint256 tokenId);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L20-L20,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L24-L24,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L28-L28

```solidity
File: src/MergingPool.sol

16:      event PointsAdded(uint256 tokenId, uint256 points);

19:      event Claimed(address claimer, uint32 amount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L16-L16,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L19-L19

```solidity
File: src/Neuron.sol

18:      event TokensClaimed(address user, uint256 amount);

21:      event TokensMinted(address user, uint256 amount);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L18-L18,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L21-L21

```solidity
File: src/RankedBattle.sol

26:      event Staked(address from, uint256 amount);

29:      event Unstaked(address from, uint256 amount);

32:      event Claimed(address claimer, uint256 amount);

35:      event PointsChanged(uint256 tokenId, uint256 points, bool increased);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L26-L26,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L29-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L32-L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L35-L35

```solidity
File: src/StakeAtRisk.sol

17:      event ReclaimedStake(uint256 fighterId, uint256 reclaimAmount);

20:      event IncreasedStakeAtRisk(uint256 fighterId, uint256 atRiskAmount);

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L17-L17,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L20-L20

```solidity
File: src/VoltageManager.sol

16:      event VoltageRemaining(address spender, uint8 voltage);  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L16-L16

### [N-57]<a name="n-57"></a> NatSpec: Function `@param` tag is missing



*There are 9 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

/// @audit Missing '@param generation'
80       /// @param iconsType Type of icons fighter (0 means it's not an icon).
81       /// @param dendroidBool Whether the fighter is a dendroid or not
82       /// @return Fighter physical attributes.
83       function createPhysicalAttributes(
84           uint256 dna, 
85:          uint8 generation, 

/// @audit Missing '@param generation'
164  
165       /// @dev Convert DNA and rarity rank into an attribute probability index.
166       /// @param attribute The attribute name.
167       /// @param rarityRank The rarity rank.
168       /// @return attributeProbabilityIndex attribute probability index.
169:     function dnaToIndex(uint256 generation, uint256 rarityRank, string memory attribute) 

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L80-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L164-L169

```solidity
File: src/FighterFarm.sol

/// @audit Missing '@param iconsTypes'
231      /// @param modelHashes Array of ML model hashes corresponding to the fighters being minted. 
232      /// @param modelTypes Array of ML model types corresponding to the fighters being minted.
233      function redeemMintPass(
234          uint256[] calldata mintpassIdsToBurn,
235          uint8[] calldata fighterTypes,
236:         uint8[] calldata iconsTypes,

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L231-L236

```solidity
File: src/GameItems.sol

/// @audit Missing '@param from'
287      }
288  
289      /// @notice Safely transfers an NFT from one address to another.
290      /// @dev Added a check to see if the game item is transferable.
291      function safeTransferFrom(
292:         address from, 

/// @audit Missing '@param to'
288  
289      /// @notice Safely transfers an NFT from one address to another.
290      /// @dev Added a check to see if the game item is transferable.
291      function safeTransferFrom(
292          address from, 
293:         address to, 

/// @audit Missing '@param tokenId'
289      /// @notice Safely transfers an NFT from one address to another.
290      /// @dev Added a check to see if the game item is transferable.
291      function safeTransferFrom(
292          address from, 
293          address to, 
294:         uint256 tokenId,

/// @audit Missing '@param amount'
290      /// @dev Added a check to see if the game item is transferable.
291      function safeTransferFrom(
292          address from, 
293          address to, 
294          uint256 tokenId,
295:         uint256 amount,

/// @audit Missing '@param data'
291      function safeTransferFrom(
292          address from, 
293          address to, 
294          uint256 tokenId,
295          uint256 amount,
296:         bytes memory data

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L287-L292,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L288-L293,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L289-L294,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L290-L295,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L296

```solidity
File: src/StakeAtRisk.sol

/// @audit Missing '@param fighterOwner'
113      /// @param nrnToPlaceAtRisk The amount of NRN tokens to place at risk.
114      /// @param fighterId The ID of the fighter.
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118:         address fighterOwner

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L113-L118

### [N-58]<a name="n-58"></a> NatSpec: Function `@return` tag is missing



*There are 3 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit Missing '@return  '
297      /// @notice Checks whether the given token ID exists.
298      /// @param tokenId The ID of the fighter to check for existence.
299:     function doesTokenExist(uint256 tokenId) external view returns (bool) {

/// @audit Missing '@return  '
419      /// @notice Returns all information related to the specified fighter token ID.
420      /// @param tokenId The unique identifier for the fighter token.
421      function getAllFighterInfo(
422          uint256 tokenId
423      )
424          public
425          view
426          returns (
427              address,
428              uint256[6] memory,
429              uint256,
430              uint256,
431              string memory,
432              string memory,
433              uint16
434          )
435:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L297-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L419-L435

```solidity
File: src/StakeAtRisk.sol

/// @audit Missing '@return  '
140      /// @notice Sweeps the lost stake to the treasury contract.
141      /// @dev This function is called internally to transfer the lost stake to the treasury contract.
142:     function _sweepLostStake() private returns(bool) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L140-L142

### [N-59]<a name="n-59"></a> NatSpec: Function declarations should have `@dev` tags

`@dev` is used to explain to developers what the potential integration issues/foot-guns are

*There are 37 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

68:      function addAttributeDivisor(uint8[] memory attributeDivisors) external {

83       function createPhysicalAttributes(
84           uint256 dna, 
85           uint8 generation, 
86           uint8 iconsType, 
87           bool dendroidBool
88       ) 
89           external 
90           view 
91           returns (FighterOps.FighterPhysicalAttributes memory) 
92:      {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L68-L68,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L83-L92

```solidity
File: src/FighterFarm.sol

104      constructor(address ownerAddress, address delegatedAddress, address treasuryAddress_)
105          ERC721("AI Arena Fighter", "FTR")
106:     {

299:     function doesTokenExist(uint256 tokenId) external view returns (bool) {

370:     function reRoll(uint8 tokenId, uint8 fighterType) public {

395:     function contractURI() public pure returns (string memory) {

402:     function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {

421      function getAllFighterInfo(
422          uint256 tokenId
423      )
424          public
425          view
426          returns (
427              address,
428              uint256[6] memory,
429              uint256,
430              uint256,
431              string memory,
432              string memory,
433              uint16
434          )
435:     {

447      function _beforeTokenTransfer(address from, address to, uint256 tokenId)
448          internal
449          override(ERC721, ERC721Enumerable)
450:     {

462      function _createFighterBase(
463          uint256 dna, 
464          uint8 fighterType
465      ) 
466          private 
467          view 
468          returns (uint256, uint256, uint256) 
469:     {

484      function _createNewFighter(
485          address to, 
486          uint256 dna, 
487          string memory modelHash,
488          string memory modelType, 
489          uint8 fighterType,
490          uint8 iconsType,
491          uint256[2] memory customAttributes
492      ) 
493          private 
494:     {  

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L104-L106,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L299-L299,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L370-L370,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L395-L395,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402-L402,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L421-L435,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L447-L450,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L462-L469,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L484-L494

```solidity
File: src/GameItems.sol

95:      constructor(address ownerAddress, address treasuryAddress_) ERC1155("https://ipfs.io/ipfs/") {

147:     function mint(uint256 tokenId, uint256 quantity) external {

249:     function contractURI() public pure returns (string memory) {

256:     function uri(uint256 tokenId) public view override returns (string memory) {

268:     function getAllowanceRemaining(address owner, uint256 tokenId) public view returns (uint256) {

279:     function remainingSupply(uint256 tokenId) public view returns (uint256) {

285:     function uniqueTokensOutstanding() public view returns (uint256) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L95-L95,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L249-L249,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L268-L268,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L279-L279,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L285-L285

```solidity
File: src/MergingPool.sol

71       constructor(
72           address ownerAddress, 
73           address rankedBattleAddress, 
74           address fighterFarmAddress
75:      ) {

172:     function getUnclaimedRewards(address claimer) external view returns(uint256) {

205:     function getFighterPoints(uint256 maxId) public view returns(uint256[] memory) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L71-L75,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L172-L172,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L205-L205

```solidity
File: src/Neuron.sol

68       constructor(address ownerAddress, address treasuryAddress_, address contributorAddress)
69           ERC20("Neuron", "NRN")
70:      {

138:     function claim(uint256 amount) external {

163:     function burn(uint256 amount) public virtual {

196:     function burnFrom(address account, uint256 amount) public virtual {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L68-L70,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L138-L138,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L163-L163,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L196-L196

```solidity
File: src/RankedBattle.sol

146      constructor(
147        address ownerAddress, 
148        address gameServerAddress,
149        address fighterFarmAddress,
150        address voltageManagerAddress
151:     ) {

244:     function stakeNRN(uint256 amount, uint256 tokenId) external {

270:     function unstakeNRN(uint256 amount, uint256 tokenId) external {

354:     function getBattleRecord(uint256 tokenId) external view returns(uint32, uint32, uint32) {

364:     function getCurrentStakingData() external view returns(uint256, uint256, uint256) {

379:     function getNrnDistribution(uint256 roundId_) public view returns(uint256) {

386:     function getUnclaimedNRN(address claimer) public view returns(uint256) {

505:     function _updateRecord(uint256 tokenId, uint8 battleResult) private {

519      function _getStakingFactor(
520          uint256 tokenId, 
521          uint256 stakeAtRisk
522      ) 
523          private 
524          view 
525          returns (uint256) 
526:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L146-L151,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L244-L244,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L270-L270,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L354-L354,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L364-L364,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L379-L379,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L386-L386,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L505-L505,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L519-L526

```solidity
File: src/StakeAtRisk.sol

60       constructor(
61           address treasuryAddress_,
62           address nrnAddress,
63           address rankedBattleAddress
64:      ) {

132:     function getStakeAtRisk(uint256 fighterId) external view returns(uint256) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L60-L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L132-L132

```solidity
File: src/VoltageManager.sol

51:      constructor(address ownerAddress, address gameItemsContractAddress) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L51-L51

### [N-60]<a name="n-60"></a> NatSpec: Non-public state variable declarations should use `@dev` tags

i.e. `@dev` [tags](https://docs.soliditylang.org/en/latest/natspec-format.html#tags). Note that since they're non-public, `@notice` is not the right tag to use.

*There are 23 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

23:      address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L23-L23

```solidity
File: src/FighterFarm.sol

51:      address _ownerAddress;

54:      address _delegatedAddress;

57:      address _mergingPoolAddress;

94:      mapping(uint256 => string) private _tokenURIs;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L51-L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L54-L54,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L57-L57,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L94-L94

```solidity
File: src/GameItems.sol

61:      address _ownerAddress;

64:      uint256 _itemCount = 0;    

86:      mapping(uint256 => string) private _tokenURIs;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L61-L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L64-L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L86-L86

```solidity
File: src/MergingPool.sol

35:      address _ownerAddress;

38:      address _rankedBattleAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L35-L35,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L38-L38

```solidity
File: src/Neuron.sol

49:      address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L49-L49

```solidity
File: src/RankedBattle.sol

69:      address _stakeAtRiskAddress;

72:      address _ownerAddress;

75:      address _gameServerAddress;

82:      Neuron _neuronInstance;

85:      FighterFarm _fighterFarmInstance;

88:      VoltageManager _voltageManagerInstance;

91:      MergingPool _mergingPoolInstance;

94:      StakeAtRisk _stakeAtRiskInstance;

134:     mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L69-L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L72-L72,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L75-L75,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L82-L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L85-L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L88-L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L91-L91,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L94-L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L134-L134

```solidity
File: src/StakeAtRisk.sol

33:      address _rankedBattleAddress;

36:      Neuron _neuronInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L33-L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L36-L36

```solidity
File: src/VoltageManager.sol

23:      address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L23-L23

### [N-61]<a name="n-61"></a> Non-library/interface files should use fixed compiler versions, not floating ones

Note that some file names may indicate an interface, but actually contain abstract contracts

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

3:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L3-L3

```solidity
File: src/FighterFarm.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L2-L2

```solidity
File: src/GameItems.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L2-L2

```solidity
File: src/MergingPool.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L2-L2

```solidity
File: src/Neuron.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L2-L2

```solidity
File: src/RankedBattle.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L2-L2

```solidity
File: src/StakeAtRisk.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L2-L2

```solidity
File: src/VoltageManager.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L2-L2

### [N-62]<a name="n-62"></a> Outdated package versions

Packages should be updated to the latest major version (if not the very latest version) to ensure the uptake of any important fixes.

*There are 4 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

9:   import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L9-L9

```solidity
File: src/GameItems.sol

5:   import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L5-L5

```solidity
File: src/Neuron.sol

4:   import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

5:   import "@openzeppelin/contracts/access/AccessControl.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L4-L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L5-L5

### [N-63]<a name="n-63"></a> Setters should prevent re-setting of the same value

This especially problematic when the setter also emits the same value, which may be confusing to offline parsers

*There are 15 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit _mergingPoolAddress:  setMergingPoolAddress()
171      function setMergingPoolAddress(address mergingPoolAddress) external {
172          require(msg.sender == _ownerAddress);
173          _mergingPoolAddress = mergingPoolAddress;
174:     }

/// @audit _tokenURIs:  setTokenURI()
180      function setTokenURI(uint256 tokenId, string calldata newTokenURI) external {
181          require(msg.sender == _delegatedAddress);
182          _tokenURIs[tokenId] = newTokenURI;
183:     }

/// @audit fighterStaked:  updateFighterStaking()
268      function updateFighterStaking(uint256 tokenId, bool stakingStatus) external {
269          require(hasStakerRole[msg.sender]);
270          fighterStaked[tokenId] = stakingStatus;
271          if (stakingStatus) {
272              emit Locked(tokenId);
273          } else {
274              emit Unlocked(tokenId);
275          }
276:     }

/// @audit fighters:  updateModel()
283      function updateModel(
284          uint256 tokenId, 
285          string calldata modelHash,
286          string calldata modelType
287      ) 
288          external
289      {
290          require(msg.sender == ownerOf(tokenId));
291          fighters[tokenId].modelHash = modelHash;
292          fighters[tokenId].modelType = modelType;
293          numTrained[tokenId] += 1;
294          totalNumTrained += 1;
295:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L171-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L180-L183,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L268-L276,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L283-L295

```solidity
File: src/GameItems.sol

/// @audit _tokenURIs:  setTokenURI()
194      function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
195          require(isAdmin[msg.sender]);
196          _tokenURIs[tokenId] = _tokenURI;
197:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L194-L197

```solidity
File: src/MergingPool.sol

/// @audit winnersPerPeriod:  updateWinnersPerPeriod()
106      function updateWinnersPerPeriod(uint256 newWinnersPerPeriodAmount) external {
107          require(isAdmin[msg.sender]);
108          winnersPerPeriod = newWinnersPerPeriodAmount;
109:     }    

/// @audit totalPoints:  addPoints()
/// @audit fighterPoints:  addPoints()
195      function addPoints(uint256 tokenId, uint256 points) public {
196          require(msg.sender == _rankedBattleAddress, "Not Ranked Battle contract address");
197          fighterPoints[tokenId] += points;
198          totalPoints += points;
199          emit PointsAdded(tokenId, points);
200:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L106-L109,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L200,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L195-L200

```solidity
File: src/RankedBattle.sol

/// @audit _gameServerAddress:  setGameServerAddress()
184      function setGameServerAddress(address gameServerAddress) external {
185          require(msg.sender == _ownerAddress);
186          _gameServerAddress = gameServerAddress;
187:     }

/// @audit _stakeAtRiskAddress:  setStakeAtRiskAddress()
192      function setStakeAtRiskAddress(address stakeAtRiskAddress) external {
193          require(msg.sender == _ownerAddress);
194          _stakeAtRiskAddress = stakeAtRiskAddress;
195          _stakeAtRiskInstance = StakeAtRisk(_stakeAtRiskAddress);
196:     }

/// @audit bpsLostPerLoss:  setBpsLostPerLoss()
226      function setBpsLostPerLoss(uint256 bpsLostPerLoss_) external {
227          require(isAdmin[msg.sender]);
228          bpsLostPerLoss = bpsLostPerLoss_;
229:     }

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L184-L187,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L192-L196,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L226-L229

```solidity
File: src/StakeAtRisk.sol

/// @audit roundId:  setNewRound()
78       function setNewRound(uint256 roundId_) external {
79           require(msg.sender == _rankedBattleAddress, "Not authorized to set new round");
80           bool success = _sweepLostStake();
81           if (success) {
82               roundId = roundId_;
83           }
84:      }

/// @audit amountLost:  updateAtRiskRecords()
/// @audit totalStakeAtRisk:  updateAtRiskRecords()
/// @audit stakeAtRisk:  updateAtRiskRecords()
115      function updateAtRiskRecords(
116          uint256 nrnToPlaceAtRisk, 
117          uint256 fighterId, 
118          address fighterOwner
119      ) 
120          external 
121      {
122          require(msg.sender == _rankedBattleAddress, "Call must be from RankedBattle contract");
123          stakeAtRisk[roundId][fighterId] += nrnToPlaceAtRisk;
124          totalStakeAtRisk[roundId] += nrnToPlaceAtRisk;
125          amountLost[fighterOwner] += nrnToPlaceAtRisk;
126          emit IncreasedStakeAtRisk(fighterId, nrnToPlaceAtRisk);
127:     }   

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L78-L84,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L115-L127

### [N-64]<a name="n-64"></a> Style guide: Contract does not follow the Solidity style guide's suggested layout ordering

The [style guide](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#order-of-layout) says that, within a contract, the ordering should be 1) Type declarations, 2) State variables, 3) Events, 4) Modifiers, and 5) Functions, but the contract(s) below do not follow this ordering

*There are 7 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit event Unlocked came earlier
33:       uint8 public constant MAX_FIGHTERS_ALLOWED = 10;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L33

```solidity
File: src/GameItems.sol

/// @audit event Unlocked came earlier
49:       string public name = "AI Arena Game Items";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L49

```solidity
File: src/MergingPool.sol

/// @audit event Claimed came earlier
26:       uint256 public winnersPerPeriod = 2;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L26

```solidity
File: src/Neuron.sol

/// @audit event TokensMinted came earlier
28:       bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L28

```solidity
File: src/RankedBattle.sol

/// @audit event PointsChanged came earlier
53:       uint8 public constant VOLTAGE_COST = 10;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L53

```solidity
File: src/StakeAtRisk.sol

/// @audit event IncreasedStakeAtRisk came earlier
27:       uint256 public roundId = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L27

```solidity
File: src/VoltageManager.sol

/// @audit event VoltageRemaining came earlier
23:       address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L23

### [N-65]<a name="n-65"></a> Style guide: Control structures do not follow the Solidity Style Guide

See the [control structures](https://docs.soliditylang.org/en/latest/style-guide.html#control-structures) section of the Solidity Style Guide

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

501           }
502:          else {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L501-L502

### [N-66]<a name="n-66"></a> Style guide: Extraneous whitespace

See the [whitespace](https://docs.soliditylang.org/en/v0.8.16/style-guide.html#whitespace-in-expressions) section of the Solidity Style Guide

*There are 17 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

5:    import { FighterOps } from "./FighterOps.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L5

```solidity
File: src/FighterFarm.sol

4:    import { FighterOps } from "./FighterOps.sol";

5:    import { Verification } from "./Verification.sol";

6:    import { AAMintPass } from "./AAMintPass.sol";

7:    import { AiArenaHelper } from "./AiArenaHelper.sol";

8:    import { Neuron } from "./Neuron.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L5,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L6,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L7,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L8

```solidity
File: src/GameItems.sol

4:    import { Neuron } from "./Neuron.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L4

```solidity
File: src/MergingPool.sol

4:    import { FighterFarm } from "./FighterFarm.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L4

```solidity
File: src/RankedBattle.sol

4:    import { FighterFarm } from "./FighterFarm.sol";

5:    import { VoltageManager } from "./VoltageManager.sol";

6:    import { MergingPool } from "./MergingPool.sol";

7:    import { Neuron } from "./Neuron.sol";

8:    import { StakeAtRisk } from "./StakeAtRisk.sol";

9:    import { FixedPointMathLib } from './FixedPointMathLib.sol';

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L5,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L6,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L7,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L8,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L9

```solidity
File: src/StakeAtRisk.sol

4:    import { Neuron } from "./Neuron.sol";

5:    import { RankedBattle } from "./RankedBattle.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L4,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L5

```solidity
File: src/VoltageManager.sol

4:    import { GameItems } from "./GameItems.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L4

### [N-67]<a name="n-67"></a> Typos



*There are 1 instance(s) of this issue:*

```solidity
File: src/GameItems.sol

/// @audit recieves
57:       /// @notice The address that recieves funds of purchased game items.

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L57

### [N-68]<a name="n-68"></a> Unnecessary cast

The variable is being cast to its own type

*There are 1 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

/// @audit bytes32
199          bytes32 msgHash = bytes32(keccak256(abi.encode(
200              msg.sender, 
201              numToMint[0], 
202              numToMint[1],
203              nftsClaimed[msg.sender][0],
204              nftsClaimed[msg.sender][1]
205:         )));

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L199-L205

### [N-69]<a name="n-69"></a> Unused `event` definition

Note that there may be cases where an event superficially appears to be used, but this is only because there are multiple definitions of the event in different files. In such cases, the event definition should be moved into a separate file. The instances below are the unused definitions.

*There are 1 instance(s) of this issue:*

```solidity
File: src/Neuron.sol

21:      event TokensMinted(address user, uint256 amount);    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L21-L21

### [N-70]<a name="n-70"></a> Unused import

The identifier is imported but never used within the file

*There are 1 instance(s) of this issue:*

```solidity
File: src/StakeAtRisk.sol

/// @audit RankedBattle
5:   import { RankedBattle } from "./RankedBattle.sol";

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L5-L5

### [N-71]<a name="n-71"></a> Use of `override` is unnecessary

Starting with Solidity version [0.8.8](https://docs.soliditylang.org/en/v0.8.20/contracts.html#function-overriding), using the `override` keyword when the function solely overrides an interface function, and the function doesn't exist in multiple base contracts, is unnecessary.

*There are 7 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

338      function transferFrom(
339          address from, 
340          address to, 
341          uint256 tokenId
342      ) 
343          public 
344          override(ERC721, IERC721)
345:     {

355      function safeTransferFrom(
356          address from, 
357          address to, 
358          uint256 tokenId
359      ) 
360          public 
361          override(ERC721, IERC721)
362:     {

402:     function tokenURI(uint256 tokenId) public view override(ERC721) returns (string memory) {

410      function supportsInterface(bytes4 _interfaceId)
411          public
412          view
413          override(ERC721, ERC721Enumerable)
414          returns (bool)
415:     {

447      function _beforeTokenTransfer(address from, address to, uint256 tokenId)
448          internal
449          override(ERC721, ERC721Enumerable)
450:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L338-L345,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L355-L362,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L402-L402,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L410-L415,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L447-L450

```solidity
File: src/GameItems.sol

256:     function uri(uint256 tokenId) public view override returns (string memory) {

291      function safeTransferFrom(
292          address from, 
293          address to, 
294          uint256 tokenId,
295          uint256 amount,
296          bytes memory data
297      ) 
298          public 
299          override(ERC1155)
300:     {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L256-L256,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L291-L300

### [N-72]<a name="n-72"></a> Use scientific notation (e.g. `1e18`) rather than exponentiation (e.g. `10**18`)

While the compiler knows to optimize away the exponentiation, it's still better coding practice to use idioms that do not require compiler optimization, if they exist

*There are 11 instance(s) of this issue:*

```solidity
File: src/FighterFarm.sol

39:       uint256 public rerollCost = 1000 * 10**18;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L39

```solidity
File: src/Neuron.sol

37:       uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

37:       uint256 public constant INITIAL_TREASURY_MINT = 10**18 * 10**8 * 2;

40:       uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

40:       uint256 public constant INITIAL_CONTRIBUTOR_MINT = 10**18 * 10**8 * 5;

43:       uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

43:       uint256 public constant MAX_SUPPLY = 10**18 * 10**9;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L37,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L37,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L40,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L40,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L43,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L43

```solidity
File: src/RankedBattle.sol

157:          rankedNrnDistribution[0] = 5000 * 10**18;

220:          rankedNrnDistribution[roundId] = newDistribution * 10**18;

439:          curStakeAtRisk = (bpsLostPerLoss * (amountStaked[tokenId] + stakeAtRisk)) / 10**4;

528:            (amountStaked[tokenId] + stakeAtRisk) / 10**18

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L157,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L220,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L439,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L528

### [N-73]<a name="n-73"></a> Use the latest solidity (prior to 0.8.20 if on L2s) for deployment

```
When deploying contracts, you should use the latest released version of Solidity. Apart from exceptional cases, only the latest version receives security fixes.
```
https://docs.soliditylang.org/en/v0.8.20/

Since deployed contracts should not use floating pragmas, I've flagged all instances where a version prior to 0.8.19 is allowed by the version pragma

*There are 8 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

3:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L3-L3

```solidity
File: src/FighterFarm.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L2-L2

```solidity
File: src/GameItems.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L2-L2

```solidity
File: src/MergingPool.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L2-L2

```solidity
File: src/Neuron.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L2-L2

```solidity
File: src/RankedBattle.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L2-L2

```solidity
File: src/StakeAtRisk.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L2-L2

```solidity
File: src/VoltageManager.sol

2:   pragma solidity >=0.8.0 <0.9.0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L2-L2

### [N-74]<a name="n-74"></a> Variables need not be initialized to zero

The default value for variables is zero, so initializing them to zero is superfluous.

*There are 26 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

48:          for (uint8 i = 0; i < attributesLength; i++) {

73:          for (uint8 i = 0; i < attributesLength; i++) {

99:              for (uint8 i = 0; i < attributesLength; i++) {

136:         for (uint8 i = 0; i < attributesLength; i++) {

148:         for (uint8 i = 0; i < attributesLength; i++) {

176:         uint256 cumProb = 0;

178:         for (uint8 i = 0; i < attrProbabilitiesLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L48-L48,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L73-L73,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L99-L99,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L136-L136,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L148-L148,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L176-L176,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L178-L178

```solidity
File: src/FighterFarm.sol

211:         for (uint16 i = 0; i < totalToMint; i++) {

249:         for (uint16 i = 0; i < mintpassIdsToBurn.length; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L211-L211,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L249-L249

```solidity
File: src/GameItems.sol

64:      uint256 _itemCount = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L64-L64

```solidity
File: src/MergingPool.sol

29:      uint256 public roundId = 0;

32:      uint256 public totalPoints = 0;    

124:         for (uint256 i = 0; i < winnersLength; i++) {

147:         uint32 claimIndex = 0;

152:             for (uint32 j = 0; j < winnersLength; j++) {

174:         uint256 numRewards = 0;

178:             for (uint32 j = 0; j < winnersLength; j++) {

207:         for (uint256 i = 0; i < maxId; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L29-L29,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L32-L32,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L124-L124,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L147-L147,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L152-L152,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L174-L174,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L178-L178,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L207-L207

```solidity
File: src/Neuron.sol

131:         for (uint32 i = 0; i < recipientsLength; i++) {

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L131-L131

```solidity
File: src/RankedBattle.sol

56:      uint256 public totalBattles = 0;

59:      uint256 public globalStakedAmount = 0;

62:      uint256 public roundId = 0;

296:         uint256 claimableNRN = 0;

387:         uint256 claimableNRN = 0;

427:         uint256 points = 0;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L56-L56,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L59-L59,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L62-L62,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L296-L296,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L387-L387,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L427-L427

```solidity
File: src/StakeAtRisk.sol

27:      uint256 public roundId = 0;    

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L27-L27

### [N-75]<a name="n-75"></a> Visibility should be set explicitly rather than defaulting to `internal`



*There are 27 instance(s) of this issue:*

```solidity
File: src/AiArenaHelper.sol

23:       address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/AiArenaHelper.sol#L23

```solidity
File: src/FighterFarm.sol

51:       address _ownerAddress;

54:       address _delegatedAddress;

57:       address _mergingPoolAddress;

60:       AiArenaHelper _aiArenaHelperInstance;

63:       AAMintPass _mintpassInstance;

66:       Neuron _neuronInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L51,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L54,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L57,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L60,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L63,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/FighterFarm.sol#L66

```solidity
File: src/GameItems.sol

61:       address _ownerAddress;

64:       uint256 _itemCount = 0;    

67:       Neuron _neuronInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L61,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L64,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/GameItems.sol#L67

```solidity
File: src/MergingPool.sol

35:       address _ownerAddress;

38:       address _rankedBattleAddress;

41:       FighterFarm _fighterFarmInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L35,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L38,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/MergingPool.sol#L41

```solidity
File: src/Neuron.sol

49:       address _ownerAddress;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/Neuron.sol#L49

```solidity
File: src/RankedBattle.sol

69:       address _stakeAtRiskAddress;

72:       address _ownerAddress;

75:       address _gameServerAddress;

82:       Neuron _neuronInstance;

85:       FighterFarm _fighterFarmInstance;

88:       VoltageManager _voltageManagerInstance;

91:       MergingPool _mergingPoolInstance;

94:       StakeAtRisk _stakeAtRiskInstance;

134:      mapping(uint256 => mapping(uint256 => bool)) _calculatedStakingFactor;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L69,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L72,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L75,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L82,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L85,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L88,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L91,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L94,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/RankedBattle.sol#L134

```solidity
File: src/StakeAtRisk.sol

33:       address _rankedBattleAddress;

36:       Neuron _neuronInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L33,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/StakeAtRisk.sol#L36

```solidity
File: src/VoltageManager.sol

23:       address _ownerAddress;

26:       GameItems _gameItemsContractInstance;

```


*GitHub* : https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L23,https://github.com/code-423n4/2024-02-ai-arena/blob/5b2ab9f9fadd0b91268ff6f22b4ae0fd5b79ec09/src/VoltageManager.sol#L26

## Rubric
See [this](https://illilli000.github.io/races/2023-07-lens/scorer.html) link for how to use this rubric:
```json
{"salt":"0f9759","hashes":["3cfba44e68","6dfa4c5fea","bbb1aa4e37","b222fb70d6","bb1ef689ae","9677b6cc78","93ae1ed970","06fa661ffc","c481104a56","699613e401","dd9ca870aa","d5c7f7007b","d859ad9b60","7b39b56348","29bbcaca7c","3852d4313a","381e633b2d","399ed87a0d","9ec2e023ef","2436f21a38","9480d467df","2aa35c941c","fe086018ef","78cf569564","19156dda31","0372303c27","9791e4926f","f89c44d3a7","953a12e7d6","97c3cbedb8","6103dcea84","5eb53351c7","d413d41daf","0e4f01afc8","8095eefbc3","c19e27bd26","32ed206200","897981a6df","7a48f18bca","7cf5f99e8d","f7f3dc19fd","abe08f039e","20a19d1bab","45b9d363f3","b7ac3a578b","f333260d1c","6332cb0917","ff96f04ef6","70a002c9e9","fcb00f9183","777ce51f7d","9bc942514a","27cdefc7e6","5a9ac8024c","6ea3a8908a","1599f05698","b754dbe034","a3bc06d692","0f7157876c","463c1ce009","55f1bf9d16","fa81994e75","de2cdf66da","b754dbe034","a3bc06d692","0f7157876c","463c1ce009","55f1bf9d16","fa81994e75","de2cdf66da","8b339754ed","231ba1a507","ea201dc8bf","0309f83565","cc871891c9","ee9b1705b1","0fc967953f","189e7f8fe7","326c7e0d10","cbf17d67bd","6561b805c9","b00be25fba","22d5a8a647","6ba8b672bf","e2b8ca60c8","88cfc7412a","f2fd0c3e53","c6a1938117","52228fe6ee","85b2eb9c6e","c4367092ea","638d685485","344ffbe544","5470d28008","fcaa29a0f6","59288b4299","602433740a","42dac1acb0","e2b8ca60c8","88cfc7412a","f2fd0c3e53","c6a1938117","52228fe6ee","85b2eb9c6e","c4367092ea","e2b8ca60c8","88cfc7412a","f2fd0c3e53","c6a1938117","52228fe6ee","85b2eb9c6e","c4367092ea","5bc4edc785","798e39ea93","f713f547ca","c9ad8accfc","306af087a8","5c60232136","5b43f978db","241f33e94f","2a1f98404d","4297d5b3a2","ffeb87a711","69acc0897c","bb60d9a5ef","62c5dc7b51","c8c92f2cbb","6e57896bfd","1d71148f4d","46d7199ad3","1b77aa976b","963f461a37","830792acc3","91d986f86b","c0592b906d","e0d6e2ba7e","2370a349d7","d36aa92877","dc982b2462","1b58734d56","c8c92f2cbb","6e57896bfd","1d71148f4d","46d7199ad3","1b77aa976b","963f461a37","830792acc3","883db32442","4a7a6b8925","deb7df9b93","6b51c4c1d8","c5ebc67bf4","da84ee6560","4b79a06266","6519faa4ea","fb44980320","59b8b9a3fc","9a453133e4","0428bb0080","753c1c9be0","ef5eadb465","1ac74fa541","8f8f2ba23e","3209e3369d","fa8ba72597","9d1fc97600","720edb48ac","54a5be01a7","a5dc77ac23","0bbd9cf938","f7e15d889f","4a4218ad6f","d7c4f842a4","4500497420","02d025fb8d","7cf6494f6c","0d7aadfa7a","7c6dfd9479","b7a978fe50","cb2d9e36d1","1e9158d80a","30eb6e6064","a6486938b1","1cab5f2f36","e1d48e483e","e776596ba9","e22bfc4f74","7d70889ff8","11d28b692e","00310d3bb9","d30ee86ff3","c3a22b54c8","d72db54851","0a33e3649a","daac4fe8d3","212bdbe60a","c728755316","12816f4fe9","123df4b5ed","9e62f97de5","2972763d80","4e73e4a123","69edf29e1a","883db32442","4a7a6b8925","deb7df9b93","6b51c4c1d8","c5ebc67bf4","da84ee6560","4b79a06266","a50b0ba028","e893af7fd8","c34aaa4e87","8077a17c4a","c3d6d6bacc","ba9a9a56d1","73d5d822b3","24588932eb","be46fc8734","87781b9730","217d712bd0","c8712d219a","60e3cb3f48","4aebba9a2d","a6a4775baf","6b4f3ac972","c6092d3dcf","c3ee1d030f","8d06366a0a","945df5bccf","a0eaa20c53","8bb334a08e","62703b773f","b8745dfeab","94bfbae2a7","7706d22285","8bf3124f7e","cb67d40204","eb796411a0","d420df3eb9","a26fe42bb2","ccdebec142","4545a82e85","49b1698e0c","2bd78a2b7f","2f58d964b5","b90f68f765","de8ac6d0a3","079bca31d1","83dc17814e","ad3c99f195","4267e75423","15ca0de851","51ed5166e3","7fba4f9572","42ae58c134","f266e70282","81b55cac80","0767b90168","24588932eb","be46fc8734","87781b9730","217d712bd0","c8712d219a","60e3cb3f48","4aebba9a2d","db70484f69","edd00c4886","e0195d9fd1","babcfd71de","f5c10eb360","ab2374ee7a","a5b768ac28","09adc44184","665bb5b1dd","320372cf4f","21b9e0787c","387bb2281e","2595d6585a","760e84ea62","4027885a88","c359e4ae45","7e77fd0917","340dbe34aa","ce7846420c","006264c16d","75ec3cf365","ae32700401","d20334f9d6","ca66d0397a","b8fa1fbd27","5a74abbaa9","ca95ebecf8","7bd0950a32","e0a9d87d94","a78e835505","83e81bc37d","d77c01f387","ea1af33102","81f8170df9","e6a5501675","e8ab809f62","c0935fe608","b91db05c31","37b4d639a4","386d8760e8","efd128f9fd","3b01ae9b77","31233bfd72","7bedc8e37a","4289630e1b","650221e324","d1017259bb","fc640e6ee9","774c599d79","e4bf305339","2240c9d2a5","e1bab04eed","82bf545be8","d6add9db2e","ad93df89a4","cb79adf8ab","5ed1e04d03","5f0b935668","cfd7e69b64","f4bd6b435f","33ce70813b","5ec7ab590f","aa508217d0","83372a7f30","d38cdd41aa","875a7a06cd","e8fddd5540","efce881866","b50033730a","f7638e0502","d7b3f39ee4","6171bacd2d","ecb0bf4491","7ea0b47c76","53a31125b4","2cbb943590","93f53ff20a","35ab521305","aba7e8304a","64f08899d1","2818ad3264","83b336140c","6b12a9d9a5","bfe3196c19","0858ac9950","4136911f7b","80962ae380","ebc88696f8","18602574a6","3de0b90d04","1441186b0c","4027885a88","c359e4ae45","7e77fd0917","340dbe34aa","ce7846420c","006264c16d","75ec3cf365","4027885a88","c359e4ae45","7e77fd0917","340dbe34aa","ce7846420c","006264c16d","75ec3cf365","9f32eddcfb","fe2e22e65b","39f6d2df28","7734f64a56","739f4d805b","f9dc42f80e","804c82fd15","5e9a24a71a","ab05574c49","91b0c2802c","e2d63c7095","7134549108","0ac16810fd","dcca4bff5c","e55eaac559","0f6d958f91","95a12670e1","1c9874a941","3b604c997f","c2c6d147a2","ad059c53a5","5fbbd453fe","0db18bd8bf","06721549e5","fc0fa13e81","1535e11a28","02f77c77b6","75d7700012","ac255bcf3f","8b7add15ef","6a9546d02b","c65aca0d8b","fd023032e1","ffaae932a0","3d5e1c4e13","ac255bcf3f","8b7add15ef","6a9546d02b","c65aca0d8b","fd023032e1","ffaae932a0","3d5e1c4e13","6ab12e68a8","9f9a2dcf64","23eb36c82a","a5b9b89be4","214c8780bb","29356f5a68","b0148c1b7a","0e6d8b3189","974711aecf","ed3685c9cf","6ff5dda235","a2ffddf95e","951195fe8a","5933c3b1e0","d1c1a255f6","049904fed2","2b543b729f","a92b29d316","5d04364b42","4e6546e559","04f3ff7cb4","2a61836c62","67115bacc4","4b4d5d8414","b8128b3070","2226b8429b","6589ee82fb","26dd8e690d","0e8daa379b","57060cdf35","7dc0469c02","0a2c0c9a93","b7f23d02cc","5062235667","f4b6c9ba42","1a3e7963f6","f7886b8512","13e76fc0ba","4150bd1517","0a164cffc9","8776b61971","c8a46aa3fe","28b2132e01","391fec3779","a8b6591d73","726a99e082","01cab95993","dfeef7927f","4fd72a7015","0270696bc4","90a9aeb5dc","dda9e8158d","bf50cd8aab","f63bcd697a","c9d1c76aa8","587750909c","d1c1a255f6","049904fed2","2b543b729f","a92b29d316","5d04364b42","4e6546e559","04f3ff7cb4","0e6d8b3189","974711aecf","ed3685c9cf","6ff5dda235","a2ffddf95e","951195fe8a","5933c3b1e0","f9404604d2","6c6b3e2122","5a3de3b6b8","4196b07138","bf649bc792","6bdde9d3d7","9de51019cf","f96f3925bc","25c64bad00","fa0ee45ac4","1fc980b425","3bd9c3c8f5","a4de501bc3","6a526ecff6","3a8f5dda40","a5ae5a50fa","5d55cd74d2","77f02cbe51","0dca2a456f","c4709163f4","198cf739f2","0e8daa379b","57060cdf35","7dc0469c02","0a2c0c9a93","b7f23d02cc","5062235667","f4b6c9ba42","0e8daa379b","57060cdf35","7dc0469c02","0a2c0c9a93","b7f23d02cc","5062235667","f4b6c9ba42","084d0bc981","38df50db5d","15e11b08af","e98b472db9","72f05952c8","b115210283","61069447ef","28b4e87ddb","98777fc8bf","6af0ddb202","b1a4a59f6f","326e35708f","67108d1a53","fb28cc0e0d","4e954316a3","ac44b71c50","50fd526b0e","cfa908c003","c4769e80e6","95edd51cc4","44f5d60266","da4a919fb9","b0ab52e1b6","fb876be275","43e53ee082","fccab587a3","905ada751a","42e4f9d6a6","0557416465","3e5cbab5f1","976c5eea95","f4d68fa311","523cbda8f8","9a1463e55b","bd4d47eeaa","7b01bd7a53","2f7a3232e2","c252134d88","850e620018","f360d4efc8","cda7885c68","3f64975d16","43466d4fe3","667e25b12c","14dabcfb32","6272bab047","602ece1910","252982f79d","20496f4795","43466d4fe3","667e25b12c","14dabcfb32","6272bab047","602ece1910","252982f79d","20496f4795","11c788f0f8","d82e973ace","c51d8cb4f6","5bf718c0e5","4d4d691023","9f63620831","2a4d1611b6","b4bf01ae03","fe27b1bd2a","5c9d316f6b","4c08ece9f5","b35fce7ab8","78becfa1ea","c4e31a9183","2ec8b9d6e0","1098a211c3","d20500d57e","fb9c3cb60b","05fe14491f","e6cb17afd3","4a006b2ca6","51d1bd0ca3","ade722d2f3","1d432d0f60","a01db7d11b","07184332a9","349d1333e1","490b052765","a38c7d2455","0d89102bb9","149b28236e","1325f9a41f","e039686394","9be0a30129","0fd2ff2547","9b51567235","ea45384ceb","6a6ef803d1","48589f0c31","c5558c568d","21dab1a0a9","542f8ab94f","60a336b222","c61f448274","eb0807c96d","32091020dc","c0d84937ee","f25ea15008","cee3229c81","11c788f0f8","d82e973ace","c51d8cb4f6","5bf718c0e5","4d4d691023","9f63620831","2a4d1611b6","11c788f0f8","d82e973ace","c51d8cb4f6","5bf718c0e5","4d4d691023","9f63620831","2a4d1611b6","3a6abfad25","f3d171269a","627a3011a1","97f74e6714","c57187e45c","624d6b8b1f","b7352eca89","e644c1611f","bd57e7743b","ca536c2526","fb55b4d6bf","8c94517a18","2944b29482","c4f7967bba","11a22df536","25ffe467c1","0ed38a7afb","a721b52bff","130c8e7996","54ae32fc0e","9b2598737f","2e3a4b989c","da833a62d7","9147180a3f","b8678ce4fa","326af6dc4f","7382ffeec6","533b2eb6aa","85267d394d","264bc0f0a4","07e618e4a6","99833e8f3f","95c927a416","2c3ba7c5c2","2097ceb003","85267d394d","264bc0f0a4","07e618e4a6","99833e8f3f","95c927a416","2c3ba7c5c2","2097ceb003","52e784bb68","87544cfa27","ad9076afc6","2efb80900b","6eb91d411e","c45bcbd845","25e8d2bb52","58636a87f0","6fe2d8a07e","10b6c95e84","46a91ed435","7b9f790eda","7d73140dde","ff409a0e75","bb5b8e80be","98cda2dfa3","a8a29a23ff","2bb6875765","8578be727f","8168b3819b","166af4cf3c","ad284d73b4","0e6495b132","6c5b537c6c","692fc396e4","2d2c97afdc","efebad47d0","5736d7c8ec","6c511e6bb0","809f7af9e8","1659de131c","3e909c1125","9ef089aaf5","3633530723","8751b1bffe","b65910590f","d0c2dfa2df","ff3f270e00","50476ad3dc","55b888bba4","e92a375963","aaf163a0ad","bc260f3835","5c677ee456","f78224cdb3","79ed7115c0","cb8464ee26","e037c4f105","b4a3b0c867","b7033cda1a","64ff07df29","7b78dc403a","fe9976239d","38577323e3","197f560677","fc6419fd24","cd8e4af981","4081c25d2d","bcc2959ff0","d39be75397","8d9eae1e3a","204e662c65","1c0fe793af","5f272a05d1","ca9e2589c0","c132a71759","a6132f1ad1","f0dd06ebd1","7be5de20da","078b55792f","91317bc627","930e6655e9","c9c20a2496","0b77db2380","ee93e9101e","94c7340a4e","754f61f417","b65910590f","d0c2dfa2df","ff3f270e00","50476ad3dc","55b888bba4","e92a375963","aaf163a0ad","b65910590f","d0c2dfa2df","ff3f270e00","50476ad3dc","55b888bba4","e92a375963","aaf163a0ad","d0d6beb171","9065fde98e","289d42dc72","508809af21","2c1e82a088","192f7298ed","1a7f62a90a","093abe2a4c","83f53664bb","8cf45d86cd","2f8644529e","c91678e3bc","3db0963e0a","b6a0768f57","7d9a6fe4d6","2e6ec8cd35","9137f63394","c56bd3eb01","9e06c08b6c","053381014d","8799ff43d8","c8dc37d1de","a78ed826dc","d07d76c2f3","65cca83571","559df1895f","93f52b5bfc","602084f62d","555cc10dc5","37ce507a39","90df9df706","92c9b39565","89a265d31b","f311471172","c336049799","a99743c356","34bd3949a2","af912838d4","7a0bb2a681","517b95bf8e","7f711c3a9e","4f618d2879","c8dc37d1de","a78ed826dc","d07d76c2f3","65cca83571","559df1895f","93f52b5bfc","602084f62d","c8dc37d1de","a78ed826dc","d07d76c2f3","65cca83571","559df1895f","93f52b5bfc","602084f62d","dd8ca6941e","d45b7862b2","355bd7a121","732d7f0ad0","ad5224f48c","c2b2886f36","c418a3cd38","a59e1ec554","c531d0156b","5958240106","0a18ec6346","0cb2f84502","e8b17c840a","863a79d7ec","07a6048a2f","b9c7406637","7591b9dd9c","2da23e8a52","6ef3c5dd8e","123888865e","8337c9f1d3","01bfafa0df","da7bb18040","a39b28c76b","a49691534c","6b34aaef3f","d79452f599","50e2519353","07a6048a2f","b9c7406637","7591b9dd9c","2da23e8a52","6ef3c5dd8e","123888865e","8337c9f1d3","a59e1ec554","c531d0156b","5958240106","0a18ec6346","0cb2f84502","e8b17c840a","863a79d7ec","0d2d3a7a0f","e548dad03e","5eada0ad9a","93a5518cf5","450bbe71f0","31863c6cda","614527fc14","634495f109","f7c65331d2","e66a9993cc","197b520d3d","668ba15418","bef6633c39","c58b02cbca","a59e1ec554","c531d0156b","5958240106","0a18ec6346","0cb2f84502","e8b17c840a","863a79d7ec","a59e1ec554","c531d0156b","5958240106","0a18ec6346","0cb2f84502","e8b17c840a","863a79d7ec","0c026a9c7d","133d3d05dc","c1b3e2ea60","43959358af","11db9cbab3","8408695a5c","bf2644ae95","ffb929f896","7816560abe","ccb799ab12","eea6d4415f","e217951bc9","00b8e79af5","9f5a9e4b65","0b72fad4f6","fda04d6728","ecd7d33074","4f5d5bfca1","aedb1bbce0","d9ba024ea9","1eafcc819e","43daecfe76","5a80862c2d","646c62f883","79b7e614d4","f9167fc5d8","c077196e89","8ac1772519","37ea309d4d","9bc481809e","4d0a8786b1","6f34c963a6","9b5e027e55","1d4cd78a7e","d89f1cffca","37ea309d4d","9bc481809e","4d0a8786b1","6f34c963a6","9b5e027e55","1d4cd78a7e","d89f1cffca","338c46627f","1312e09a11","94103e93d9","8b7c4bdeaf","078755b448","6a7ab6feaf","018e130349","27e3cc8b69","2d240e6f8f","4accb12a73","9bebd6aaee","766ea17976","75f90b78e5","1b7486e6fc","22104b9243","ac5b121d7c","f5a09fe353","1a5b6f478a","0674ad9c0e","5a0c33a464","ec61118d3b","0902f71b96","0bb87d711f","cc847d8f51","62e68731df","8c0779ee4e","cf62bb6a60","79ac003f29","d5adc2c72e","ba96370933","b26dffef5a","8aa1abd21b","1f3ca661fa","42dcbbfdd3","74a7b30047","d5adc2c72e","ba96370933","b26dffef5a","8aa1abd21b","1f3ca661fa","42dcbbfdd3","74a7b30047","f8c1b1327d","cdda8cf331","326263c67e","fec93d99a2","7f8ab5cbf7","f266dd2d3a","29fc7c8bdb","4b71a5d176","8c1b08c1ef","398c0d5401","cc84fe5254","b14056cdd7","5624e90276","060622e977","876ae49414","b0f176995d","0ed3859c63","dcaa6a7e86","e990711c38","98cf605341","3045047f4c","e08dbdd162","a97be1ed9c","25a6f5bb23","2f50f38908","8a722ffabc","bb4baaec05","ac04f0bd46","8bd7a9421f","2a69fd17f3","b824337df8","6749ce15b5","a83665fd32","a8ac71705e","38a42735d2","acc7fba58d","b13671a685","ba78fce3bf","e866e57616","05c135c457","5fc8a399d8","9db10a4fd6","002484511f","0e27826a33","06c16890b3","5046bd10f5","12d7bfeacc","11b1f5cbb5","89019eda67","f8c1b1327d","cdda8cf331","326263c67e","fec93d99a2","7f8ab5cbf7","f266dd2d3a","29fc7c8bdb","f8c1b1327d","cdda8cf331","326263c67e","fec93d99a2","7f8ab5cbf7","f266dd2d3a","29fc7c8bdb","7bc36fd8b8","d336351a72","15ace1b6d7","3af9d001f5","1632ec29b2","9f908179d7","88a8f1230d","49bb956503","a8875ce925","5e6b96e9ec","c2cb6f4f96","ddc87ee3fe","a9e6fa1419","695c88d45e","662dbd51b4","16339c2c88","5fcac2f0fe","e89e2bf4dc","5f57e87e03","0e0b12a4b9","3af3fe22e2","1039d57d9c","81bac00e1d","f7278827ad","18ea1e9573","539b7e326a","304a25529f","b80b19936f","de0ca71769","774b516004","e7a3b27aeb","86bdb8b522","04745331ce","860ae3b1d2","c93c928403","7bd0621764","653a564cc0","dad3bc73b0","cc2ddf9329","7a9e127f27","d6ca965e6d","849ee33627","70d517d365","aee3427595","326a9ba136","8b9ea1b6a3","681fcb570c","60e68ecf63","ed7f891236","662dbd51b4","16339c2c88","5fcac2f0fe","e89e2bf4dc","5f57e87e03","0e0b12a4b9","3af3fe22e2","5a5519a36e","254661edf2","efe92f62e2","bed3b6ab18","13ddfa3831","21943241c6","9721415a73","f9345df8e9","11a028c6d9","36fcdd91d5","8841142076","39970cdb46","960f22cf09","e86f457b28","f9345df8e9","11a028c6d9","36fcdd91d5","8841142076","39970cdb46","960f22cf09","e86f457b28","93f65250c3","c29bf84c4f","f62542fe80","c9f4a612a6","1aed759c0b","6441dd0e9a","d7572150a9","54416be04c","714ae1d57e","0274e357e8","b67029c32b","c18aa7fe72","9e62eeb647","83263a47b9","9ff38f1d4a","2dcb8a2820","a245283ca9","f6c60bf480","9a3621e506","27b03e7ac4","6aadbc0e4c","4fabf49ce5","981c765f6d","3dfb5122ff","8471c35b6f","f43b6abbee","a5db3a385b","57fb3a761f","2729aa520d","0e550827eb","76a6064f51","e9c3fb4a34","08dd2fcc81","a66bd29d2f","2bbe20b856","bc3176beac","5865189440","50e03869d5","5f9509cca8","b08b0da6f5","85c036074e","ca46ba02f4","a5653e564e","081b7c385e","3a3d5642aa","ab70688916","4634441369","0143a3fbab","641479aab4","bbb9d01ff3","0bbb24b25f","35ef723c07","ed47c59a7f","25ceb10dae","c2dc8d73f1","33cbf301c3","f80ef64ef9","74aa47d98c","b1c5b52933","0d61b433bf","e507439804","9d4cc562c0","fc263951e4","f80ef64ef9","74aa47d98c","b1c5b52933","0d61b433bf","e507439804","9d4cc562c0","fc263951e4","690437b8a8","0b5327a4ce","e6d9addb82","ea915058f0","a57973cb2b","37039f99b2","83cd9662d9","a771a45b61","d4bf0830cd","8767fbd8cc","9e559e68eb","556b0b0c67","3d6540b18e","14fb4ec40b","2f16b498ba","6c086a15cd","d4cf0fafb3","7c784147c7","c76bc26fb1","13c3533069","a7203a3712","c553a1e365","b7f4c4ed80","d85701bdd7","7e749960e8","016f7eeaea","6d76dd73af","29546a76b7","a05887e154","6f96907405","a5a1299c8a","6196f8fc43","afd5690cd9","6cbf0c3bd7","b7644d224f","0ad60e5e5f","6ed5436777","394d67369e","9d35c60bf2","960db4b3aa","ebdb7f2a5e","79ac3ecd7f","0ad60e5e5f","6ed5436777","394d67369e","9d35c60bf2","960db4b3aa","ebdb7f2a5e","79ac3ecd7f","536ac27f62","f65b082cf2","95b7174619","3d66423b6c","40b1b3f410","e902c9811f","5032a15325","50e9125a00","b238788533","2676001902","56b628066e","dea8e87299","88215f621b","ed8dc15221","93ad00a6fe","fda25d0d95","222f11624c","3df4b29333","62f733670e","86cfb4454b","a561bee17f","0cb4807856","198f5511a7","c247645817","9fb1afdab9","a3b5795e7a","00a124d901","d1072ab7ab","6d93664d66","129edf17d3","844ef6915d","9893eae859","c78deb29fe","ec593d10d6","e0033784b4","79bffaf4d1","5134ac939c","00c083b4e3","fb1cb6be7a","68e5cd00cb","17e5e38b38","791cbe6a0a","3559e8350c","3fe1b95dfd","adf3e60c7f","85fdb0fec1","30f6a1a8f8","869b9e19fc","ebe4941729","b0e133f1c1","c3f9a909a2","391f287517","1b34b24b7c","7b8e148e03","21247e2f33","0bf05a916e","1656497daa","df42505723","816e29a552","ee5a68f147","926c80528f","015bf4e3a1","ab5447d408","0916d7411a","bb79683302","154345f550","d5e3213773","135d7895ca","a4e12be50e","68ce93a249","3f23b25274","678830952f","09a9916aae","fa83250e9f","d111480e8f","b2b4d7fb1e","4f8e21f095","93ad00a6fe","fda25d0d95","222f11624c","3df4b29333","62f733670e","86cfb4454b","a561bee17f","8899bfc7c1","4ed9076886","f3d824d717","5fb6274b3a","22b848e4ce","021f612bc0","5520b5a1ea","32d96b2aa1","5b36cd121e","8562e757d7","46a898a043","d9a142eef9","9168bb391e","c19244cc78","fc7812bc6a","330d5a50b9","66c64440c2","8558a17029","af1cfdae58","6427891a8a","04930bdd88","1c1e345fe6","c576150037","77f15f88d8","55706d4baf","eac4d73ae3","8b212aff2e","f92eea2113","32d96b2aa1","5b36cd121e","8562e757d7","46a898a043","d9a142eef9","9168bb391e","c19244cc78","062546627d","3090887c40","607b0c97fe","e887aff848","aeab8f65c3","a299a00ce9","de0099c764","8ab3d11a15","f750866ef2","3f070ae012","f4bd2c41d8","b41d80a727","fd6e700372","61acc5076d","b049444d38","881e0131b3","ff790c07c3","2b40e9c5ea","c4981d1222","56204caa41","8109ed7b56","e9e097016b","60186cf9be","53c8374cf2","ccde8964d1","76abed9105","532e464739","05599fec8a","c46998d856","5c8d412b37","893c56f86f","111a1b6087","05ffcf4f04","5a6417b556","9fde4079b4","b0496cea91","6b66ed3ad9","c3eaebf9ec","e707ba8928","ee68b9c118","11dd341179","7538bc1d99","c46998d856","5c8d412b37","893c56f86f","111a1b6087","05ffcf4f04","5a6417b556","9fde4079b4","9b989657c3","d99fd87043","4d967a718e","6dd2de4cbc","960dfaa309","8604ba9ed8","60524aba88","b0df8aa770","402dc78a0b","a91391f306","e9382f24d8","b5706a5773","4b95fbe197","1b230ab81a","0954e13650","1fad50c104","3dda36caac","a97cc568d6","3d793b1487","ce3e4a80c9","add81b0a84","4fcd057fa6","755689f4b7","08f5311ebb","c0bc8aeae1","9335d9020f","10568cb99f","8f39deefe2","903e5f2a1c","d086d02ec0","ebce476603","618694f6bd","ebda03488e","7c4425c1d9","3acd70d4b9","ed44d418c1","a2e986b03c","a522b7293e","dbf7e16c0f","737905e386","09418d9758","d523b76d71","e1471ef9ab","3d9911fc81","692eec22e2","285a4c7813","aa12c1a137","e81f65efdd","f5c48174a6","5758a2fa97","fbfbf644aa","356eaefb20","affece9114","5a3522a3eb","6dd229f6ae","58c6d2b13b","078bf4bc7a","a43eb018b6","a5a7868215","3ced37c351","6127c91be0","01c8c8d762","5611d5d192","83de6b4417","183782305f","a10c3978a5","97fad2d711","d9ffa068da","b08009d4cb","1f066b8837","c0f17b5226","87c86f2c4b","cb780c9523","90fcc528ba","d4b2a6542a","4a6d868951","53da3b5358","33daee6137","c8b94739fa","11bcbeeb30","dec6c6ecc6","0832458704","e58cd3aee3","a52a7abf73","e393a170cf","fd3193d81b","4f3f8aa195","104163578a","4ea8fac602","18b13e606c","02e351485f","7cfd8e7dba","5a833f39da","254a283015","20ebe59d54","63656d9387","c4a16a2b86","f497ab03dc","6b9e2b944c","e58d8098d0","e3ea4a9443","30e1c0b82e","cdb08c1a34","ace0875514","bd1ed6ce82","f764aeb365","147343e8c6","cfc2eaab1a","0a2c428857","fdad37da71","0d44fbb293","e9a62eb7c0","f764aeb365","147343e8c6","cfc2eaab1a","0a2c428857","fdad37da71","0d44fbb293","e9a62eb7c0","8b2e23e9be","59b073d725","a0be64f462","624e2ed621","adfd94577a","057e184d29","4ca4c91239","9044ca5daa","258fec3b78","ba6eb85a3c","3883767e9d","a6ccdc6d60","159d90de4d","39758278a0","7d690281e2","37afebf67a","83cb46ea4d","50636692a3","2235442ae4","496bd8dca9","602dfee5bc","ff94763f87","1eea9d436f","3bc1846869","ea9a2b6210","5580dbd85d","da896a8747","f046b3f18d","e3e83f878f","02a137f121","da22e3d40d","777ecef4f9","abe6a34032","afc922e243","2498ea6091","f347249d92","0e43c5192f","7c71c7957d","149788e5c5","bd482491dd","53e1aa12bf","958e3e4ec2","f347249d92","0e43c5192f","7c71c7957d","149788e5c5","bd482491dd","53e1aa12bf","958e3e4ec2","031f72415a","f80463e0f4","ebfccf4152","535c76787a","2a31d565f9","7f3969d32f","a28a2f53ed","2368ac06cf","b9d958715e","08dfbda2a5","7d175bfe4f","a4cce9447c","22bc202375","dea1e8fa11","f4f01b9bc4","bab801688d","c225c09453","1b2324b71d","294889f7aa","ac388de7a2","8a1c013bad","7c8ac555a5","5242cb1d63","5c8d82a6f3","6ef1b49091","93a48221cb","d1e4845416","1ea681d8e0","b512b71579","b0eee779d7","3f3ea2952a","8139f5da0d","c37713329d","4c04700600","2d80b2470d","ddfdddbcdf","dc9a9d4b99","e15c744907","b2a8c430b4","6c27231324","87446c6bc7","a5760ce8c1","ddfdddbcdf","dc9a9d4b99","e15c744907","b2a8c430b4","6c27231324","87446c6bc7","a5760ce8c1","69f8525ddc","be3a040244","53a7027530","92c62388cd","d852390c52","41be66c04d","54b97416f6","97481d6242","a71a7dff9a","3114cd3ece","316ff81079","1572c286df","06589dbd9f","1e44f5d17d","1d177610b8","9cabe2e275","2aa926f794","30768aff8e","9a5bd8dbea","edacd6d5d7","b52933ab10","1d177610b8","9cabe2e275","2aa926f794","30768aff8e","9a5bd8dbea","edacd6d5d7","b52933ab10","fa7bb1edaa","bd74998a02","2c3e979e32","ba2475aefa","d782427c08","03f589e8e6","389deed614","e3da257da6","4ab4d2cb8e","60db4880c4","dde141699c","d7b2c51d9c","54bcee7f58","afbf1f90a8","edcdfef460","dca907caa3","a125821955","af4807c8d5","4d8fadcb59","ef1275f209","a091b9deb3","ea84a85970","3bc474f2dc","6b03d2efd2","e5b0ddb346","11a44883b4","8cb3a4d785","217658032f","ea84a85970","3bc474f2dc","6b03d2efd2","e5b0ddb346","11a44883b4","8cb3a4d785","217658032f","0a5ba4834e","0b4b886b48","7d1406660c","fe243ea1ad","e7d9edeb07","bcfa5f3b73","c1f89fe078","efe3ccd0c5","69d91ad79c","3794a63ce3","add2988aed","82e6ff89e9","74b6d486bd","0fbd81614f","d32634976f","78ca8c6dc5","61e421767f","c0ce792144","7f0e42dfb0","96aedcd47b","7ddc3353b5","d32634976f","78ca8c6dc5","61e421767f","c0ce792144","7f0e42dfb0","96aedcd47b","7ddc3353b5","cd8bf8e9d2","7b62f9ed37","df1bae47d1","a6b6d441fb","ffa6e05bc2","e7334ddffa","2aa1be9c46","a303bfb67a","6fbab027ee","65141a354b","4a3876770f","4ece477b31","ccb4012442","2c359b72e8","f50d39ecb3","091b9ecf47","c5821bfe13","fd1fcc7747","c19c5c4995","55c72c4ff5","fd9ee0041e","c219c9d1f5","529d96520f","7fc60d0ec6","86ab06cd74","01d87686e3","fc23df3b90","e809af2907","c7283445a1","339b5c5bfb","c16bcafb07","03a92f4f9a","b2cc91eb38","7bbc29aa81","6736eda840","c7283445a1","339b5c5bfb","c16bcafb07","03a92f4f9a","b2cc91eb38","7bbc29aa81","6736eda840","c91352e57d","852088b4c6","a18039d9aa","516f280246","59a0085236","e78fe1d01f","ffde243c2d","c91352e57d","852088b4c6","a18039d9aa","516f280246","59a0085236","e78fe1d01f","ffde243c2d","b7c4eef000","68b53d4dd5","9fe0a5585c","481efc3f63","8bb3933ef8","a4bbbe4ce2","45ce894e99","ae3f6ae954","b3b57a2012","a4a1dfdf0d","81c0a32e14","18a8c087c1","ec9af8fd32","41607ed326","f64c6f2550","2de3466013","4ce896c02f","aafaa802c8","0664454679","cde414682c","b87e695102","f64c6f2550","2de3466013","4ce896c02f","aafaa802c8","0664454679","cde414682c","b87e695102","1eaf99eddc","df3d9f5f0a","9e4311b889","58003b8f9b","17a6beebc0","4e226c2dbd","cbeb3aff90","d11b231204","610a27f1e0","245478b397","6b137f6d34","7395e24d51","5464c2073f","ea8c50c9aa","d11b231204","610a27f1e0","245478b397","6b137f6d34","7395e24d51","5464c2073f","ea8c50c9aa","91f4186195","8374229c2f","993b152869","09355bbf89","10b23f672c","34f3922082","ce68ed3f28","5d0977cb03","86b977b37d","0623350ca6","462cf20e7c","af6383708a","3ab06879b3","6535ed1799","5d0977cb03","86b977b37d","0623350ca6","462cf20e7c","af6383708a","3ab06879b3","6535ed1799","6c159116c0","6814214faf","b6c429900f","ee231c037c","a5b9e21972","3171a9c7c2","bd9ae32560","3cadb086c7","eb02fa86e2","d3c257b461","fe28054944","d020517ca0","f4668cc92b","3bf44d5ab6","d0a0d7f9a8","cddbea9572","e5146be445","388c324fc6","b1519d2d47","efdf98ca6c","cb5cbae53a","f9397f8632","6a890e1d9f","213928c724","664e2c9de6","776a049cd4","b0a302e83e","e38c1beada","facbc38f06","699c6049cf","6c76def848","84efb18ebd","aad901bb24","4411765612","6646f86202","facbc38f06","699c6049cf","6c76def848","84efb18ebd","aad901bb24","4411765612","6646f86202","ce73d1c261","939094e1b1","a69ba73c5b","cc24de6e39","1bc75d14ba","952c3e39ff","9769e93965","b30b64aa1e","ec549679bc","06a05c1388","fa533c2b65","616398f8e2","7cfe2148a3","f40147dd55","b30b64aa1e","ec549679bc","06a05c1388","fa533c2b65","616398f8e2","7cfe2148a3","f40147dd55","ef2a9619e8","2555cd212a","d2a2a4aaf1","377c7158a0","408d4b3bcc","86ec681a3a","14d86a1d33","ef2a9619e8","2555cd212a","d2a2a4aaf1","377c7158a0","408d4b3bcc","86ec681a3a","14d86a1d33","5de4ce7a94","376a64b042","b3c25087a7","bbd90c49be","405646be95","5afc208c3f","4714573419","92ea201c2d","089ba6de37","bb5d8eb285","b39919d58a","e214077157","09242e0c12","6616400f66","253f1ee450","3dccebb462","4cc69e6e80","6fa2482bb9","1c53f5c75b","5637d8d34a","8a46c2a5a5","ea30b0940e","f96545314a","0c8c339b63","99ccdb0a3c","424cd22ab4","0dc2516186","d45f0592b7","a39a47b0d2","1066f08a18","96b6395487","7a1aa10543","2a416f52cf","88f10adc2e","45d9ad2140","0c38b78b44","901bcc8c7f","65e42811fa","4d9efe7757","580c617860","d64fb33ff7","76381f8107","0c38b78b44","901bcc8c7f","65e42811fa","4d9efe7757","580c617860","d64fb33ff7","76381f8107","a39a47b0d2","1066f08a18","96b6395487","7a1aa10543","2a416f52cf","88f10adc2e","45d9ad2140","8be99abb87","d0ac372bf0","2684b6ad62","2f909ab681","f1c470a71b","e576de240f","5c88bff214","dd55a42d70","367210b81a","d74e5551ce","453fcb4258","609c093254","358bd494eb","3cf6eb9a1d","ea30b0940e","f96545314a","0c8c339b63","99ccdb0a3c","424cd22ab4","0dc2516186","d45f0592b7","00584d78e7","79acbf3930","0651534e53","4c2bca2fcb","9b846bb8be","8de306bd6d","5865865eb5","00584d78e7","79acbf3930","0651534e53","4c2bca2fcb","9b846bb8be","8de306bd6d","5865865eb5","4960d8db02","f2ab13ca21","9c7cf3a7ee","bd5dfb366e","74baf84797","d37ad7c771","42438fe085","cf0bcfbef0","2b5c4d26c6","4361b57fbb","10e0b705be","a2f30ff9a5","31b83a3742","d055ea8196","cf0bcfbef0","2b5c4d26c6","4361b57fbb","10e0b705be","a2f30ff9a5","31b83a3742","d055ea8196","671a1163a1","9c6ef610d0","f92a4ab8cf","1be60388fe","18c52b7a50","8d5b4a2a5a","0d9b9ddc98","0d4e2e5d43","1e413ad3aa","1a03a02f02","59118a29db","8c15111a25","ed02a21d4e","8e53faa91c","fdd5afffee","77b5a127b9","6651f8fee7","1e0c09891b","c901ddcd4d","b9a93b553b","8e5c18522e","b481e3993a","9ddb228407","7632fe1dbf","03fcce5273","27a4c7a2c4","8684844a4b","03682a0fbc","9565ff4292","f43445e172","75491d44e7","4ac1e810ac","f55530d2d7","1c85a8c81a","9541bf50c6","dfda8887ad","573ebaae34","540a80d59a","404d94bc34","fc48f96050","c55719f57f","092e0d1d0f","06e1df9a8f","a1fd4363a4","4fee6e9c8c","b9eb5ef2a0","005eff83bf","f4de608eb2","efffee79a0","5fcc1e5c24","380ed79466","220bb91eeb","f87e7ca0ee","0395cf0209","479ff8ae28","e5f1408220","0d4e2e5d43","1e413ad3aa","1a03a02f02","59118a29db","8c15111a25","ed02a21d4e","8e53faa91c","0d4e2e5d43","1e413ad3aa","1a03a02f02","59118a29db","8c15111a25","ed02a21d4e","8e53faa91c","c7aa235dc4","a62aee0207","a0cd9c2a08","d498e81451","216525a3a6","5bc5f4430b","d65698b070","0d3ededa0c","24c8a8a679","8156bd96a6","ee6f1fb059","e078ad7239","46ac6cecdc","0a420ce2f4","5444af1f6b","e9d468bfb3","fef271e834","b2012d5be2","2563166f64","b07c752bd8","e99c03cb6f","5444af1f6b","e9d468bfb3","fef271e834","b2012d5be2","2563166f64","b07c752bd8","e99c03cb6f","161929018e","05a9096c34","fbb4748b88","faa650aa43","5ee085959c","fea789bce8","1a8bc545d5","32bdbe1c2e","d92712c329","fb759b3304","7558a5b529","a0b5331318","127e0b6f50","106ae80cd1","d270d25891","42fa51a3fe","c2db6de8f2","2bbbcdd557","019779719f","f210a42d29","73746d73ef","f4fb5acc55","7718c22bb1","8d79202a8c","895ecac4c0","57cbe33e78","5bc4001672","8108cd9dde","c3edde05f6","437616a4f7","0e9d20e095","f498435202","37318339f2","420cbd8b95","cb11bd7d29","308b5951aa","34b7b270da","09667edfe2","8a8388b5ad","b04a21bf89","20fafe0ddc","f279b9afaa","31d3a16355","d6b110688d","f5b84d267c","e3c52bc469","e041c87814","db30d656b2","613abab76f","161929018e","05a9096c34","fbb4748b88","faa650aa43","5ee085959c","fea789bce8","1a8bc545d5","85bad66173","68bd137579","70b2767ab5","dc27c355e0","2ed3b8d704","fbb1dd625a","1a512d5d2b","d62ab49749","21f6370f5e","c8e4dc2c8a","49b066227e","63bb67906a","7301d29d9b","ed76fae149","d62ab49749","21f6370f5e","c8e4dc2c8a","49b066227e","63bb67906a","7301d29d9b","ed76fae149","779485e0de","87917f09bd","617242c07c","bf059313b9","dbfa2ea938","ae1168af6a","5ca3def00c","5dedd39e1d","ce11908fd4","e51ad3d63f","11a7f626ed","9a6a7c9f50","50eed36548","51f9d89f2f","e259263731","19bf857535","28bf7e36ea","1138d83424","80b5a12162","dcb91d98f4","74f0bbe935","da5af64645","65d28f7826","1adaa49857","a53ac8c9d0","6a40c3f322","fa018b46ac","64ab2376fe","da5af64645","65d28f7826","1adaa49857","a53ac8c9d0","6a40c3f322","fa018b46ac","64ab2376fe","d0f22d1963","3a68ccdbfa","d5a258e401","374b62896b","927dffe64d","76474b4775","fbaa6608bd","d00e80af34","a06bb121f0","fb3f15aedf","0d545319f4","0036711b01","5e1134e26b","52519b991a","c8144c5e53","2d1c3c6796","73ebe056ae","55390275c5","6a83c14648","a33f29fcaa","51a2b2f638","bba84ef152","b10db94d06","1db8b524cf","878d60b895","fe87b83779","5c90535522","e46696c203","d9c03eaa97","82a52c8bcb","be48edbd58","04435eac07","1beda44946","b102718326","64a05de442","31cf10c567","f97ea2b995","623b0dbedb","f3bc19c80b","5c5cdf83a9","63facda6a2","f424db2062","d9c03eaa97","82a52c8bcb","be48edbd58","04435eac07","1beda44946","b102718326","64a05de442","d9c03eaa97","82a52c8bcb","be48edbd58","04435eac07","1beda44946","b102718326","64a05de442","2a16e29a40","4d97e892d3","4c3ea198c8","8111bb16d4","c0e6669755","dd702e7b4c","a90f44ff04","78e42f544f","1c5db481a3","6588db2b8d","4f89de4626","2e6a83a8b5","4201a92aa5","b861eb5850","94ae6f6df1","2a9ca88296","253dc01721","99085a8736","b73f0bebaa","b7ea79196c","ff9532700d","e11bf44535","845d392935","84a2ca5b6f","7d60121679","bc95e644b9","3bc2091668","86bb0919d4","e11bf44535","845d392935","84a2ca5b6f","7d60121679","bc95e644b9","3bc2091668","86bb0919d4","c235dadbbd","966299dc94","93b99eb6d7","b8ec49293f","c9a0af0cf4","a374219ac2","2d7a94bd41","31970b4ee3","c736dbbcd6","8cf7ed8a40","2ae0a162c6","b8668eaab7","0d515e46e9","a5583ac16d","19a5e7bfed","35d56df0ce","e3a8d716a0","d8a3abfac8","29803d4f1f","1a1b1da1db","989b53a883","bb5b320854","1a381cf43e","5de370801b","5ebf5c5e09","34d561926d","99098e8eed","07a1c5d2f4","5016c6a79f","2007b8fa95","edb6a04fd7","b7af1c20d3","4eef5bbfad","d2b7563660","d9130d21a3","5016c6a79f","2007b8fa95","edb6a04fd7","b7af1c20d3","4eef5bbfad","d2b7563660","d9130d21a3","58f261e2d7","79d562fc8c","92bb1405fc","e702b5c784","dc02d8ff49","1ee92d8431","ee06a1ce49","c7108bcc2f","d1ece5275d","5b900b18c8","a7ae9896b6","e12ee178bd","6bf8125d0b","997e114e23","c7108bcc2f","d1ece5275d","5b900b18c8","a7ae9896b6","e12ee178bd","6bf8125d0b","997e114e23","2d6e80e4e5","a6eef643a5","5f8f24792c","3c08019ede","80276b8d9d","7e15ab2bb9","02da8462d7","3ec3b80442","31b50a8a1b","530d1ddf2f","57cbe9f478","49455e3e6f","82cc22ed79","f06725777b","76cd18db32","0238874986","686224e026","05c15f0d34","b94c9514a0","42d59162cd","3faebd5224","ae65033d08","7fc84cb3e9","468b74d075","dca060ee5a","b3cdab0322","087ecff450","1384a0c1ff","8278a1ba45","c45f7c7b45","444374579d","9698b57514","0db4d2a24a","0af03e15b8","a4a7429c7a","d7f03c9022","a52ce02416","89bdbf9906","77828c7f3b","372b794644","2486c92870","c219de2f64","8220b67545","fa484b7858","8755582461","583a9a8487","e0ac9f8cf9","3e90f2458b","c22fbe76a8","1cf0749b98","98e27988dd","6213ff5244","55bd6f41e9","ef9f6b137e","a2a890a316","b15b0c5712","f50f5c5197","86248eca94","f87cd5b09f","7cc33ff77f","c1628d6d2e","3155dc3cd6","9eade5883f","c511884ed5","2af257ba3c","de64b047d1","203517087b","0fa7d8a938","ec27a79721","4839fd2b19","c511884ed5","2af257ba3c","de64b047d1","203517087b","0fa7d8a938","ec27a79721","4839fd2b19","9379da8dba","7d32d6cbc4","9a6949d4eb","364e417ee3","2950a38812","5225a21f0e","c2b2718666","027854b136","1831dc807f","75cac6615b","4fce220d2b","ef950eee76","c4811bf95a","f88437d8e9","d4ce1770b4","67fccdbc84","bcc4ce9c06","373222afa4","994d105403","5b6bde9b79","15ebd07fc6","8f5acefa89","bf1fd1c5f7","af7f42c1ce","416a9c700f","17bb325846","15b69e7730","570c7c471e","fed9b21407","52fa21d14e","b90336c7b5","9da76128b5","0ca69f7767","4469d73525","b4fe77a9f4","803ac2a6f7","788ab93f25","d2b4a696c9","abd0918c19","e967217d03","03d66eb916","2db95f48cb","2cebd7e32b","44aad2193a","0ff2d447f3","945ee79be8","a392ed6036","d11babb683","540721ac81","d5c3fcce17","eae53ba5b4","d4aa6c56b7","827bcf7ac7","ffab0f745f","3fa1ff098d","4e91ef4133","d103a1fca8","e60f6419bc","9595bafe90","5a62c94b1e","11bbd4a9e9","ab5646c2f2","2ae8fab9b4","08fc687b80","6db6b31b6c","ce0e116050","db735c5d1a","7333b720d0","b43667d149","dbf80cebf2","08fc687b80","6db6b31b6c","ce0e116050","db735c5d1a","7333b720d0","b43667d149","dbf80cebf2","f4f320c134","766f8f750d","a01b99a125","a8ca69f92a","f269b9d702","92f79caa23","e8b601f6ef","1b9fb7d210","73436f7519","ed606cfcd4","f4572a9333","c7b60aeb93","a3cc8c4d07","d6dc508a9b","1b9fb7d210","73436f7519","ed606cfcd4","f4572a9333","c7b60aeb93","a3cc8c4d07","d6dc508a9b","9389c0ab2f","3e9fb119a0","caf678e109","105e25e2ca","ad24ed0c3e","1a5d241d43","ee9d41112b","d8a0ca63d4","38a7ca4322","1db2f4d891","b9b23a6ad3","22e761adaf","f0d2dca612","74eb20b382","a716cd7e1d","0374aeba6a","15c03d682a","163424ced2","f6809e6d62","ad3cc09d5c","bd9eddbbf8","e182b0f048","3be620a50d","473f0541c9","4d8bc91b01","016ac6387d","3d64c52361","fab504ed7c","3729c3aa20","0ccaa53adf","93b4ab9d27","cee83a8890","862f3036fd","acb40c303a","98856a343c","0916ca2d62","6dae4d9c6f","0ce9986420","db8df43025","ec48ac4341","aa6266e123","92159448b4","0916ca2d62","6dae4d9c6f","0ce9986420","db8df43025","ec48ac4341","aa6266e123","92159448b4","6e25b5d2c0","9a042295ff","16136a6523","f4eb6c7752","277192934f","ae081a76c2","bc69a08805","56c80ffe41","ee5d804009","22ceed0efe","b9c0b16d3d","44144cc5aa","d1bf4834e7","9adb746b65","31fd877ed7","345cf154d5","a5903a80df","c53588a569","4d5168c98b","3fdccf94cb","246f16e2aa","d79adcbf9d","f6fba87a4c","a53ed78f35","332270a27d","72e5aafb8b","be0d13eb51","2b3d71ba93","e6e8be7a77","bee91ad205","13b4ef9f52","2ff63f29e2","50f27427a9","65b07a9607","0371705356","5293c43445","a0e5fb1f02","4ed218212d","c7f9733da4","b4d6b207bb","a167164688","0bc27aa33f","8077794498","a2f35c6e92","3ae31b9bf9","6d6fde2b15","728cd342dd","00376cf820","2991063460","56c80ffe41","ee5d804009","22ceed0efe","b9c0b16d3d","44144cc5aa","d1bf4834e7","9adb746b65","56c80ffe41","ee5d804009","22ceed0efe","b9c0b16d3d","44144cc5aa","d1bf4834e7","9adb746b65","736e737837","6d7d7f830f","8039c6712e","20b24f6ffb","5f140692e0","24c53b1dae","2ae6e4c412","736e737837","6d7d7f830f","8039c6712e","20b24f6ffb","5f140692e0","24c53b1dae","2ae6e4c412","52bf18fa3d","f21b8d6eb8","4b0aa2e143","6fb98d6d5c","3e02abd6fc","28664b1183","7d87bc675e","e1680c0180","d4f1518645","595c792f6c","382414ca42","3db4274cf7","e1e8a87398","41d368a778","b413c2fe7d","6b4c8fcde2","d6d0e2cdfa","5844cbaaa4","a8bb9a76e9","1c33540b3b","04b1b54470","2d04a78ddc","5c3ac3a5f7","b899023925","d422a8a9ea","a58948e556","022c23ec3c","20818af7d6","539106d87e","b9ee05ec00","30238cf64f","591e3b01d3","7aaee63bde","66f3e14792","5687fff1f1","48a60940ae","e3663a2230","8a9519ce32","f7e7abaf09","05b1d08aa2","12cf423be7","23ed6c772a","b413c2fe7d","6b4c8fcde2","d6d0e2cdfa","5844cbaaa4","a8bb9a76e9","1c33540b3b","04b1b54470","52bf18fa3d","f21b8d6eb8","4b0aa2e143","6fb98d6d5c","3e02abd6fc","28664b1183","7d87bc675e","216c80fc05","5c8a0e5588","0346027e30","8d5963d513","3ae5269dea","a4540add3b","b638b5a0e7","6c723553a7","1dcdbd17b4","fd909c8caf","261ef84659","1d212448fc","dd6d26feca","3d7b95112b","cf171e2a02","f6568d19a5","fb44f3ab13","201eb9f0f6","a6d848daa9","70527659a1","24c2865487","539106d87e","b9ee05ec00","30238cf64f","591e3b01d3","7aaee63bde","66f3e14792","5687fff1f1","4046f53902","1f76bd589b","c7da408d54","b808d4afb6","f5f5d87902","0ab94006d1","273384dbf8","b46b2e558a","72213d4868","cb56864d18","73d5db4c5c","182a8cce1d","48e98fbffa","72a1c26def","76e58a24d0","6bbcfb3489","dcb1b6fd08","2d120776f7","3f54938ade","dd8bddf5e5","3ede9b4a65","bdfa41422d","75cb341dc9","44673a01cc","cfef2a7cf5","2bd4cccd30","221fa03d87","2c83e509eb","c89da1101f","df69507554","15896685f9","c93d1cf71f","b51bab1bd7","a93a7cb480","594bfc899d","35412f5500","403530b9b0","0d832a4b44","e66292638a","ba48038596","166a2b84e6","65beeccf3d","4fc2429f9c","3dfcae43eb","ccbd772c42","679a67cd65","15b0727dd6","a43554678e","4bf703c7f2","c89da1101f","df69507554","15896685f9","c93d1cf71f","b51bab1bd7","a93a7cb480","594bfc899d","b774f7eafd","471114e505","8314268bef","d95c3a90f7","f006a1f629","50afacb7b9","7f17ed8921","afbe7a556c","47b9d7d196","692453febf","da74c4901b","882d9a8288","e5dcfb8ba0","491ffe7937","1973f8cbea","0f3dda1991","48f8ba87f1","26a897ae50","72c25ce0e6","83859a37b1","8887557e2c","7f54b869cf","1f404b3001","fd46a12fe9","ef255feb2a","9b369265ab","b579b96236","0296af76c8","55310b5844","c0538fc8d4","12f3dc14bc","7970efcb10","127e5df4f3","b3ef29d6a6","acca9d53f8","3634cdef84","38a90c6d08","dc054d1b79","96676f52fb","7db61e1738","6a35d62882","eb1d50d05c","7d2932a27e","6e355dbabb","ed9eb237ed","715494744a","cee55cd391","17c2abed55","6f13f2b988","7d2932a27e","6e355dbabb","ed9eb237ed","715494744a","cee55cd391","17c2abed55","6f13f2b988","cedb1af97d","7f413a6482","4857fb6383","61332d7e64","5ede978b64","f9ba031339","3374d75098","cedb1af97d","7f413a6482","4857fb6383","61332d7e64","5ede978b64","f9ba031339","3374d75098","b285ce935d","d254a7a42c","48df9c3979","e21e29a613","d0b1c635ee","91c0f513aa","941645ae5b","bac335502b","c9da5c8b79","bd7fc03605","236aa70c02","de9809cdc8","10a637650a","9e98984466","ec30cc8e7c","be1bccd480","715414f38a","84ffae732b","ecb7b779a4","e7841c403a","df136d120c","ec30cc8e7c","be1bccd480","715414f38a","84ffae732b","ecb7b779a4","e7841c403a","df136d120c","5b9a5d4907","db5ba91421","429d709a4c","98921d6a46","4d301c7f9b","21e1a61b52","65ae6c2a1d","80d9458eb8","e637dd85d0","29ea259d7f","a55a5c024e","ea2d24e15d","4ca60ed998","af74cfa96f","00fa74bc72","9bdc125b89","1afaaf83a1","281512d073","0ecdb55390","b6c6f5c34e","a29087813f","1c917732e1","18d2be2db4","cc48dac289","5615aaa723","2a72b8ab9a","22fa8533fc","51efccec60","12d82fd9c5","91e61603ad","97149cf99a","69c2a605e5","fccd2a1737","d05e7c934a","1069792865","e776fee60c","c902dc84ea","53b4f5e076","db7458a362","86bf0601e1","37aa8c3811","38ba42f986","de5992019e","25e7831f08","0257f7b950","71dc013d82","f432c905fe","eef30dcc47","26ed17b8d6","52b778da02","ceaa81c366","a82a03e8ed","71bc63a74e","bf469d2835","a9bd93188b","b57cd062b8","cda7f4d1d9","0bce2b9f8d","665bbc116c","9a534f07df","172901e9b6","5ac6f80ed1","d4a5b9d431","8a25590f7d","043bebdd69","945ba895a1","d7b2f97f99","b7fe6b1783","2ad31b30fa","a7abf13bba","12d82fd9c5","91e61603ad","97149cf99a","69c2a605e5","fccd2a1737","d05e7c934a","1069792865","ad6109a8d6","5dbea1cf3f","cb58cfe469","ce92b00413","6b8b554f52","e5bc887e41","83571d5bf9","df786f5c5b","d8ab374349","337fe41067","fabf82d552","8daef733f9","98dd85c2af","1d4a6b9201","dde94ac7df","2ebb7815e9","14f3876015","cf650bbf2a","2c0cfa1063","5aedf7f259","7614434691","b10f12bfb2","2a28cb6ca6","6a8e696f73","1cff92a8dd","b3ab08189c","82e1a098c2","38ad6ff7a0","c7d25dd4d0","a0d6eb2c19","d51c32c01c","2090f9ce78","6fcefa1794","62b7cdf291","88d817afd7","6758db3e83","9e21343315","1553f9764a","a37e0b0884","b88f956227","c228c5ab81","ce75f9d3fd","ddc842ed25","7f0c0647eb","d953990081","5414cb76e3","87111d346c","7ca917e728","5774567bb6","d40203b088","84a90985ee","3b4230e95c","0d213823bc","30a0610e1d","0e0b7fc0ad","c6b91ca569","95995fda18","b003c913d6","e3c9c7c04b","5cda5b744e","936c49d7d8","4f67f25b4d","da2d2fc3b8","238a30f3e9","aebb44f6ae","a71191ad1e","5e6abd0444","e7d169ff06","fca2f92785","cccd3ab3d3","238a30f3e9","aebb44f6ae","a71191ad1e","5e6abd0444","e7d169ff06","fca2f92785","cccd3ab3d3","8f50dc2eb8","4ca1010270","7d67a3076d","44f3504bb7","205d3a5095","2f52ee2d6e","147d27089e","7949175d84","1bf9001a18","f9b96006ea","4bb337e065","7dc5288fb4","a3cdd5a64e","410d53aca3","7949175d84","1bf9001a18","f9b96006ea","4bb337e065","7dc5288fb4","a3cdd5a64e","410d53aca3","ad5d9ae395","41b534bfaf","1322669a9e","ce84ec9e25","d4936dcf0b","2bcd0057bb","cd7a916090","de8f63c9dd","18132f1a68","7d469339ef","5997f1b51d","232626578b","a8a4bcb400","aa6af8a914","bc059f0772","5b2e8d93f6","439fdbe765","cd8bc73481","40d02bef97","8fb4dca64a","8e68e952e5","91d0360626","3e6175868f","a2d5c97bc8","c1d00a7990","1c51f30ece","3b4732f107","824ceb33e8","fef6527073","c061a434ca","b6b6ecffcd","94d39ef384","114dba95af","3761a311d5","ea4835a2ef","6967cbd8c3","e9b56a3411","6241fec5a4","0745e03669","5b7d320533","dda2926197","c91625c9a8","ad5d9ae395","41b534bfaf","1322669a9e","ce84ec9e25","d4936dcf0b","2bcd0057bb","cd7a916090","5bc5a1a6fe","7ff476d053","49fe097527","38e31250fb","f33037c3b3","4401e5d436","ada1763458","049cf102b6","85d00165d4","73ce693002","db33466afa","79bbf8b7ea","5dd230401e","4f1dafc4da","928b3808dd","23e1007e6f","cce4708164","894055939e","4245d9abf5","a3d8be0739","f3defc744d","bdc06cbfb1","b73beafb3e","aeef725fea","aa26aafd93","63617eabec","25cb449fc8","718a328540","8e6d81d4ae","52227151e2","6e09cbab85","b3c9a26a08","c3e82dac46","eb83589d28","eaaec87217","0c9ea79011","13b3b0a775","b18f3dad4b","36d43ec3ca","c6cd411a46","71e0b47523","539d204de2","7d37bda206","9dabf2505f","fb837f27a6","55e562b894","cc866a7401","a6ccc04cf1","84b2cf6cb6","2d3f1459b9","253c84adae","b40b5a2685","faf5352c3b","03528cfae3","34a1057aec","78d2953496","62f9e5be5c","7c873d5367","c06765de3e","8b20b6a323","796f1a909a","6ae6b8520a","21b56b1aa0","928b3808dd","23e1007e6f","cce4708164","894055939e","4245d9abf5","a3d8be0739","f3defc744d","1d0be8cad7","c7f2074af0","4b84977d75","8be220d22e","7c3037b63c","d741c066b1","374cb2c714","659fd52eb5","cd12dc752a","a0bec0281f","a4d5fab7a4","3e6b6fb021","9bc63a3fe1","e170e4c118","28690feb69","d99ecf823b","4ac8f516db","3bd8acc38a","a22860046c","458f9adf22","039cd07961","9f99ab258d","b524461592","29ad68f6dd","30faea0cdd","782eeb319c","7a5a8837dc","d5839f053e","28690feb69","d99ecf823b","4ac8f516db","3bd8acc38a","a22860046c","458f9adf22","039cd07961","28690feb69","d99ecf823b","4ac8f516db","3bd8acc38a","a22860046c","458f9adf22","039cd07961","e717434abb","199b2038be","d2b31b654c","2d827f2a90","49e2605fc5","9fe035cb06","786c93268e","f15cd5c210","b21108d740","1416e9d0b8","731b6ed163","a6cd36b432","14b45b1382","ce87d31334","b56c33213e","f41c7fcc8e","73c5f9fb05","740c42c737","eb7b65ea12","e7219b57a7","2e1dd74bb4","2da0baf9a4","99c1512c90","f754b30f99","9ed0ab4c3f","4ae41f522f","ec66947577","a24d894630","dc7a9d61e7","0e8d9682dd","1ec38c1667","019f1ce8e5","0f4076fa6a","7b507b6e53","d20ed27b77","b64cd2c677","de7a42fd58","3f6c2ac800","91d69a0c6c","6567d112f8","7d39527007","7522b06b38","75dba5551f","d1707af901","e879974a46","ed7e1932a6","569a27c729","557953028a","cdaa67ac24","dc7a9d61e7","0e8d9682dd","1ec38c1667","019f1ce8e5","0f4076fa6a","7b507b6e53","d20ed27b77","0cbdc63e8e","c88574d07d","1d2bc61e05","80bcbbfb71","59c14dd8c2","4340bea6f8","2d6151ab2e","2b854b7bd3","ea3d89ffaa","ad2260d12a","d98d6593ac","5219a9be1f","8cfc946234","1448cd9174","c7ea4e4742","149a7bf122","8189a1aba5","5460dc3984","c092fb921d","b041de4e31","f9b233acbd","8a92585f71","fb93407c0a","f0842a3174","d6e995586a","ff0193463e","62310889ea","6be7c6fb26","a41711dabf","417c0fb6a7","edd465d7bd","4cb088d6fc","81a4965502","8fd09cfe25","6291ca7df0","f08f34fa45","3e2b40ba91","a1f85198d6","7a7b51eb2e","3433f2156b","a67d14a5f5","88c06e98b3","a29d68d995","25fec7ebd6","a07686f728","5c3eec9126","805769b258","9ce84ccf3d","f20f0b8b04","066426d385","30f7ebd4c6","416ba06330","93064e3f7f","d4e4d437f9","169842399f","e213822770","c7ea4e4742","149a7bf122","8189a1aba5","5460dc3984","c092fb921d","b041de4e31","f9b233acbd","2b854b7bd3","ea3d89ffaa","ad2260d12a","d98d6593ac","5219a9be1f","8cfc946234","1448cd9174","87317879f5","2c7e1ff1fc","5c7aa3e977","926f64bf6e","e7f44aa4c4","879afd1d89","ede59a13b3","39e65961fc","2f1a25ffdf","d9b8fc0ec1","81f48a9e6b","3119119003","50453bd11b","78bd177b55","03d133315c","da6729387e","4151d7364c","d201be0d78","8e65992edc","c1ae728b22","cc0594a1b6","0c8c9934d7","7c0ff0ddf5","42ef2b91d9","ea974407a8","6c02cc542a","9aa200331b","9fa21c9431","f345211c44","ed8646ac6d","6332f8d2f1","34c5f35a51","84b7461977","b90f5b4f27","a37a7a09b0","3d32dc4624","50959d6d31","640a883a51","0e16985b70","489cf4681a","e7e87c7cd6","e48eb1ff7c","a6f07b0c8d","727f41a48b","1249cc2379","d25a52f143","341709b70f","4a3b5f78b2","0747d8385e","ee6f677698","46f4dc8109","78ce40a7b3","6a6548cf6f","3a4b047106","cef7d8bd03","bf64d23f7a","0c8c9934d7","7c0ff0ddf5","42ef2b91d9","ea974407a8","6c02cc542a","9aa200331b","9fa21c9431","485925a35d","36b0b3d970","e3306767bf","646af8510d","100373d520","18cbc5a30f","bdd7a1bb6f","82f9be0a77","8eda68f76a","3814dd4313","5aad15f6f6","c70d3da1c2","cf6b702f10","6718e28d19","1bbcc79783","4fe93c12f3","35a0b0bb3e","a260cf1688","7cb4cfdedf","813d64e640","5012cc7173","adcf08a8e1","5342267143","851c3d3017","91bb2ea133","b6dd6329aa","f41219f9f5","1adab6a16f","50022117ca","847c0b56f4","12dc459762","eb7ee3d72a","adf2796d98","fd100bfb27","13b37e5fca","485925a35d","36b0b3d970","e3306767bf","646af8510d","100373d520","18cbc5a30f","bdd7a1bb6f","7409dbbadb","e4094d64d1","8e4a6bb3a2","6aea50d0a8","93a60e4bac","d89243e0dd","c778048c68","14d71ff159","e38ca4bfce","7a3dfb3258","18c9ba6484","82efb3e469","61608bc8eb","52cb64cc48","2715311445","62246c1006","5d09b99888","6932156d55","772afae34b","77ddb532d0","e64c8df28a","bdfba9b7e3","fcdcc92aa4","f4128e7177","87f30402f4","61a9543bde","23719345af","fb21a08088","8cbdb593ca","04e0e3f413","990723e1c2","7bcfea039f","9c0cb4725f","e807310c72","ffeff6df18","8c1b4d4dfd","901c657f2d","dcce1fd896","e7208bcc11","30263d3611","77861b5af8","63c162d0f2","1477718d1b","30eb943629","df5b139368","63a35da549","7d44dfbac2","23f197831f","2e28a34eea","1477718d1b","30eb943629","df5b139368","63a35da549","7d44dfbac2","23f197831f","2e28a34eea","77ff120d77","38db4d187c","ae9848d3a2","8db38c23ac","02064ab7d6","6509b991ac","1ad534500e","8c7d63d1f7","e8724f9047","acb1fe4209","3c76f50d00","618740c0b5","21b3c6a2ca","a21d739aa7","26154f113c","973fecdf43","8b3dfda278","1b61f4b4c5","9056e244c9","b296b74009","ab05402875","5172a4733f","74d5a4bc5c","fab04de095","e4cf11421b","27d03f18d9","1ea5c6be71","5786d35085","7eeef83f07","c353e4e307","40789f8a93","aa5f5b0ab8","ca05719cc4","7379417976","ad2e232613","ce5c6ac0ef","36d0e132b2","6095d0a3d6","215612252e","de8930bd5f","99b5357cbc","58ba036ef1","d52b0f372f","33e99feef2","ad4ea0f893","2f463db8a6","08c102c3e2","8cb37656be","c468569e6c","c3217b22a7","5fb92bd3e3","58277cf2fd","39f050982b","ed303fccdb","6a1a91952a","68d946622a","c3217b22a7","5fb92bd3e3","58277cf2fd","39f050982b","ed303fccdb","6a1a91952a","68d946622a","9a9f5f947f","b8ae47357c","5e67d9f4fb","a85a8ae546","68620d14e7","7b9cb6e639","0196f1ea25","710c0b3aca","17ab581115","75d7fecd1e","dc561a8038","9f9aa11ef5","945879b633","76d18c93bb","43a3fefda4","1ae0bd9134","79354703ab","f7965974ac","321ab664e1","f97939f662","5e9ab0f0df","5ebf365377","afe49be45a","617ae205cb","6cd3acd60b","15dfc01ad6","7036e6b6c7","cee150caa6","013da48acb","7951096dd7","dcd7c16582","c02e045a0c","77f91c771e","17e2614540","f2a824fe1f","25ce69c45e","fce44aa607","14a72f3ed9","f29cb3cde2","a3a66a9eaa","4bddb92406","97447d885a","43a3fefda4","1ae0bd9134","79354703ab","f7965974ac","321ab664e1","f97939f662","5e9ab0f0df","89582baec5","a8230a0c28","f187091bb6","4c1aa6d607","c896388df8","38d45a883f","81bb9cf6e4","128968f512","157a65c3c6","9546ac8ccd","656c093fbd","158bc9a35f","b67e1379de","d064211277","cb52fc2a65","f4be2832e9","bf4dc78bc9","c783192d6b","d60b28f5b4","b66357fc91","a1791420f9","b98b7f300e","9e21f8df62","96f86349e7","da8225f0bc","5b1dbf2664","99c703d180","90a41e8117","9c13dd8067","9593ad713d","ba7bdb84d5","ba80026836","0371428908","77f1705ee2","e04ee60add","5bdd2ad860","c01d8d02d0","84eae707e0","71e76c3649","ce6c86231c","5efb03b223","c8927c1971","e13d0d4adc","fc0ac14a57","4502912ae2","fa82242f8e","c951bc0125","bdd10ad84f","08f5efc988","710c0b3aca","17ab581115","75d7fecd1e","dc561a8038","9f9aa11ef5","945879b633","76d18c93bb","516b6e36a2","56d820065c","b917061287","6ed28561a0","072289ce16","01510c13ca","a9d9d59035","88a6937cab","a84ed39233","244df6179f","bae7d8d66b","dfc708f50a","cc22e4927c","c0c582ecd2","94ea45f6e2","28ca495341","a9b55ee7cf","d6c2084080","cf33a41eed","7886a42c5b","293439cd2f","686901edc9","928379721b","f05e93efd0","cf9bbf6d97","38a512f313","2fc7bb0d84","17017a5018","686901edc9","928379721b","f05e93efd0","cf9bbf6d97","38a512f313","2fc7bb0d84","17017a5018","686901edc9","928379721b","f05e93efd0","cf9bbf6d97","38a512f313","2fc7bb0d84","17017a5018","3f6966efb3","8d77baf64c","3d007a683c","355536a312","d87c1e2711","38d813c946","8dced95d5e","bcb02aa445","5e12739d7c","1f884f3bd6","e21307178e","1ddc3f8c2b","15be35d998","35165e8600","bcb02aa445","5e12739d7c","1f884f3bd6","e21307178e","1ddc3f8c2b","15be35d998","35165e8600","a7cb61d3b3","5b89988cdf","5c134817fb","ee43c68043","46e5f30dad","883186111c","55b93e61e8","606aa1a440","09c854dff2","895379bfa7","8611e8bfca","77e090dc1f","6d3ca7c7bf","b23b790d2d","aac65deec3","fcc9b8d1e2","0bebf8dc7c","cbdae2b591","39f07c78b3","479d90c844","8bbd4265ea","766e4d122d","20609903f1","2bc41c2b07","f131628644","1c7e267b68","f338114037","3dc57e7909","854dc1003c","6893a4795d","88138d18c6","b8cb0dcda7","12d60a980d","fba0c6c682","1f780364a1","48b28eb7ff","a34fe6429d","3efef52e2c","3f56553878","33a796ff33","8c294839d1","8c71de75b3","d1a839d5b4","fbb4c236c8","e6cd25fe26","49eff659ed","8fe6937e29","26a0c1848c","a92abab491","8b36f82c88","d08f4b110d","b5e485846f","d70c96c805","7b1d556386","fc2d15f878","16795d9db6","1d7ac6328f","a14fcfac56","16115a6ff8","e1ac159387","1351d325f1","89a66d398f","d772f14f2a","a5b50d1d21","3b17f3e7d4","025bf1f335","4b03de86a7","9f220677b2","2bcc67db74","502393588d","63bce6ee0c","1827c92b10","eb608854fc","69096ed6bc","79e56af116","e4743ed056","faaf610402","fa36540565","843944ca4f","644779b306","8eeaa88ea4","655d89ad80","58c4910bf4","98b5fac99b","48b28eb7ff","a34fe6429d","3efef52e2c","3f56553878","33a796ff33","8c294839d1","8c71de75b3","285dbf7cdb","f5fc3aeff5","d7a3202e83","8e395573b2","b0216ca0b6","eb7aa828fd","3e95472b91","04f583a71c","65b2f848d0","7e353db159","7e95657f44","96ee1e547b","3fb0c4d79d","3c158c1023","561e3c375c","4c38812b2e","e7da73b52f","a327e6f159","b77c19eb40","041c931336","0204d0f198","69a49d3864","2c50cc41ec","2008d1356a","d9e2f92aab","779e3f4704","a211d59844","fadedd7edd","28c3857846","a84be34005","c30bd20085","211c4e3686","4c0b9aaf0d","b1696a883a","7b7bc3f00d","d284461df2","c898e03211","d44f127cb4","6a0fdcce16","7a55128c86","e4845b07ff","ab49ab7c67","6800f96038","d8f84ed5f4","8cbef57ad2","6c2d474420","f0c9022bd3","668419995d","a6af44a270","5aa81b338b","67ed50fee3","8d2902e2c3","1ebd60798c","96599ed7ad","19643fb874","248933ecd1","5aa81b338b","67ed50fee3","8d2902e2c3","1ebd60798c","96599ed7ad","19643fb874","248933ecd1","d3b8ebf420","2e2795ce07","2487a543d3","7cf24117da","666f09068b","be1203f508","ca53e2ff30","e24fd78d90","d9536b9f2d","509803555b","9374045001","456632160e","692c78af24","7a5f365a0b","3f420125ec","793aad08f8","973aa7260f","ebe9565816","2c28e1ecf3","e7941c0e21","80df5e0c00","3f420125ec","793aad08f8","973aa7260f","ebe9565816","2c28e1ecf3","e7941c0e21","80df5e0c00","328f605071","b0f1fbbd7c","41115634c3","bd2f85a625","ab22565abf","af50b3ca09","77689142e1","87dbb9b765","50c814e61c","d4a90c7bf6","2e8e004273","843fb8866b","500c242b61","a0aac39c7e","524a39c5d3","b60c850fab","2ca7740114","4ede2293e3","f3e7d01c8f","6d0083c116","b63ec2802d","23b84d227c","5937099093","dd64be6dd2","bcf928ce2b","8d976515be","0d9077777a","3610323e97","e004c8ab7f","dc9fe5fa2d","452151dc77","1036b25697","312127274a","63d589a69d","2dca5c2a88","14f95e2ed6","a9404769a1","6b3a56f301","d4390f883d","5cffa03fc8","19ac2901f1","a92371453f","e368d82258","b0a9732af0","a438a0aa8b","dc2338c41d","0274086974","8a458f2950","30d8b3d134","e3d9a14865","929d98da03","ffd39e3fcc","d570f7eadc","35e0ce4b2f","232503bd7c","e2b2c5dcab","1ba331e8f3","175f9a0253","15f8c52302","e0b14cd44c","2306c65526","13f63c4323","128831e523","400c07b4c8","c95f32cac7","22264e04e2","3a570934d1","94493935c9","8d4c0ad0cc","b511e5fc97","14f95e2ed6","a9404769a1","6b3a56f301","d4390f883d","5cffa03fc8","19ac2901f1","a92371453f","efea521519","65a923bf03","2d922a40df","08a69e7909","4b1c99cf10","a84eaf64dd","49a31c2842","568387bad0","3ec6d869c6","63b9865bb7","0541e8d932","cb9c63888b","118c72a4ba","c0da0c0fdb","fa4aa06c08","a316b91122","5984f564cb","e60ce4dc1c","869398cd21","f55d31de1c","a74c198234","31fd004946","063174f0c4","0ee1d5cf1f","8d6aae3e95","93b08a74bf","8abc78d75e","14daca94c1","ff2d668a5f","24c73f014c","17fc850c24","3052e812b4","be35c2727e","c8bb39e42a","bcaa37ca01","05dbb727bf","2585720033","058db19e46","f4855733e2","6f87812a65","53c632aa73","c3553bf972","5e4ac578d1","02300238f3","ccc3d911dd","72e2cfd268","3bccc6d76c","5e189150ac","4492754e27","c2f63ad3e0","b378a83a39","76396a8ea7","783ad626b3","1e25ee134f","09c35d4f0c","e62ad210cb","63af4a48dc","3a88c65ac9","70a45843cd","adab8be9f0","4999f13045","aa6030f114","d4ce448083","7698b93615","74d0507b7f","a2f6a7bd18","5a5a20e7ec","5dd71729bc","ce4379d4c8","49f3f414cf","846e84547f","5351d42b7e","1faa669055","ea87c46dd6","95dcbcf41a","08d840e4e9","59e19a651d","31d3ce28e5","ba95df87f9","0950ce2743","99b85c99b9","e98da12269","4720da4fcd","0870d111d3","1b492c754e","008db9bff3","2573dc72c4","e33f7e6059","8439b30dc3","e79389fbcb","e844eea0dd","51d30e4318","9dcea6877e","2eecaed222","e70803f392","301f8d87f1","6ed1eb504e","1954f0e597","ed57fc512a","5b50afac07","ad26490001","ce5a4c9ec1","60e87b0c06","2c731618cd","b88d095c23","1efe0b5eae","2c57087db1","51cfe1da75","bf213001ff","c4dd197a22","4bf6d2af85","961ffc53fc","1efe0b5eae","2c57087db1","51cfe1da75","bf213001ff","c4dd197a22","4bf6d2af85","961ffc53fc","2f94f12b06","d21564eb30","3109863273","4b4efd4721","be360f7531","4c7a74171e","f2f9ba4911","66ad318333","cb212bacb4","4c2eba2a77","2159185f40","46ce913df2","5c78125807","0ba76f8d66","0adcd5ee26","6f4d8e9e50","396f558cc1","9bd177ddbe","6d6f861e46","2794f03d78","157696bbb0","471c471141","a1084d3250","5f8fdde2ff","a4420df851","effb35ff77","7a197bc253","9d6dba49a9","bbc99c559e","ea0693075c","f1fb3a504d","fc71903159","00e083f1bc","21a058b70e","35ef7ea430","bbc99c559e","ea0693075c","f1fb3a504d","fc71903159","00e083f1bc","21a058b70e","35ef7ea430","a177620fea","db19a5c70f","d24fc60558","30cf5c9114","8e3a649025","ab230d8438","a28d0ae0af","157896717c","f4b34d77c7","955fc3d3f5","4295cdacd4","47bbf5d73a","f827bdaba6","739305a055","bbc99c559e","ea0693075c","f1fb3a504d","fc71903159","00e083f1bc","21a058b70e","35ef7ea430","4346a9f348","91b5741fac","53bf3b3b73","250687ae96","3d2511a3fb","32bb446baf","1ab58e588b","4401ea7606","cf0738d4b0","c3a77bc3ba","729aa93b9b","7c77fe5434","bfa892d028","741d2ad51f","776416ca1b","b966f2526f","c67af611ca","9d1b9bc8ba","bc6592cab6","1ebf5b166a","a4baa563d2","66fc3d15b5","22b67aba6a","d3efd7d003","a9b3051aca","e2c5a1edb6","df34221c13","7b5fad27b2","a1b4a4b914","dc4bfa0e7f","ab37223787","e3405fca25","4e61ff89a4","3ac11b1d44","d221d5978b","6e8c013cb1","2c78bdb018","062feb9bc9","391e051c10","fec4805165","512a969903","fbe1082083","6e8c013cb1","2c78bdb018","062feb9bc9","391e051c10","fec4805165","512a969903","fbe1082083","a0f7b6506c","2c011983b8","cbdf49abe0","bbb92226d7","d015d89c38","ac0e159227","cc2a6224f3","ed01363927","f32093b2ab","3c95ba1f68","a7822fd4aa","4c7d561f21","ca286d928a","4cc8e2703b","bea78c42aa","a35a4ee39f","c50bc6939b","feb6d3c5bb","f0614505d3","e9e0479f30","2e5e83dd74","dd81f3f8ab","5836d88a33","ab1b99fc6d","4809a32736","be47dff976","25a7fe1bb4","401033677a","033bd51aa2","e2a4aa9a62","330eb0057c","7d3fa80af2","bce0bb6f2e","c28e993175","a5032d7f0f","715a27168c","96e36e386f","892e3bf6ea","c109b8fbf4","194bedabe6","19ac87c636","e75fa92700","c7577d4976","f2e4afdd8e","50b4da19e8","7cd57cd872","87c58e5fec","a41c003bf1","5e007b6967","22be5b387d","a07c2f52b0","c85b8ef019","ef136193ac","802ce171a4","21d152c420","9643de073c","b48d0a6779","883df6eb04","5e74dcc707","d497e16841","2f25066016","3dba84d4da","110f8c4dca","b48d0a6779","883df6eb04","5e74dcc707","d497e16841","2f25066016","3dba84d4da","110f8c4dca","e77a7c475b","9ddc04bf6f","cf48040493","127f043cf4","dfd4920036","6e9de48567","f760d2f93a","ce4ea08afe","281d71491c","a9e0c07f36","fb336b8401","5c4b96cb7b","8bc2ca6b02","a3a508231b","89fb1a48e6","2a89af19f8","88a6d912a6","c1cdab56bf","8c7ac3a442","33998146da","0ccadca088","e35b1024a4","62c96a5234","ed1fb60224","dd1ba4ee29","7fed3470fa","ae4ccbf574","d12b79df2b","c4f2fbd1b1","56781537d7","938e6de01b","77aba8575f","eaebaf188b","ca6a80704e","c3df8ccd5e","c4f2fbd1b1","56781537d7","938e6de01b","77aba8575f","eaebaf188b","ca6a80704e","c3df8ccd5e","948c3a39f0","b344be3282","7b54b1b48c","caa22aad4d","beb1588f7f","26f4f7e1d8","6f80897ac4","6905f3604f","e567073804","0c5c146992","5b525ce6ed","b1737281ba","954f685217","1fb77a1e4c","bd29b884b3","16cf90942f","d4981e67ff","a3819b306a","4199fc174e","40ac4b2348","fc06c1692a","3b7fd17093","13582987e1","e19f4d1344","6eb69c6683","195be4c217","cad872c816","af47c2e105","31c1d79a72","612b3028e8","499813415c","3f3b9133af","0a1abb7414","e5fb398edc","550fa860fc","bde17a0ab7","c336014ad4","1d7ffb8040","d5cb4e090a","7021938dc6","1b08cdfb87","ea99096977","bcc0b7c8d9","3128f486cf","5420f9a306","279fd194dc","70a36c2806","b7bd72b4b7","d65ed1e9a1","9996359f67","bfb46c6635","c84173c0e0","3724221adf","30855c2f8b","1d4ddb0891","506a40f0da","caa1a78569","0a3ef63443","a70c8224af","b64e34a8df","42e31a6875","6eb7cbece3","c90f5b1107","637ec8391f","ebf2dafc6d","b26a8a8681","56bd143c6e","d05aace6ff","171855f499","4b9991f0f9","2423f360bb","08df5bb7f6","ae44912ebe","decf861dc7","397d02b267","88f3483b8d","f568a00256","4d707de6d7","82b09bb32b","a637140e92","ff8ff656e9","f1cf73a84c","760252fe41","67ea72b6b5","4ffe47634f","5b899e7b67","1b304b4758","9bee8bfe0d","b0182b138d","dd61d5d1e5","52ec062b8a","ef9b7e0001","53d059a4c3","0ee14e3852","293c27d0ad","c1700ff221","042ef7cc14","9f56cd79d3","ef9b7e0001","53d059a4c3","0ee14e3852","293c27d0ad","c1700ff221","042ef7cc14","9f56cd79d3","d05854b162","7110d17449","5f9a77dde1","45518446a2","f24c2a51ab","8ee6886a07","bc1869d883","8518c266e6","78be23e044","bef9a15328","77a22926c2","4817a0ae64","a9e9815986","3fe7c85122","8518c266e6","78be23e044","bef9a15328","77a22926c2","4817a0ae64","a9e9815986","3fe7c85122","0cf213889f","b7f0ac6a9c","78fe012198","57cc03b47c","a0fec86c52","a91c584d1a","62be265056","3e04329658","0d86d8af4f","e3de02c565","cffdb01fd9","df98830367","d55d362847","7162dd95b0","f85af997d7","1564cdf1a1","127bfe1537","03d128a231","1e0ef8015d","62de5b2437","75b63208c3","d9750f693a","c0e5a60886","c9bf822985","2aa31bbed7","16347af4b1","ad9a808548","ce2450c4d4","2966db1718","5ac2cbccb1","619b41c6c2","b6ad8aecc2","e895aa5a86","1382524b02","94b115ab94","aa3b844bca","338d75a53e","d81d1be2c6","0281c1276e","557a5a0ae7","b149c5a4e5","d77f097db4","bcffa6d2d5","38fec68104","2c3a77fbfd","fa5a0d5ee7","8a2e332e91","ab8e84c482","6ac7e773c0","5363693fe7","fc8d63861c","200e1142d2","f712f3aacd","8fbe03674d","f053eb488b","dfa8ed614a","b139b3f8be","5a4ac8d1bf","24e1e86ac0","a7402cf241","1ab4509974","fcb15c4b51","c128dec36b","64a5f62bea","bfe67b6734","546941417e","ca3a43f806","716c052cb6","05218c3a09","f1c588b6ef","64a5f62bea","bfe67b6734","546941417e","ca3a43f806","716c052cb6","05218c3a09","f1c588b6ef","841b1d2583","be78434d86","9594b591af","efaabb8a39","233da64811","9ac0686fd3","2b83846ccd","29a067f3b7","30cba49c44","1556aea6a7","78b63164c7","0fbf1bb858","9370d15e5d","cf5da3f580","d86c535936","30a599a750","c265a9f5e0","639c4322ec","415c5f3370","1ddc5dd60a","81a861f8d9","d86c535936","30a599a750","c265a9f5e0","639c4322ec","415c5f3370","1ddc5dd60a","81a861f8d9","cfa4e1ceb6","b43368b40a","e40b9466f7","130a2a9cb2","f34e6e953a","87a7c36035","1b788cb3d3","2d913b5fda","14cf2421df","97d7c6ea0f","b6c35c8232","d8dae6fd10","54ee624022","032ae919e7","3d7e128b19","16cd595d30","7da6cd9852","a4859b587c","23ac481fb8","9942707a94","7461159078","15f1ee1dfb","ab5ed281fc","df4266d9c6","2e9e639fcc","1777b538c9","5cbb32c753","f63ff73d44","85ed596ee0","82f3d90c43","ebae0dafe5","4c5b5c081b","aa6fb013c8","d3cf8ee2d0","803503e21a","83e6b8782a","96fbf8491a","9f77ce28bc","74e8a3bf98","2f6ed80232","39fe242f8f","a4972cb8ba","db0c2ba431","e3bf25ee53","b0baf50efa","ce08f82d7c","07732715bc","37907ecf26","2dc9961442","db0c2ba431","e3bf25ee53","b0baf50efa","ce08f82d7c","07732715bc","37907ecf26","2dc9961442","9729c917b7","a2e2b57e9d","7efde0cb7e","7d9864b019","3877e847d0","59e1e8121a","48cb990105","fcd0e256df","8a3ecba25b","858d7bfa52","377b52da4f","c809e45153","bc5fddd751","ed61541798","775be28601","a9f75c586e","9be7d1a916","84b3655782","6b20545ea0","92d751ba8c","1bf884be53","dc13dc0c88","d58add9b36","aadd94cc8c","069451b064","74bd3c257f","53d6ac325f","8d6b87c5bf","e547b13da1","991b7f706e","b31d80198f","79101c9c55","2f2419791e","34c775de0a","2467043043","6965db8479","962f65898d","a5a4080610","233bdcf2d9","47389de335","2d218b4130","96152c0c30","51334d8b47","fad21a32b4","5f9c3227ff","318fc2b634","a6c53f8dd9","ffcb06f0ed","85ed689313","15b377f573","936a88e8a4","706efbc848","7189a57d79","e7e87efbdf","12a723a321","753bbedba3","59126db2b8","b5ace0e22e","fdc06ae1a9","9463747f0f","4f46bae4bd","0543034d28","2a077677e2","505ec3546e","017ad4c276","565e1b84a0","176fc2e372","72e21a21a8","54be3b22dc","fe4518e7f5","505ec3546e","017ad4c276","565e1b84a0","176fc2e372","72e21a21a8","54be3b22dc","fe4518e7f5","7526bbf830","93dd02efa1","05b1086b23","b0a7276dda","c855784d99","cfb0a73bba","3ae9ff7503","bb8454d360","56a591b837","6408b6fb65","3fcf5d9269","40af263f69","618b53e9f4","a3b637c95f","46df6ad730","8b6c2ecc5c","37f3327585","5ee5c6e987","e094fd8603","269f2be244","0290d50adb","46df6ad730","8b6c2ecc5c","37f3327585","5ee5c6e987","e094fd8603","269f2be244","0290d50adb","7ba902807e","6faf9d4064","d65fc09f08","5f3b0ed992","286e28820e","8928e392d4","a63a72b787","12a2e78b43","19d1519039","f3681efd3a","bc8b672663","f94b8026da","f5edb154c9","a33044ddaf","bf2d527f61","67a6d5c055","d15eeefbec","521543d1fd","22cf659e49","7a01a097d6","22399f2909","bf2d527f61","67a6d5c055","d15eeefbec","521543d1fd","22cf659e49","7a01a097d6","22399f2909","462c5dcb31","954a83e4c9","29e05ab5fb","fc44042a19","26702b5c7e","849abacdc0","4b8d3cca13","431e04bd89","4f82211051","70ab53d5aa","72d8dc2ded","47468d8606","79374d3dd6","65247cb65b","a56d7eae57","6039e59aa8","eebe6fcdfa","225160298b","6e172968dc","c77cc34d1b","c7780d5b8a","dba229abca","a4be898b1e","2b51d22ac8","3b85a528ff","0c4b5741be","685388e686","a3d0f5aab8","dba229abca","a4be898b1e","2b51d22ac8","3b85a528ff","0c4b5741be","685388e686","a3d0f5aab8","041c885fe1","d838fcc4b4","648a6415b3","c875a3e0de","a96d15078b","e26f4b46f4","e69d6cfabc","cdd7066ab6","0f553faa8a","a675464f53","8c7bbc46b7","41a72c9e50","4d6785819b","448503a8fc","6f62053954","968c379462","75d88e3111","508b90c579","8bec24f7d6","e7ccb96a9f","11250503e8","c16e227ae3","d369b28d25","f3572029f2","38bec93db9","537f1be56f","6cc1b9d10e","fff44394ec","0119cd659a","44559ea854","ed449c5fc6","b208790165","4f879fc451","4f890c0ca4","5e6f8d5825","1838af2cd0","ad7d694b98","6872a0f1fd","5609d10874","07b2b239c1","a4e89e80ee","4971cb0dc2","6f62053954","968c379462","75d88e3111","508b90c579","8bec24f7d6","e7ccb96a9f","11250503e8","6f62053954","968c379462","75d88e3111","508b90c579","8bec24f7d6","e7ccb96a9f","11250503e8","efc92ac829","6cb552cf1c","a8fbeda979","3d5161ae91","ed370b906d","ab85c9ba21","cd291ac94f","d2d05428e3","03ee614a3c","7c32493e8b","7b6244c7ff","75a5043b6d","30c2621aef","2a61af7169","185ee67ccb","ab36faddd6","d760502058","bb1a92c2d1","72fcf90395","dbcd91f39b","c9332a9cbe","185ee67ccb","ab36faddd6","d760502058","bb1a92c2d1","72fcf90395","dbcd91f39b","c9332a9cbe","185ee67ccb","ab36faddd6","d760502058","bb1a92c2d1","72fcf90395","dbcd91f39b","c9332a9cbe","9a5afe8870","da5d9434df","fe05655aa8","caba960151","d2a5393ea3","9236dd503a","762f39f869","2c942afec5","90d51b02ec","09403e7c5a","d2c905bd94","26a3dd0506","73cd289128","1fe571c7df","2c942afec5","90d51b02ec","09403e7c5a","d2c905bd94","26a3dd0506","73cd289128","1fe571c7df","9e0fb328ea","cee252ae04","2e28e83647","7aefb89784","f3f54f53c8","ef1451e122","2c5c1ac03c","0c3ef9d5ee","fb89003421","3ab776d969","7467282f98","3ccaf6347f","a3a4a1371f","0924dd02aa","912c8c0325","b4cae86bd4","56023ad90d","cb02eede3b","ac414f2369","89be897a37","8faf082f88","912c8c0325","b4cae86bd4","56023ad90d","cb02eede3b","ac414f2369","89be897a37","8faf082f88","51434d63f2","177602aeb5","29e020dccb","ef03207dec","619aaa8506","d077031136","e404d654a2","22fb286252","bf351427c8","4c53581bb0","f41d126f26","4a82575e41","da53081b3e","87ce999cca","7bf7747b66","4a37db338f","feb790141a","7da0ca6713","94cfa2f071","56444be198","8b688d5415","fe27d3a991","d70ee145ff","0b4d31e8cd","f560806612","ed6c1d9587","4b71ca6adf","6cb779b000","26d91dd554","8abbe28434","42679e2e49","49db24c617","d3fc1acd63","a22550d68e","a422d2cca3","c7d3dd9576","6d6b3d2364","b7269135ec","6ab952655c","1272560197","3b41fb8b30","c124e12642","480d69debd","6abc93df44","5d3f5de2b3","07deb810f5","c8e1d737be","82e42c3641","2799d790e8","b7d8ea129b","edc9144519","5b0b98364e","2816db0ac0","680a1e3536","3a6a9972e0","3a6daf8234","fe27d3a991","d70ee145ff","0b4d31e8cd","f560806612","ed6c1d9587","4b71ca6adf","6cb779b000","20748967a3","70c5506dbe","70852dc04a","0a59beefed","26f7602942","f52e459374","2d68051ce7","571ab743bd","554bf91c17","d53a08d0ea","502ac91679","319c612e17","b89628c43f","a5fb1c076c","a671f47633","155db12230","0bf2a12ae0","a7c8edbde4","3948549727","e0ed55fb5b","460d6e922c","6d87529937","9fe070a6aa","e565ccfbe3","61cd365c5e","c66aced1a9","2c9afd856b","2753aa4472","a2c18e2a01","09f9615892","eb3035e6c4","2b8da59bd9","848d8f17eb","29f2999e26","e305fcdf6c","a2c18e2a01","09f9615892","eb3035e6c4","2b8da59bd9","848d8f17eb","29f2999e26","e305fcdf6c","b54a999031","43d83ae6a4","efb003c753","0f97b65b33","7378c72f53","9e4f2e535a","d45b576d26","a75a16f173","820726c4be","2bf472959e","3f7e7bf8ed","bde28ebb34","e028f2b100","eea9b8f8bd","37c0e6b724","35725b2486","c7423be7a1","34a00d61a9","a8c5471cd8","129a33fa19","d07ee7d054","cab8d05648","2be576ac60","9949c7a56d","7f74671ad5","77d36dd6a0","d31ae2ae70","dbb285a7bf","d2f134f005","43e16fb0a3","650396b358","7bf9483e00","9054961c8b","e19163a51e","95405da5ed","e2a5249bde","5d96862a65","d3559aa413","dd079b60c1","ec8219889c","85c55e9c61","d51a147320","340f481263","e80feef568","9407793c53","5c4b1cce37","eae9c65974","eb5c261ada","10768861e8","8109055431","2aeeb0e0f5","801aaae7c3","57dbf1f42d","29d72fd338","2768b93705","04b920ae02","ab92906b58","603457dbfa","a9a2c586b2","1484dfef6d","625f1feb5a","0452420b9c","906cda7505","834b474d43","ad3ee953b5","a263193399","d9aba46241","f13eda2f15","6766994727","f64e7acf6d","fa5bb1b470","5a3166f271","fd0d831ecb","a8bafdd143","d94dc975fd","2cd885e50c","068b7f4326","7d04b1a201","d00faef97a","c1f2f33223","2334695843","1df021a488","55dd15b735","afd14d1b06","712c27e48a","2c6fb1f5c6","1858d38306","44577e6b39","0a3aacb9b5","510c3b4966","db1be4342f","1ab763274a","2c44ce1de9","b90bae83b1","39eb7599e5","6f5bac9176","38c94cca0c","66d065b9d0","67bee6fe81","aa80a43d46","44c19b6c2c","e7ca22ac05","7d538f8d89","0d60045797","3d1578045b","030432b46b","4fc484b155","c47a50cb04","1cffeb38a5","abef1fe550","09d8788971","6009ef5220","030432b46b","4fc484b155","c47a50cb04","1cffeb38a5","abef1fe550","09d8788971","6009ef5220","51cb6445c8","0951ac09b4","401a597ac3","d3690a7431","c5645b71d6","7db18f6620","86be3731a8","ee50b6191e","98b450978d","403120acb1","44214648a8","007ce53d00","0170071526","a2edeca7c2","593ff79d8d","8418399855","aa8adf5f33","52e08dd591","bfa3cb495b","260fc219a1","5e701058c7","949cbd76ce","b9ec51cf17","20b1e8cc19","fff45e7832","b006ed36e4","df11fca039","9647e2b79b","8d34c4440f","c18f1ba677","c5bf7372de","ad42a957ca","bc536e4c08","12a16f5b92","9265f3b5ec","e1cf8c3208","98109b1310","e00c5ebda9","a1b16d7c5a","31129d1e93","7844a3df47","4590c9fad9","e31e21437e","7b91bc5873","fe3f5cd7c9","e761634fde","de96d15dd6","f584368ac6","640b7517be","6bfe1e9f5a","95bc303f38","41869b0088","48fe42c12b","2f92ca9228","5f725d1eba","93161cf50f","79d7d8cf1d","d61559ad06","2d18217480","664acd1f68","2b18dd1da8","6179b2b5bd","47ec1c1fd9","79d7d8cf1d","d61559ad06","2d18217480","664acd1f68","2b18dd1da8","6179b2b5bd","47ec1c1fd9","cd0e1bb4c9","fdbaa0c1ff","33e2feb3dd","90bf00703a","97d909ead7","1bfcef0614","74e2d90262","45e7b7f542","d3818cb509","dc1562bdf4","245b7e6e8c","9c9a74bb80","22bf82df1e","a043e784fa","c02fde7d3b","8f577183c4","aef5c11221","ebb0dea240","757d0cf852","5f3a735aaa","8e2ecfd05f","c02fde7d3b","8f577183c4","aef5c11221","ebb0dea240","757d0cf852","5f3a735aaa","8e2ecfd05f","1543b0892d","5c281eef31","5c7e04a45f","aa72e07753","fb75f625ce","4a49c5baa1","936c34248d","6d49069bbe","d708d636bb","e4592bc540","24f24e608a","12c0d6928c","762de80874","65699aef09","210151ff05","0debbe5021","28637454d9","267c807c08","424bedc8f1","0024e72c02","183b3630af","210151ff05","0debbe5021","28637454d9","267c807c08","424bedc8f1","0024e72c02","183b3630af","3081cfc78d","c35e04dcca","4313f54a5b","78a82560ee","a2a4678c4e","65c736a3bd","d6bb98dce0","eea135cd08","70e14d7f43","514e2ff498","674711f7b8","e74104bd8b","75925d34bd","8364db8ff0","eea135cd08","70e14d7f43","514e2ff498","674711f7b8","e74104bd8b","75925d34bd","8364db8ff0","45cc3882bb","db6bdec71b","78448234b5","dcd366011e","39d77c3128","971e56be67","4ad56ede64","45cc3882bb","db6bdec71b","78448234b5","dcd366011e","39d77c3128","971e56be67","4ad56ede64","a3140128d5","59c05ac528","6105f1c3c9","606b3a4b6f","78f673d3a9","874014cb6b","2960e13458","dcd267b109","47c1974902","35c565b12b","3d0802dfe6","6c60548f73","7516c824a5","1a81836fcd","dcd267b109","47c1974902","35c565b12b","3d0802dfe6","6c60548f73","7516c824a5","1a81836fcd","5da3f74da6","831efdd1ac","ef30a17b6d","d416a97434","5392cdfd88","af476d66b3","93426be562","19a51060dd","8ecfd191cd","db5f6014cc","68b40fca3e","5acb5733c0","53222787a6","3cd22e45a9","75e287e376","9137088ffd","26838d555e","66bbb0489a","7a27aa79a8","a8d2b7e65e","757693924c","809d548a79","36271025b6","02a0628cce","3249be71b6","89623cef1f","f448edbbda","05324bf0e4","75e287e376","9137088ffd","26838d555e","66bbb0489a","7a27aa79a8","a8d2b7e65e","757693924c","510ab56c1f","0e19bc6695","f880206ee5","2676431cb6","1e10b84246","9489c840d5","521db62efb","67cfb3e66e","99ef303c85","cb7a1050cc","09eb76d389","387320362f","836d63836d","87db9c193b","66f6e4c85b","ee91e5d995","79c0340f33","45ca00bbba","7ea6484c04","9a05d7ecbb","8438b8bb6f","e230190ee1","ac2e8083f8","bf21b05f01","37236490c9","0cd967eb7e","d38901ad7c","9c7776fb8f","e230190ee1","ac2e8083f8","bf21b05f01","37236490c9","0cd967eb7e","d38901ad7c","9c7776fb8f","d581f14aac","8a0c1f5aaf","81da0bc742","ba1d82326b","e9bc9f6d0c","de3af4b4a8","555c1ec803","050262d40d","4f1d425f3d","72f7a42114","0cdc333e05","78114770e2","5310792db5","992f593d81","9a6901771c","411dc7c416","1449dbd384","a4ef5d8b03","478f3cb5ea","6e7da1b1c0","6aa0289b31","df9a7fbda7","6d0e7b6390","ea5cd55cb6","53d6f8b7f7","81d78bea78","f27bc78ffe","889585613a","ca59ad0c68","fe0acef53a","b4113e098f","37ee24d630","7c75fbea6e","66ae3e9c05","d3bb594749","ca59ad0c68","fe0acef53a","b4113e098f","37ee24d630","7c75fbea6e","66ae3e9c05","d3bb594749","34f1bd0766","eaf179c7ed","7427f1f135","adfd7b288d","59a7630706","46c9fbce1d","96a04f9aab","fac8dba431","aba380bd47","e809014275","f4391dfb04","9aa6888a0e","7a66ecb093","94aa7c9715","f78eee391d","8a579051f5","25e5155e5b","8018f96121","49e79a9529","2f55de11d5","e9ae14347a","fc129cdf4a","872410cdaf","ec46b03fe4","4ad07daf62","55797a9670","f3f2fb01ed","ac08a56b90","65359a6901","e5a2cc1e20","c46ba96b34","0cc0d576a4","5157c4a6eb","07129915ef","d9c89e58bb","65359a6901","e5a2cc1e20","c46ba96b34","0cc0d576a4","5157c4a6eb","07129915ef","d9c89e58bb","442210ce51","021166e61f","0a3f5506a0","12fcba79ad","43b21793bc","3e7db54189","f6cea27245","442210ce51","021166e61f","0a3f5506a0","12fcba79ad","43b21793bc","3e7db54189","f6cea27245","e1915ccae8","d3acb198d6","850063c247","0383a78782","1c07bae8cd","3c81f55195","50a2a84a38","6cab1f30d5","6d57755216","89e4057dba","b3af8a9c65","94825406e4","ffa906cbe2","d635d4236c","56b59a8473","671ee98faa","0402fd9c63","22bc20b9b5","2c28c72bf4","e63b4ee41f","f0eeaed740","f4ac667996","0458fe3ffc","de6e6dd475","ef325816d9","338863eb8c","c692305e07","c9f7ce11f9","6ef1f1b2f7","226ff001fd","3e3ab14ba8","fa63c81772","b25060c271","de208a2835","7c4372781e","c366481a19","a6bc212fc2","3b0c1e9ef9","32776544b3","ee0b2597b0","65ffc06db1","a5dab8cc13","c366481a19","a6bc212fc2","3b0c1e9ef9","32776544b3","ee0b2597b0","65ffc06db1","a5dab8cc13","6311ddd9af","d5309e5e50","9413d1d5ab","2401b7964c","e05ecb38a3","a5093859b8","c20197642f","3c4e108def","bca2c21d87","7b61246993","cd28279281","3947b377ce","333c3c1926","38971b289c","3c4e108def","bca2c21d87","7b61246993","cd28279281","3947b377ce","333c3c1926","38971b289c","f7bec58f64","ed8dedc491","0fe5b3598d","4a895686b2","9346def4a7","bfdd99533a","793d5cbd39","99aaa18dc4","c93325fa2d","40fe83fe1f","3c5bf5fb8f","1fd81ff9bb","f4895162db","a4c3f6b88f","9ed510b3b5","8d553db8c9","6e12549f55","ed045df945","dee72c158b","0c593dbac1","a204da61e2","969bdcbf3b","c65cafc5b4","bc2ceb7f91","d6d4b98188","89df164ecd","8bbb2310cc","b706723eb0","4caad5c8b5","82339ce7bc","6e459d090e","75f8676fbc","dd96d4684d","ff39f8d5b0","93c47d48d6","7c809c263b","f6202619e5","d1d8278472","eb9f66d146","e3e8b1584b","526f1ee9db","7e4a7fb871","69ab1e1412","262f09359b","7bb8824720","97707fd874","5f3af23a13","8d85b63345","560d825f2b","26b5cb3698","3a27a2e041","fef9197595","30f2acb313","5faf5ab9a8","9f2f561128","93bf922f08","7c809c263b","f6202619e5","d1d8278472","eb9f66d146","e3e8b1584b","526f1ee9db","7e4a7fb871","7c809c263b","f6202619e5","d1d8278472","eb9f66d146","e3e8b1584b","526f1ee9db","7e4a7fb871","1d000696e1","715f84ba61","ce3508a814","c685eac206","afd4227317","4cc44e2def","93e9cdccb4","9691ac83e3","c0178108c4","e9ea14f8ee","ff4cfb7113","9716409e5b","99156fa842","a455f41958","89336eb271","1d4979ea58","43370623c8","78530601bc","4ae8976fe6","185810a921","41e0afc850","e2bb36d00b","640937d770","0381eb98cf","a8c09f7bb1","706d2ff5ab","c52de44043","46367ff114","3593d9ac77","5f5a4c5458","acc6fb527f","d87d760503","4b84bc7170","5ccbdc9368","e4a5df3f1b","219c40f4de","6b627a94cb","d5d3e38c3f","4a030b868d","0a8e21f0c7","3daa787b4e","b39fa04a38","678aed5094","1d7ec38a0e","2c94f36988","422dde6b5a","7cea8071b9","edb77714fa","436471ad4f","678aed5094","1d7ec38a0e","2c94f36988","422dde6b5a","7cea8071b9","edb77714fa","436471ad4f","6372613ecc","7e8b71bf84","557e45a293","d8a441b44b","dd98bdc781","198046354e","54f66745ae","80eea1bfc6","27ed5d03f5","d829abe795","4733c17fc1","c981efd7f2","e792e6e439","b785cce5d2","0e17f84851","8b3569b8a6","288c3f24b9","bce0016894","ec05b1eff6","fa2a37c70e","15c0870b23","a14d1a0ca6","077162f9d3","0263b44a4e","5fdadf13b9","96e9df4935","d92968f657","0c0f8952d6","2eb246c4b4","7306f19102","1664f884ce","c5bfb3b71f","91c432e7bf","13432c5129","31d6844ee9","5a385a4559","684dfe8a1b","e68fce7dd3","e3b5dcfa1b","62790c0f81","22ead61282","5f0ebe595b","96d2e348aa","5c745e4952","ccc2ee3c94","0c64ea6c2c","c515f3ca8e","38f7e61a14","887691be09","ba5da5aa7a","7aebf6c965","97da970e0a","6280fb905f","3b8e047fed","7f4aa43af6","4d9196f9df","a28a575a4c","2b9d01b8b6","067590c7b2","de7a090be0","6bc48db4d9","f732940e86","00ce7ace4c","6372613ecc","7e8b71bf84","557e45a293","d8a441b44b","dd98bdc781","198046354e","54f66745ae","ffe2d12db3","3459b324d4","d9ac487006","c83d5ae078","9c981507cd","2359bdd5e7","e03cc167b0","08b1d6d2b6","b4f2b99d40","7e38017e86","ea446fd753","eb170cac28","431f66b590","f679fcac1a","cd9fef00f6","3e916bb60e","e1d825e4a5","91ef5f949a","cb8904cfc0","a1fd6df5a5","e48435f61c","654226f68a","4a03e5f2cc","b74dfcc183","cc432f20fc","5b5ca03d8a","cfede9144e","20900a7063","ad3f594c77","8142d6182d","ae890bdb22","3ddff67cee","378ae88eae","517a217b22","39de99143f","d2913bb0af","b0b8fead22","dd1e780b30","22a80d33c4","7cc324fff6","6e50476e25","fbf5d9dc53","161ec8fd7d","ec28baef1e","d215f23ee6","709b5a8acb","b09e1e4d1e","2fb465c86a","83afdb9ad6","331f31b2df","4bdbe1b0a8","e2082dd664","fa8d488846","fae79573e4","e240f1e669","582bc4757d","9fcbb2f48c","222069e744","646dcdecab","b2c76b2e84","0fd56319fd","82ffb1bfac","4c4b9f863c","47d2192cab","542f99a904","fa29fb0102","738d8a68b5","2307001cdf","8c6923b68c","324f706202","47d2192cab","542f99a904","fa29fb0102","738d8a68b5","2307001cdf","8c6923b68c","324f706202","60b9e24dcf","09f94cf0d5","91aa46f1e1","2a159840c8","ed8dda8240","dda6d47872","32f37ced9e","8fc5a2785b","b0ae66d635","f08e61f8d0","e20ca5b307","85a8a4bcc4","b93afd73a5","85688b22d2","e8eb85f671","c137c8b3c6","a02523541b","74c5967acf","1f38d5610c","8f7717ce75","7bfce60b9a","e8eb85f671","c137c8b3c6","a02523541b","74c5967acf","1f38d5610c","8f7717ce75","7bfce60b9a","f8c07b5ab8","5f39c4512f","7ab279e717","ffaec5e70f","f9d7bf934e","790b89ad08","008c78d5e8","a984c28a80","9e861b7e0d","f6b485e78f","bd5192c1b8","7bb4e2a6d8","8f6f6d5c55","e08c784f96","c3b7da2662","addf9dc908","4d8e3c961a","7e20d1c6df","0a5d82da6f","e335217fa2","edc952e46d","c3b7da2662","addf9dc908","4d8e3c961a","7e20d1c6df","0a5d82da6f","e335217fa2","edc952e46d","67a06b83d2","04829dd4de","9b6fa31240","5a342a892c","47399cad59","c2173b8610","81f24b051c","fc60aa028c","c986e03208","a279681d4c","1be044666d","b03b294a63","d92815a01e","db3be15ba8","1e02244f9e","888d47f5d1","704704a9d8","f85242a528","be75f7fb7d","b969c31c66","e9b1ff71fc","877bfeebc7","a1828b2b01","7ad3220da8","44c9047696","c51e8857ec","92cf9571a3","f25540083e","33c39c7902","488b818c94","c5daf34bf8","19bf1aeaaf","d5cfa8d921","188d7c679a","5cbdfe8d62","33c39c7902","488b818c94","c5daf34bf8","19bf1aeaaf","d5cfa8d921","188d7c679a","5cbdfe8d62","704631063c","10325dcfc1","70b4915bac","fce643e282","7ddc6e9c20","46b0696aa1","6b8f74c698","aca0d356d8","edf8ba84d1","78422d3f2a","135b3aab95","425d1370ed","c08960c422","acc232c85e","aca0d356d8","edf8ba84d1","78422d3f2a","135b3aab95","425d1370ed","c08960c422","acc232c85e","98b1615dd4","08e8ee7e85","8b8c840877","bbffa863b0","bdefa01b15","fe24af8c0e","9c2b8601fa","baaddd571d","f0c8bfb162","6dcc230234","87f7ea5944","802e4e2e3d","4bf0a94332","ca6bba1485","c56f190827","f9fb7d611b","dfdcbef88c","faebdedba5","62403cd9b6","00fa82b011","045e4a0265","ac8463e943","77a1699aa8","5853f565a0","171b97d239","97fc615063","ad327e288a","432aeec623","ee02843062","179f32090d","d39a52febd","93cff489bb","2f465f5888","b6a722e4df","258de295ec","c6f33a61b3","252fd5b999","88a054a982","cdab486db5","def568c74c","66b7ce5cbd","042eb0d773","907c98f0ff","c5feb58374","5da8a3d79d","143b4f1535","5fe748d045","6709750810","8f993fcdc5","6179ab1967","5dc59aac05","4cfc55258f","d62dc8a7e0","b683810eec","948f40ec73","6e2582133c","65fbbf105a","4117639ca4","ce0c4292dd","c11078c2f3","7a7fcdf9d7","07e56efbf5","140b0a3e2c","127dc007f8","07090fd1a2","b7bd5d0fed","adb010526e","9837635d66","e1b92d7dbd","2323afa53e","127dc007f8","07090fd1a2","b7bd5d0fed","adb010526e","9837635d66","e1b92d7dbd","2323afa53e","5a0fa90a09","8c9e36689e","88f07bd116","e6d52dc72f","7ecf990370","c68bf249c4","a766a9bdc6","2a7ddfc983","1a213994d9","f08db807ee","941157edc9","aa8624c6f2","135981b474","26a4d76174","18bddd59de","ac044fd3c2","173e843a3a","09cba7e906","f6487503e5","d8004652a0","c907dd9bc7","cb4baa21d5","78b23520ac","da62c6a518","d52d7056d0","36b9d09f15","beadef732a","219edec441","c0ca47ca29","6e6708421b","e0be11bc6d","fdb59f1208","5de973b348","c3ec77958f","4702f0b08a","cc324922d3","076273d8a5","06d2609c0a","90bafbf280","d1150c0761","37a877237f","9febb88a3b","18bddd59de","ac044fd3c2","173e843a3a","09cba7e906","f6487503e5","d8004652a0","c907dd9bc7","e144d5deb9","91ac920294","4541a66bf0","f9f44a6f13","bd01814361","09b7dacc6d","deecf048c2","e144d5deb9","91ac920294","4541a66bf0","f9f44a6f13","bd01814361","09b7dacc6d","deecf048c2","cc00138675","fc31f446b5","b3fbd13f78","f00e8ec548","a693d4602a","f8a785d107","a7d05f0a7b","cc00138675","fc31f446b5","b3fbd13f78","f00e8ec548","a693d4602a","f8a785d107","a7d05f0a7b","54fb4e2a0b","4cb2129f35","57c50d0042","fea6d08537","4885e729cd","88d661ef1b","8b84ccb263","92e3a63d4b","52bb84651b","caa3a88a53","2d459f9a59","af461c2aa8","82e3114f5f","ad474eebae","c5df8e26d2","8743c1cef7","d02520043e","9f821302d6","c5260d4efe","56e9abdfff","1615bd6ae0","c5df8e26d2","8743c1cef7","d02520043e","9f821302d6","c5260d4efe","56e9abdfff","1615bd6ae0","817f533393","fc2c0de52e","427ab0f667","c062432b56","0bd55f0973","da9b9c6d68","37530a760f","c4cd2b5402","ac3d8796ac","cdb923fb97","7112fecb59","9d08067264","92780ae72a","b3fd8ec48e","c4cd2b5402","ac3d8796ac","cdb923fb97","7112fecb59","9d08067264","92780ae72a","b3fd8ec48e","c4cd2b5402","ac3d8796ac","cdb923fb97","7112fecb59","9d08067264","92780ae72a","b3fd8ec48e","a8e4a7537e","76fea38597","dc200c0f64","250153463f","d6230b8dab","e299263e2d","72070cc1d5","787aaea01a","6621cfad3b","da5d055e9d","9a64d333bc","b19c95c7ed","6bd3f9d629","ef46ef6375","7a29b2b14f","c3827d0348","e326a4a0db","49391e8d33","f3869784eb","f246f8e259","2881cf6fb1","2b984132be","b4aec944ae","a13349f4ed","0ed5540174","83370056c5","ede9d85465","3d66eb6ad6","826c7ce9e8","ebc1435116","3d6ad796ef","fa6211b61c","4ae5016d71","3f7500643e","9ea60d785e","d5d9e2a9f3","3f96a6368f","4ac2abf618","321f333953","4a84496b98","3ca654c359","fc963b65c0","ab175ca4cd","e11e5e5650","71a8e3b5db","b0bd201a6b","7dadeb1627","bb6f4de27c","0b235985f2","ab175ca4cd","e11e5e5650","71a8e3b5db","b0bd201a6b","7dadeb1627","bb6f4de27c","0b235985f2","4d852abe3a","3045a5d943","17dc863aa4","11efd6d121","b2c474b695","686400828c","de81d47ad3","55fdce9f88","9278ebc7f6","5b9c527238","8894981dd3","8f210f12af","66daa68bb4","cad298674d","55fdce9f88","9278ebc7f6","5b9c527238","8894981dd3","8f210f12af","66daa68bb4","cad298674d","efdf350096","955e215f7c","cf490d2fef","204aaa07c1","b81c639cd9","1fe65473d5","ff85caad4a","ee89feeaaf","bc4c22bdd6","9d27653e43","833253139b","0761375dd4","7bb19a85da","5a5dfa90c2","ee89feeaaf","bc4c22bdd6","9d27653e43","833253139b","0761375dd4","7bb19a85da","5a5dfa90c2","37744774e6","086551db37","d3baac374b","87fd6d2eb8","b44f582b8b","a2979fec82","967737aca6","ee89feeaaf","bc4c22bdd6","9d27653e43","833253139b","0761375dd4","7bb19a85da","5a5dfa90c2","df3d4e32c9","aab1a2a48e","0f8ffc9970","ae7eda9d5a","06694685d1","b26d3ee638","a7f81ce289","df3d4e32c9","aab1a2a48e","0f8ffc9970","ae7eda9d5a","06694685d1","b26d3ee638","a7f81ce289","92ed61579a","fda50304e5","128e42ddb7","66a546bc2a","36dd70b47e","292b8b555d","497f1db262","92ed61579a","fda50304e5","128e42ddb7","66a546bc2a","36dd70b47e","292b8b555d","497f1db262","21ae359b42","5c1e0f895d","2fdccc2353","c14e250634","a88db8768b","18dece6a70","531f1cf2fc","21ae359b42","5c1e0f895d","2fdccc2353","c14e250634","a88db8768b","18dece6a70","531f1cf2fc","9a8d0af728","21f09893a8","75eb86d1b9","03859b1662","f0170e8691","64ba82ce3f","42fd3aa3d6","96208e5810","5db0e77b3a","dfa138ca0e","332cd5951a","9e22bde00e","7a8e44b106","cdfd6bb8bb","edc3740b8d","d85ceaeabf","6468f73c24","a3698a7459","10608f1e1c","b5260fc1e9","3567d39809","edc3740b8d","d85ceaeabf","6468f73c24","a3698a7459","10608f1e1c","b5260fc1e9","3567d39809","edc3740b8d","d85ceaeabf","6468f73c24","a3698a7459","10608f1e1c","b5260fc1e9","3567d39809","17d62372b9","f2a502a35a","f30bc69c4e","1fefc1bc90","ff19e0647b","b6666fef35","ab1c84ac8b","f22f32890a","f0b7f1652d","0e033722fd","e17eb12d8e","13f2f2ed77","ff6bb4c82a","34eac819e9","65dfbe1149","203d65ce17","bb8d803623","cc08b66e17","706f3f512a","4867037e46","fc41dcbf5d","17d62372b9","f2a502a35a","f30bc69c4e","1fefc1bc90","ff19e0647b","b6666fef35","ab1c84ac8b","e3d1dbd6c7","2bceb21325","2942fb4266","a893e8023d","752a50578a","ac81ddbaca","9612b3843a","5a95d24875","533f889ad0","478b2e12a2","11c68f4538","70e43f65a9","36b32c6d12","21ca7dbd9e","81571bbcc2","476ea1e36f","68a8fefbb7","6cd6c62035","1cd5d36e78","6e2f3413f0","6454d458ee","b9191c71e6","97f9b12837","859c9c9ecc","b5de4a3a9e","0d8b479603","b019e36ca3","4e63676541","0bd444151b","939da76c7d","16635da17a","09e248c145","b46be00fd3","8d8914a0fe","67fc3fe7cb","0bd444151b","939da76c7d","16635da17a","09e248c145","b46be00fd3","8d8914a0fe","67fc3fe7cb","fe7ad9862d","b43a85cab3","e7e33c680e","325403e532","161ea24a0a","ee1f11509d","5fa8ced04d","7816332754","c87b14937a","fd7477c65e","c376e6d3bb","0443ced658","a53e751b32","16ddeb2f3f","7816332754","c87b14937a","fd7477c65e","c376e6d3bb","0443ced658","a53e751b32","16ddeb2f3f","1fb8196592","1de007dd03","6cdf084263","104140e13f","090b6128bd","6b4e3acc42","0260041fd1","f6e95d2bf9","9596779e92","d2222c997c","93746aca4c","0ed1500e97","c3dbf14895","fe9b93bd66","08d38b8862","2a3d43b618","0a9ca5708e","111a7fa249","e8d15653da","1090a38873","7f839b4b92","ccecfc507e","acc8502d14","42c4e1554f","91a4926ee7","7efabb6100","33c566635a","f3d578b3ca","ff186466fd","55e96eac1c","5da7971186","d33d5c57c5","36c319a4a6","14150f3915","51cd1aeeb6","c253b2c9e7","ccab57ae9f","4682c4d3dd","bd3c9666ee","25972c335b","97e2bd442e","03a79589d2","4bb1432e44","9cb771eefb","cf6ff0b56d","3f7fb11fef","212aa590cc","96d77b1a4b","2e5fb465c3","4443cb5931","87b30ff778","720eafdf90","8d11f0dcf1","401458685c","2dff213f3b","1c97df0ad8","78c97eb1b5","886f601ac4","8e3403b1f0","4f4de333be","c66a12d6d7","28b56f289f","000e5afc37","f6e95d2bf9","9596779e92","d2222c997c","93746aca4c","0ed1500e97","c3dbf14895","fe9b93bd66","1ba42802ba","dcd0457d7a","3fcc77b4b1","0d102e8f85","d9b2f0de30","0e4ea5d4c0","22ba42eaf6","1ba42802ba","dcd0457d7a","3fcc77b4b1","0d102e8f85","d9b2f0de30","0e4ea5d4c0","22ba42eaf6","9ad5f0ad98","b4a6cf5ef6","371f157318","7f567f63d9","267c705d30","26a5a07305","5e44dd48b4","2d2897e34d","8dcf00badd","ae82700d42","5b5988d2f6","22c0a36c2f","8326bbf13a","2a10d37375","2d2897e34d","8dcf00badd","ae82700d42","5b5988d2f6","22c0a36c2f","8326bbf13a","2a10d37375","2d2897e34d","8dcf00badd","ae82700d42","5b5988d2f6","22c0a36c2f","8326bbf13a","2a10d37375","f3e6dadc59","ef549524ab","d0be099724","c6827700b9","84f96e89da","c33951bf6c","e78a74d2ec","405f9291f8","23a6725d21","49e3b037a7","a879ce60d9","d6999a5eb6","a959fc0dc5","b6fc164394","5ca3b5b285","a35cab3bd8","c20696c7b5","d3f1468ff6","de453a456f","6486b55928","fbb2270bfc","4de06659f1","61f28f5e84","d3307e01c8","5b419a4e46","f01b0a2e5d","77bde365d3","9a0e877c5c","5ca3b5b285","a35cab3bd8","c20696c7b5","d3f1468ff6","de453a456f","6486b55928","fbb2270bfc","7195750034","b0f7d2d0a8","97b6aac2e9","c84a9f1e6c","9635e786a0","593874c57e","1ddc836e67","a173a07f71","1b1e3bf3ff","866a41436b","c280b74f21","c95c857234","f84bb709fb","09743dc234","372865061e","4611384a59","34ff3102a2","25a3ee158f","974ea76bfe","8bb300b91e","e8e0cf01c7","8ab0570dd7","56a61bcaad","c6ad5903ad","a0df990d2a","0df284fc25","eaab2e12cf","db8fb0f7f0","335c8de804","e00f0b803e","84872daabc","538b4eddcc","ec95f1558e","137eefc095","15179af7ed","c1da848183","c54068eb33","2903d5dfee","8e031f0535","a27b4edc0f","1c8192ba5e","598725fbdb","1f7a11a060","87d9627f97","4077f08d61","fcc8895588","33102d1e54","f544a2db03","1649b2424e","335c8de804","e00f0b803e","84872daabc","538b4eddcc","ec95f1558e","137eefc095","15179af7ed","d9afaf7565","9b4cc0b168","ae9c245a87","c63348dcd7","1c8029ee6d","2dd95d4d96","93d50f56e0","d9afaf7565","9b4cc0b168","ae9c245a87","c63348dcd7","1c8029ee6d","2dd95d4d96","93d50f56e0","e113cc83c0","6875d45fea","23f5c4e054","6ff9790646","1d77081ef6","d752734ed7","6918a4cb6a","1132e9fe9d","1a2ea35e93","8ed25db18f","3ceea50fae","06a135135f","f669bae7d0","6ccf73cbff","1132e9fe9d","1a2ea35e93","8ed25db18f","3ceea50fae","06a135135f","f669bae7d0","6ccf73cbff","e74d78c4a8","2dcf13a133","2218d25163","480dd8cf91","0e25c78cb8","d6b6782efa","ec2960d7c6","e74d78c4a8","2dcf13a133","2218d25163","480dd8cf91","0e25c78cb8","d6b6782efa","ec2960d7c6","884ca64677","56c0beef93","519bf7f3ec","5602d032d5","45735e0a69","c219f5fde6","86036241d4","1d3dfbfb33","b04761d832","7387ef79dc","98cd3952f9","46a6328c17","7337ad3e29","76e08d551e","e74d78c4a8","2dcf13a133","2218d25163","480dd8cf91","0e25c78cb8","d6b6782efa","ec2960d7c6","c05c4d1cad","1ee6205122","96ca5ee12e","b18d8c16d5","e5776474c2","1aafc74cc2","18221396da","00bd71ac50","496db4b672","32cd8963f8","8665bd80b2","4a5bffb414","c8ad30b07e","689721b6b6","00bd71ac50","496db4b672","32cd8963f8","8665bd80b2","4a5bffb414","c8ad30b07e","689721b6b6","47cd52dbae","b51d396823","858a0bc497","80f581109f","0504be8bdc","a0c6fac59d","08fd885f0b","52ac238656","08f965d731","6af3e63466","67c68e1552","f0bea33854","01359ce71e","e8f253de5e","e74d78c4a8","2dcf13a133","2218d25163","480dd8cf91","0e25c78cb8","d6b6782efa","ec2960d7c6","306c3291a7","e92f503a66","8e8885b19b","26d8d59ac9","11f8614a8d","a7f241c001","a7fc235f2b","7683c86160","9b9ff25a26","d45ac9db23","10e8d68a22","e0c3c5cedc","2c6b15def1","2c7abf67c4","fe864b159a","89c3cc395d","a5984cfb3d","2ef77eaaa0","3ee9f7a803","39768d6fdb","8637e6918b","03d7df73b0","a04fb0c12b","6d6ff5e808","caa07c8724","2b2c0275f7","60f16886b1","bce523b9f4","03d7df73b0","a04fb0c12b","6d6ff5e808","caa07c8724","2b2c0275f7","60f16886b1","bce523b9f4","40f8bf73c9","63779b03b0","392d3cd60b","c54d916fb0","58cf54859d","097e296646","160ac2e5d1","b56040f541","077182c47a","2b0bdda341","9d5428a637","872ef84276","c48ff42dc7","bfd2329dc2","41a28f23f2","335bf40e6c","6d272053e5","62f9a492e7","531d16feb7","8928b23056","4c3ee466ad","0afb100584","5fb28a4c4d","68f78e8cac","535992225c","29583fa62b","0854a6b059","957f76a7d3","6cb9395fda","984ed8d558","f4f6153dd5","17e0dcf15a","2baebd817a","04c9fd772d","1ca4bbfa0b","6cb9395fda","984ed8d558","f4f6153dd5","17e0dcf15a","2baebd817a","04c9fd772d","1ca4bbfa0b","aa405ea687","cf0124ad4f","deca2d6f01","4dd480e77c","5504ce9de6","8c8ebc8f04","fc5dfc5b64","eec29ede7a","f9030d260d","c56037cf31","672772bd3b","df065f9783","e9e393f974","21cde6f000","77eff4262a","a822a88674","a0b5041af1","eb5f4441ca","d2dd1b7c64","9eb17bc069","ecc7a71d6a","81932a8721","ccb01b6fa8","f9b70b4f33","923bb5aba5","8f1738b197","457e1f5e24","8d7137596c","156b982f7d","b78db141a3","9686fcc7fe","dfe70a1d2d","465c7eb4ca","75e4a776c3","b37e36fb4a","497098b8d0","45b1d5695e","b5818f1e8e","ac7cf270e5","03700ae1dc","753759a1fd","4e27cb4e64","cddc68885f","1e4b057f59","2eb9b91208","6a3102e183","47a6ee9594","46232ad41a","1fd8719e61","77eff4262a","a822a88674","a0b5041af1","eb5f4441ca","d2dd1b7c64","9eb17bc069","ecc7a71d6a","77eff4262a","a822a88674","a0b5041af1","eb5f4441ca","d2dd1b7c64","9eb17bc069","ecc7a71d6a","9bc447d3b5","b879813ec7","fb52be9b0c","acede39883","3d1cd870a1","cdd4de50c8","018391e9be","53c310faf2","5e63c651d9","a303c6ef93","0e54d8b7c8","0696e9758f","ac4b12a116","d1f181b7a4","9bc447d3b5","b879813ec7","fb52be9b0c","acede39883","3d1cd870a1","cdd4de50c8","018391e9be","bdf6b9db28","0b8ad628ae","aea2d5619a","4daf5411e8","e7f8c6d470","a735f2d328","439e874c3b","842df4118a","8860a8d3ec","60c18ea101","4ec86b530b","7dbd8cd326","c1338327b3","9aa4d20bcb","bdf6b9db28","0b8ad628ae","aea2d5619a","4daf5411e8","e7f8c6d470","a735f2d328","439e874c3b","c84515b2b2","3b8d482bb4","11041aee1e","0fcea75713","b3ff80051c","c1552ece4a","b2cfa527ca","ef12943fcb","1bf334d19c","1a3f329620","ebe3b41035","ffbd499e22","85360e0036","c71980b6cb","effddbe136","3ab2bbdb9e","7f161e7fb7","9333e985ff","fda5287510","f91e3ff637","16637f3454","bb40a4b9bd","05b53e030c","7abb36ddf4","70851c42d2","a08b2820de","cd941d2453","204a67804f","20b34b158d","5fda49b2b6","8ff8515617","bafea53550","76dd1aa77c","70af5d490d","8add62846d","bb191f04ef","a376445fb1","0d43d9a2fe","b17cdf1947","6c20226c65","51b3b88a66","1f4673c015","351e545abb","06c60d7d64","888b91ea8b","eb030b9d16","cec33203bf","72ce0a41df","798b11dd6f","351e545abb","06c60d7d64","888b91ea8b","eb030b9d16","cec33203bf","72ce0a41df","798b11dd6f","5fa08d228b","ed4e1c6894","783c5d5ba2","072d486198","3b9caa454e","a485c4adac","bd3d0b46bb","28068774dd","3e5afc914d","2199c59f76","1d3e5a8d9b","2c8eb61971","d53161c674","7a82c4638a","49dc03c680","5bdec14663","04b872f79e","57bf34354f","542c4de20f","643e408714","54c54f20e6","3e1dda2578","3db413a518","4adc8e4ed0","1ac8e02742","a5c9872bf7","ca6e58bbab","fbbee6ae7f","f18e26d088","54bd94994f","1a0d7a644b","18537762cb","d98b9e1fea","c7098bfa0d","dacd407a83","c560079dea","e7d02a85c0","2d0416e490","29e9629347","d3a4acb5fd","0dc2183141","3eb5bed929","c560079dea","e7d02a85c0","2d0416e490","29e9629347","d3a4acb5fd","0dc2183141","3eb5bed929","c2d8f06ebb","1703965416","a1d691e320","3fa692f809","d85acac9b7","60692018d4","10f4b07da1","d1bb3fcebc","0c02d3f878","7e467a5cb2","691e4e4d74","63c843f159","85687379e8","26aa4aebad","d1bb3fcebc","0c02d3f878","7e467a5cb2","691e4e4d74","63c843f159","85687379e8","26aa4aebad","77ca78490f","643754dfc0","1b539cf64b","f339479c7c","14f1b0dbd2","369cbb54f4","736a20b2c9","ba652c01b1","190bc05c03","75f771c494","ed13d3af6c","2e76cdc425","a2ad05d30f","323af48f9a","078778380a","871b96e630","653a8c5639","fe9ae9d88a","b7ad880c8c","5dc2c57e00","939bdbea86","c10768cfd3","3c5ff6dea4","76b32af6c0","5aef86e761","6d90fe2250","55eb8dfc0b","2e9af01d71","11bedca118","3cac5d0c2e","ff709eac42","cc75e8b68d","eb66b42a0e","0a633f986a","b213701e79","c10768cfd3","3c5ff6dea4","76b32af6c0","5aef86e761","6d90fe2250","55eb8dfc0b","2e9af01d71","2206d03d83","f8c1f4459c","d9695ebf22","a9fec2b9be","0a4a2abc51","5b60f9ed78","684a6da4a2","b29e34136b","e347024785","19d8b8de3c","582866703b","ac25157f49","3e34f3058d","79043fc040","2206d03d83","f8c1f4459c","d9695ebf22","a9fec2b9be","0a4a2abc51","5b60f9ed78","684a6da4a2","2206d03d83","f8c1f4459c","d9695ebf22","a9fec2b9be","0a4a2abc51","5b60f9ed78","684a6da4a2","aa45b98a64","ebd7388be9","f480a6a645","ce1f1d80b5","3535ad117c","45a2b2c480","a8b730e7fe","13aaf8837b","6a1fc027e4","e525bac4bc","5dacda4de5","d130339b40","326f98ff53","bc1a089186","f3bffe435a","178b277b45","d54a519207","72022a49e0","92f43a7983","d30c59a59b","dd60427956","e69e3d4987","a7635af62b","86df6042d5","a7d9086ba1","cd4a2064b4","026cb6b8cf","bf8fff4a20","e69e3d4987","a7635af62b","86df6042d5","a7d9086ba1","cd4a2064b4","026cb6b8cf","bf8fff4a20","733dec7487","73e24a9ae9","18df818872","8dd327df80","9598e81ec8","324ecc1cc6","4d5d65ee38","83314e51cf","99bbaec08a","732402d4d4","4e254ee352","35e347577c","c6acfc2282","8dd0749bba","83314e51cf","99bbaec08a","732402d4d4","4e254ee352","35e347577c","c6acfc2282","8dd0749bba","0a7ae253f5","01738bec81","55b956f594","b95a035b5b","7695698776","f48a9cda94","4418370923","a83a277bec","f88c7ae91d","b3e942062b","34fd78433f","8f3a4301a4","236d2fea89","dfe0dedca1","49fdf35102","707124ddfb","d010a9c2a2","f635e10fd0","ee365071a8","9a73fbe13c","4af79bb7ab","8a8203dea0","8a182efdf1","ab52ae5ff7","2a295b2aa0","e93e4f60a3","bdd3e2fbb5","c18611f56c","1c00b31668","b15094d8cc","408c3037c1","c6acde08e0","984c53a3ed","c33dfdba03","0dfaab7e37","da349c0e06","f426128085","3e813a38ae","3ef20af68a","b52667812c","771b717e0b","46d7a4d31d","da349c0e06","f426128085","3e813a38ae","3ef20af68a","b52667812c","771b717e0b","46d7a4d31d","9513c9512e","9e81e19067","3798582378","99692dc5db","f16b23ba1d","9c8f6d177f","4936eb313b","2e7c22925b","082f5de2eb","93297ccb05","9aaf4b4a7e","7592530a8d","60bfcd858f","2773099f96","9513c9512e","9e81e19067","3798582378","99692dc5db","f16b23ba1d","9c8f6d177f","4936eb313b","8fd43cd961","b43a3c2fec","a63558e1bb","f424c96c52","0963a5cbc1","51d842db67","09b715585d","0c769dd977","755e6a0cf2","032569c413","735b32c88c","2eb7c3db48","a1ad518f4d","7544a6eefc","9417a28ed6","1c732df729","77734ca664","3fc7662510","d48a5b6826","f0102777a5","5ad1cf5f2c","ac08cd74dc","63f7757e25","a04d0d974b","7a2c8024e8","84bc1ed5f9","e14f76bdcd","0ac704ed7a","fa69b3d21e","d2539c2c3f","dd45ecfe93","8cf7ec0be8","597de9cc3f","6776bdfb26","d3acaf0be6","9513c9512e","9e81e19067","3798582378","99692dc5db","f16b23ba1d","9c8f6d177f","4936eb313b","652510cb1d","4d9c5a175f","d0a976c4e8","064b57eb39","0fd51e807b","f592c14ea8","0dcd7ca55d","a18bd888e8","8a911308d0","5db1eeb85e","a7fcf6404d","27c7665610","ec0d5c037b","85389bfc28","ff1e93376c","b95ef6787e","5016ad5171","79bd88c378","e0b4f503ca","f2c44b1c56","3021a35d76","f7c1cb887e","f4c8845960","7eb6a51793","bfa97b2e86","29ffacd89b","32bf2afb39","c4cefab96e","f7c1cb887e","f4c8845960","7eb6a51793","bfa97b2e86","29ffacd89b","32bf2afb39","c4cefab96e","59679c743d","0fade61a50","6f0ee8bf92","c2e6b632b4","df0b2fb416","e86a860d7a","71f051783e","7b10a50c82","cc081e3ec0","5eba8eef07","a0db79db14","71866ff3ca","9ab6286623","e3ba0529c5","a79504b8fd","39d7d4ab19","464efe7604","59de1be25b","e64a11446c","e645e019e3","89ca749d8e","2e6553682a","7c0297bc1b","5dd5d8c0f3","8748297a0f","15d9417129","e8756fe33f","a09f35b9d7","fc5785e72c","1fb5f8d381","bb2a8ba44a","071caf591c","cf6cab93c2","2ded5d276d","2d1ebaa8e2","3e70021b42","6176c37793","524fa404cd","8d1322101d","d9ca49a499","52d1fe1a48","d105d2d17b","3e70021b42","6176c37793","524fa404cd","8d1322101d","d9ca49a499","52d1fe1a48","d105d2d17b","25a332e3e3","a190ea874a","b8612735b2","8eaee5d651","b105744238","7129549278","355a835f7a","25a332e3e3","a190ea874a","b8612735b2","8eaee5d651","b105744238","7129549278","355a835f7a","cdd1dd2498","6e0f1dfb59","25ee5395be","6bce90f549","b4ceb70ad9","754e07e890","6438bd3e28","50aa742ae6","33cb739f6d","4dae893121","0cc7067eeb","5b6630b887","50e4783b19","130042c6e1","0acbd8c00a","eeb028429e","a3bd9588c5","f2c13d6bdc","c7be69a25a","148727fc15","ae6200e886","ecd80648bf","3e5a60ec61","6f103b7dd5","c611be9c9a","7dc19fb511","e77f3e149f","369c6938b1","638031844c","5b5138dd26","42651cd410","a4b2343316","1f0f9ba612","96ebbdb982","ebbcf00e85","638031844c","5b5138dd26","42651cd410","a4b2343316","1f0f9ba612","96ebbdb982","ebbcf00e85","8e4cb134f1","03ac7c7c76","aca8e5eb72","a8783397be","8c270993e6","3b55289319","e15818ef7c","015d4eaad7","2594400baf","a0f2d5375d","9fb13a185e","2d8bf30e51","8213f4a7fd","955843a73e","0380218c19","1c36cb9600","b1a25b8753","8aeba1d21f","496daa0250","e03f124a92","45ebdc2a0c","76595e2f70","d640d9a7be","c54a55575f","dcd8084e90","26372af820","cee6110659","a2758eae22","76595e2f70","d640d9a7be","c54a55575f","dcd8084e90","26372af820","cee6110659","a2758eae22","56cfa2abc3","f4d6bd89df","10ccdf47a6","61b460db53","84278e56b1","e1b8798af8","8a4877729a","dc7da607a4","8ec41ceb26","16a4b371a6","dccafbff7e","577cd8792f","5c5539b1e4","4b38b54b09","8cf5d5484f","3001c5cb90","10683a2fae","baf3ea722a","aea5f75ce9","60c85d807f","2934be30ba","b86736f097","4d5bf10a49","2b4766b6bf","313ba3ea7b","57a4fbcc4f","751f1766a6","9328a74276","8cf5d5484f","3001c5cb90","10683a2fae","baf3ea722a","aea5f75ce9","60c85d807f","2934be30ba","5ce01efd49","a7564e9f03","776e2edd8f","8945779221","fab4e7cee9","0ed5d98ddd","05a0ef1fdb","359a0d9621","48578df6b0","0fc2f6ce57","7ddc5fc89f","10af52baf7","352cd5b7ae","9d02b105e4","359a0d9621","48578df6b0","0fc2f6ce57","7ddc5fc89f","10af52baf7","352cd5b7ae","9d02b105e4","15d261e858","13ff543f5f","709f118aa6","1c7d056e34","e2b7ea0992","57a79e9d38","3c66bdc14b","1626f4dbb1","ef9c3eed6c","f8f044acf5","9c761f5763","9cd1c0e9b5","20e1f2f8ff","f422789363","67c2cf2ba5","72c33614a5","44b930f3a4","d1b4cc87ae","087e9dbe2c","b2c1fd5f2d","dd981f1d14","b4514b03ea","41c03d33a3","1a8258f535","5cae017abb","fa095bea01","f0f24a0fa6","d753da2ae0","7b5ae9dbdc","39605dc32c","0b14f63fa6","cb96ff6d1c","766a009c44","c292fad88a","a02342679f","bd9e38957d","cd320e9aa1","a15a6fb145","fcf0f49144","91effde266","21bce26cf7","3ce7c24b6b","72b2f5e9c9","c5e3b27a5a","1fbf13ddb8","b5d79c6152","ea089af7ee","007dbe9082","77a1203264","1552c57d16","94639bf0dd","1b79d60388","a2157ca893","a25d3e36ed","183510c57f","6e09321f01","539493cb75","f3277127d0","39ad22433c","32d2ad6b0d","c52293a837","9c192e5b79","82af3d1127","a7526511b6","478f974d15","a14ccaccef","847f11e1e6","4374db4865","122779d2a0","4ec0138ecb","a7526511b6","478f974d15","a14ccaccef","847f11e1e6","4374db4865","122779d2a0","4ec0138ecb","0466084ffa","6c98039e8d","deb0fd8405","cec6a18c4c","529742fa71","6c339cb740","533d376942","0466084ffa","6c98039e8d","deb0fd8405","cec6a18c4c","529742fa71","6c339cb740","533d376942","d4a443ba19","c80381c559","32720a7fe3","7b95f05201","39f53fe410","f2af4671b0","69ff50feac","aa340ff631","3e3e9e937f","b0a948dfa2","013e2fb29b","bcad953d38","23290f667a","3dffc1836e","07d266e5ea","1b1ade26ba","8ab4c1b9e7","e65955ae7e","41bb957585","ce34d09638","883f8c729e","25d0f69037","584aa3eaba","f93151bb9c","21e9a75ec4","8116af7752","2c582d8439","1479a5a7ad","fae9071c03","43c72441ef","e46051a4dd","e718613519","719199d5f5","4327d28356","611abe7a3d","0aeda36f3e","bc472b1782","7b9b303ce2","e50b67bdac","21431010ef","c05cb32123","4712551bf5","94bf10b80e","91ad0e99ee","fce3117a3f","59eb4062fa","a72d125807","2780e53cb3","88f9480d2d","94bf10b80e","91ad0e99ee","fce3117a3f","59eb4062fa","a72d125807","2780e53cb3","88f9480d2d"]}
```
