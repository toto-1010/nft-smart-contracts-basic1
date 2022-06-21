// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";

contract OnlyOwnerMint is ERC721 {

    /**
     * @dev 
     * - このコントラクトをデプロイしたアドレス用変数 owner
     */
    address public owner;

    constructor() ERC721("OnlyOwnerMint", "OWNER") {
        owner = _msgSender();
    }

    /**
     * @dev 
     * - このコントラクトをデプロイしたアドレスだけがmint可能 require
     * - nftMint関数実行アドレス(=デプロイアドレス)にtokenIdを紐づけ _msgSender()
     */
    function nftMint(uint256 tokenId) public {
        require(owner == _msgSender(), "Caller is not the owner");
        _mint(_msgSender(), tokenId);
    }
}