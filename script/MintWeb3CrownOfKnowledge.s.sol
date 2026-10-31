
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import {Script} from "forge-std/Script.sol";
import {Web3CrownOfKnowledge} from "../src/Web3CrownOfKnowledge.sol";

contract MintWeb3CrownOfKnowledge is Script {

    function run() external returns (uint256) {

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        address recipient = vm.addr(deployerPrivateKey);

        Web3CrownOfKnowledge nft = Web3CrownOfKnowledge(
            0xE54e8a0f412919D457E419E67987FB27d0C42099
        );

        vm.startBroadcast(deployerPrivateKey);

        uint256 tokenId = nft.mintNFT(
            recipient,
            "ipfs://bafkreibmzkgi6xuiaql3kyberia34n5askjquzcwt6kjbpzjry3oqxgc44"
        );

        vm.stopBroadcast();

        return tokenId;
    }
}
