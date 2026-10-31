// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import {Script} from "forge-std/Script.sol";
import {Web3CrownOfKnowledge} from "../src/Web3CrownOfKnowledge.sol";

contract DeployWeb3CrownOfKnowledge is Script {
    function run() external returns (Web3CrownOfKnowledge) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        Web3CrownOfKnowledge nft = new Web3CrownOfKnowledge();

        vm.stopBroadcast();

        return nft;
    }
}
