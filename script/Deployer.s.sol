// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/FighterFarm.sol";
import "../src/AiArenaHelper.sol";
import "../src/GameItems.sol";
import "../src/VoltageManager.sol";
import "../src/RankedBattle.sol";
import "../src/MergingPool.sol";
import "../src/Neuron.sol";
import "../src/StakeAtRisk.sol";
// import "../src/TeamGame.sol";

contract DeployerScript is Script {
    address public immutable contributorAddress = 0xE046ed5552d20381F9F8d448D2C20085b22Ffb35;
    address public immutable treasuryAddress = 0xE046ed5552d20381F9F8d448D2C20085b22Ffb35;
    address public immutable gameServerAddress = 0x7C0a2BAd62C664076eFE14b7f2d90BF6Fd3a6F6C;
    address public immutable backendAddress = 0x22F4441ad6DbD602dFdE5Cd8A38F6CAdE68860b0;
    address[2] public adminAddresses =
        [0xb2B2d81CD161c198C81072091EEae09b7bBcCb40, 0x91832Bc473daB70e9490cFC2c268e0Ab293f01d5];

    uint8[][] public probabilities;

    function getProb() public {
        probabilities.push([13, 7, 7, 13, 10, 13, 13, 10, 10, 4]);
        probabilities.push([15, 15, 10, 7, 7, 15, 7, 10, 10, 4]);
        probabilities.push([15, 15, 7, 4, 10, 10, 15, 10, 7, 7]);
        probabilities.push([15, 7, 7, 10, 15, 4, 10, 10, 7, 15]);
        probabilities.push([15, 10, 10, 7, 15, 10, 7, 15, 7, 4]);
        probabilities.push([15, 15, 4, 10, 7, 7, 15, 10, 7, 10]);
    }

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        console.log("deployerAddress", deployerAddress);
        getProb();

        vm.startBroadcast(deployerPrivateKey);

        // Deploying Contracts -------------------
        FighterFarm fighterFarm = new FighterFarm(deployerAddress, backendAddress, deployerAddress);
        AiArenaHelper aiArenaHelper = new AiArenaHelper(probabilities);
        GameItems gameItems = new GameItems(deployerAddress, treasuryAddress);
        VoltageManager voltageManager = new VoltageManager(deployerAddress, address(gameItems));
        RankedBattle rankedBattle =
            new RankedBattle(deployerAddress, gameServerAddress, address(fighterFarm), address(voltageManager));
        MergingPool mergingPool = new MergingPool(deployerAddress, address(rankedBattle), address(fighterFarm));
        Neuron neuron = new Neuron(deployerAddress, treasuryAddress, contributorAddress);
        StakeAtRisk stakeAtRisk = new StakeAtRisk(deployerAddress, treasuryAddress, address(neuron), address(rankedBattle));

        // After Deployment ------------------------
        gameItems.setAllowedBurningAddresses(address(voltageManager));
        gameItems.instantiateNeuronContract(address(neuron));
        gameItems.createGameItem(
            "battery",
            "https://ipfs.io/ipfs/bafybeibhi6d5l2oqv63gczy6qwprzsspn5t6d5uuvadpl2afzvgtv44h7u",
            false,
            false,
            0,
            10 * 10 ** 18,
            5
        );

        fighterFarm.setMergingPoolAddress(address(mergingPool));
        fighterFarm.instantiateAIArenaHelperContract(address(aiArenaHelper));
        fighterFarm.instantiateNeuronContract(address(neuron));
        fighterFarm.addStaker(address(rankedBattle));

        rankedBattle.instantiateNeuronContract(address(neuron));
        rankedBattle.instantiateMergingPoolContract(address(mergingPool));
        rankedBattle.setStakeAtRiskAddress(address(stakeAtRisk));

        voltageManager.adjustAllowedVoltageSpenders(address(rankedBattle), true);

        neuron.addMinter(address(rankedBattle));
        neuron.addStaker(address(rankedBattle));
        neuron.addSpender(address(gameItems));
        neuron.addSpender(address(fighterFarm));

        for (uint256 i = 0; i < adminAddresses.length; i++) {
            address admin = adminAddresses[i];
            neuron.adjustAdminAccess(admin, true);
            voltageManager.adjustAdminAccess(admin, true);
            mergingPool.adjustAdminAccess(admin, true);
        }

        vm.stopBroadcast();
    }
}
