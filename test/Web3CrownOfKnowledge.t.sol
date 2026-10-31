
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import {Test} from "forge-std/Test.sol";
import {Web3CrownOfKnowledge} from
    "../src/Web3CrownOfKnowledge.sol";

contract Web3CrownOfKnowledgeTest is Test {

    Web3CrownOfKnowledge public nft;

    address public owner;
    address public recipient;
    address public unauthorized;

    string public metadataURI =
        "ipfs://QmExampleMetadataCID/1.json";

    function setUp() public {
        owner = address(this);
        recipient = makeAddr("recipient");
        unauthorized = makeAddr("unauthorized");

        nft = new Web3CrownOfKnowledge();
    }

    function testCollectionName() public view {
        assertEq(nft.name(), "Web3 Crown of Knowledge");
    }

    function testCollectionSymbol() public view {
        assertEq(nft.symbol(), "CXTN");
    }

    function testFirstTokenIDIsOne() public {
        uint256 tokenId = nft.mintNFT(recipient, metadataURI);

       assertEq(tokenId, 1);
assertEq(nft.nextTokenId(), 2);
    }

    function testNFTOwnership() public {
        uint256 tokenId = nft.mintNFT(recipient, metadataURI);

        assertEq(nft.ownerOf(tokenId), recipient);
    }

    function testMetadataURI() public {
        uint256 tokenId = nft.mintNFT(recipient, metadataURI);

        assertEq(nft.tokenURI(tokenId), metadataURI);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(unauthorized);

        vm.expectRevert(
            abi.encodeWithSignature(
                "OwnableUnauthorizedAccount(address)",
                unauthorized
            )
        );

        nft.mintNFT(recipient, metadataURI);
    }

    function testTokenIDsIncrease() public {
        uint256 firstTokenId = nft.mintNFT(recipient, metadataURI);
        uint256 secondTokenId = nft.mintNFT(recipient, metadataURI);

       assertEq(firstTokenId, 1);
assertEq(secondTokenId, 2);
assertEq(nft.nextTokenId(), 3);
    }
}
