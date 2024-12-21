// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudyAidNFT {
    // State variables
    uint256 public tokenCounter;
    uint256 public royaltyPercentage;
    address public royaltyRecipient;

    struct NFT {
        address creator;
        string tokenURI;
    }

    mapping(uint256 => NFT) public nfts;
    mapping(uint256 => address) public owners;

    // Events
    event NFTMinted(uint256 tokenId, address creator, string tokenURI);
    event RoyaltyPaid(address recipient, uint256 amount);

    constructor(uint256 _royaltyPercentage, address _royaltyRecipient) {
        require(_royaltyPercentage <= 100, "Royalty percentage cannot exceed 100.");
        require(_royaltyRecipient != address(0), "Invalid royalty recipient address.");

        tokenCounter = 0;
        royaltyPercentage = _royaltyPercentage;
        royaltyRecipient = _royaltyRecipient;
    }

    // Function to mint an NFT
    function mintNFT(string memory tokenURI) external {
        uint256 newTokenId = tokenCounter;
        nfts[newTokenId] = NFT({
            creator: msg.sender,
            tokenURI: tokenURI
        });
        owners[newTokenId] = msg.sender;
        tokenCounter++;

        emit NFTMinted(newTokenId, msg.sender, tokenURI);
    }

    // Function to transfer ownership and handle royalties
    function transferNFT(uint256 tokenId, address to) external payable {
        require(owners[tokenId] == msg.sender, "Only the owner can transfer the NFT.");
        require(to != address(0), "Invalid recipient address.");

        uint256 royalty = (msg.value * royaltyPercentage) / 100;
        payable(royaltyRecipient).transfer(royalty);
        payable(owners[tokenId]).transfer(msg.value - royalty);

        owners[tokenId] = to;

        emit RoyaltyPaid(royaltyRecipient, royalty);
    }
}
