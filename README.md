# 概要
私、ととが製作した学習教材の一部です。  

これからNFTスマートコントラクト開発を学習される方々向けの学習コースで使用したソースコードを無料提供します。  
※DApp（分散アプリケーション）やスマートコントラクト開発における知識、技術力向上が主な目的です。私は日本におけるこれらの技術発展を望む者です。

コードの解説については現在動画（現時点では有料）のみで行なっています。もし関心のある方いらっしゃればご覧ください。
  
  

### 注意事項
このGitHubリポジトリにあるソースコードは学習目的のものです。  以下の点は予めご了承の上ご利用ください。
  - ソースコードそのものはコースの受講者か否かに限らず[MITライセンス](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/LICENSE "MIT LICENSE")のもと、無料提供しますが、そのまま使ったり、切り貼りしたりしてご自身のNFTコントラクトを開発し、Ethereumなどのメインネットワークにデプロイすることは推奨しません。  
  - MITライセンス記載の通り、これを禁止するものではありませんが、「本ソフトウェアの使用またはその他の取引に起因または関連して発生した、いかなるクレーム、損害またはその他の責任についても、著作者または著作権所有者は一切責任を負いません。」  と記載がある通り、利用の際はご自身の責任のもと行なってください。  
  - 様々な技術、ライブラリやサービスなどを使っていますが、特定の銘柄や商品の投資や投機を促すものではありません。  
  - 本GitHubリポジトリから直接Q&Aは受け付けていません。  
  - このリポジトリで提供するソースコード以外、例えばコースの解説動画や資料、NFT画像、その他の著作権をはじめとする全ての権利は私、ととが有しています。  
  
  

### 解説動画とソースコードのリンク

#### Section01 はじめに
- ソースコード　  
　- なし

#### Section02 ERC-721とスマートコントラクトの基礎知識
- ソースコード　  
　- なし

#### Section03 EOAアドレス生成とトランザクション基礎知識およびウォレット環境準備
- ソースコード  
　- なし

#### Section04 【コアNFT】はじめてのNFTスマートコントラクト開発
- ソースコード  
  - [MyNFT.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section04/MyNFT.sol "MyNFT.sol")
  - 【参考】トランザクション  
    - [Etherscan transaction](https://goerli.etherscan.io/tx/0x58d8226554c5b4c925c0228a85d110576e95c2decd9ca0d5dd66b77396a0c7b5 "OnRandomURIOracle transaction")  
  - 【参考】NFT(OpenSea)  
    - [テスト用OpenSea](https://testnets.opensea.io/assets/goerli/0x160E6dAE91F5e878A6dd70cDCfc2e0354cFc8bcF/1 "OnURIUnchangeable NFT")  

#### Section05 スマートコントラクトのファンクション実行制御
- ソースコード1  
  - [OnlyOwnerMint.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section05/OnlyOwnerMint.sol "OnlyOwnerMint.sol")  
- ソースコード2  
  - [OnlyOwnerMintWithModifier.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section05/OnlyOwnerMintWithModifier.sol "OnlyOwnerMintWithModifier.sol")  
- ソースコード3  
  - [OZOnlyOwnerMint.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section05/OZOnlyOwnerMint.sol "OZOnlyOwnerMint.sol")  

#### Section06 【分散型ストレージソリューション】IPFS/Filecoin
- ソースコード  
  - なし

#### Section07 【オフチェーンNFT】スマートコントラクト開発
- ソースコード1  
  - [OffURIChangeable.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section07/OffURIChangeable.sol "OffURIChangeable.sol")  
  - 【参考】トランザクション1  
    - [Etherscan transaction](https://goerli.etherscan.io/address/0x543f095ce8d0938b80e82655c6e9945cc6c01d7d "OffURIChangeable transaction")  
  - 【参考】NFT(OpenSea)1  
    - [テスト用OpenSea](https://testnets.opensea.io/collection/offurichangeable-bf7414lmuc "OffURIChangeable NFT")  
- ソースコード2  
  - [OffURIUnchangeable.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section07/OffURIUnchangeable.sol "OffURIUnchangeable.sol")  
  - 【参考】トランザクション2  
    - [Etherscan transaction](https://goerli.etherscan.io/address/0x0e707bfdcd08b018005a7829869100b60dd96d23 "OffURIUnchangeable transaction")  
  - 【参考】NFT(OpenSea)2  
    - [テスト用OpenSea](https://testnets.opensea.io/collection/offuriunchangeable-9tn6chp6gd "OffURIUnchangeable NFT")  

#### Section08 Event発行とIncremental tokenId
- ソースコード1  
　　- [EventNFT.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section08/EventNFT.sol "EventNFT.sol")  
　　- 【参考】トランザクション1  
　　　　- [Etherscan transaction](https://goerli.etherscan.io/address/0xb9eF202644EC5CfBB73dd5c02827E62A39B57fB1#events "EventNFT transaction")
- ソースコード2  
  - [CounterNFT.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section08/CounterNFT.sol "CounterNFT.sol")  
  - 【参考】トランザクション2
    - [Etherscan transaction](https://goerli.etherscan.io/address/0x6d43f9749eca7c31f98ab4636179a267fef24e89 "CounterNFT transaction")  
  - 【参考】NFT(OpenSea)2
    - [テスト用OpenSea](https://testnets.opensea.io/collection/counternft-u6tx6dc28u "CounterNFT NFT")


#### Section09 NFTの削除と停止ができるスマートコントラクト開発
- ソースコード1  
  - [BurnableNFT.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section09/BurnableNFT.sol "BurnableNFT.sol")  
- ソースコード2  
  - [PausableNFT.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section09/PausableNFT.sol "PausableNFT.sol")  

#### Section10 スマートコントラクトコードの検証とオープンソース化
- ソースコード
  - なし

#### Section11 【オンチェーンNFT】スマートコントラクト開発
- ソースコード  
  - [OnURIUnchangeable.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section11/OnURIUnchangeable.sol "OnURIUnchangeable.sol")  
  - 【参考】トランザクション  
    - [Etherscan transaction](https://rinkeby.etherscan.io/address/0x654f0a4bbadfb78537de15e534562cb37509c44c "OnURIUnchangeable transaction")  
  - 【参考】NFT(OpenSea)  
    - [テスト用OpenSea](https://testnets.opensea.io/collection/onuriunchangeable-v4 "OnURIUnchangeable NFT")  

#### Section12 【オンチェーン擬似ランダムNFT】スマートコントラクト開発 using keccak256 hash
- ソースコード  
  - [OnRandomURIKeccak.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section12/OnRandomURIKeccak.sol "OnRandomURIKeccak.sol")  
  - 【参考】トランザクション  
    - [Etherscan transaction](https://mumbai.polygonscan.com/address/0x0f8115b50678c89f81453d48815d02b65847b5f3 "OnRandomURIKeccak transaction")  
  - 【参考】NFT(OpenSea)  
    - [テスト用OpenSea](https://testnets.opensea.io/collection/onrandomurikeccak-hhmawi2ptr "OnRandomURIKeccak NFT")  

#### Section13 【オラクルソリューション】Chainlink VRF
- ソースコード  
  - [ChainlinkVRFDemo.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section13/ChainlinkVRFDemo.sol "ChainlinkVRFDemo.sol")

#### Section14 【オンチェーンランダムNFT】スマートコントラクト開発 using Chainlink VRF
- ソースコード  
  - [OnRandomURIOracle.sol](https://github.com/toto-1010/nft-smart-contracts-basic1/blob/main/contracts/lecture-codes/Section14/OnRandomURIOracle.sol "OnRandomURIOracle.sol"). 
  - 【参考】トランザクション  
    - [Etherscan transaction](https://rinkeby.etherscan.io/address/0x65334d7e31064df0d257171a46d38dce0b45d638 "OnRandomURIOracle transaction")  
  - 【参考】NFT(OpenSea)  
    - [テスト用OpenSea](https://testnets.opensea.io/collection/onrandomurioracle-v4 "OnRandomURIOracle NFT")  


#### Section15 NFTの権限移譲(Approve)と移転(Transfer)
- ソースコード  
  - なし

#### Section16 さいごに
- ソースコード  
  - なし
