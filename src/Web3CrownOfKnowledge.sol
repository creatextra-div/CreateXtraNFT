
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.37;

import {ERC721} from
    "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import {ERC721URIStorage} from
    "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import {Ownable} from
    "@openzeppelin/contracts/access/Ownable.sol";

contract Web3CrownOfKnowledge is ERC721URIStorage, Ownable {

    uint256 private _nextTokenId = 1;

    constructor()
        ERC721("Web3 Crown of Knowledge", "CXTN")
        Ownable(msg.sender)
    {}

    function mintNFT(
        address recipient,
        string memory metadataURI
    ) public onlyOwner returns (uint256) {

        uint256 tokenId = _nextTokenId;
        _nextTokenId++;

        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, metadataURI);

        return tokenId;
    }

    function nextTokenId() public view returns (uint256) {
        return _nextTokenId;
    }
}
