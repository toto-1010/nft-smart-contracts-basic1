// SPDX-License-Identifier: MIT
// An example of a consumer contract that relies on a subscription for funding.
// Chainlinkサンプルコード(※1)に対して、以下２点の変更を行った。
// 1. コメントを英語->日本語に変更し要点のみ記載
// 2. callbackGasLimit(100000->200000)、numWords(2->4)それぞれの変数の初期値を変更
//
// (※1)このコードの元となっているChainlinkサンプルコードは以下。
// https://docs.chain.link/docs/get-a-random-number/#analyzing-the-contract

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract VRFv2Consumer is VRFConsumerBaseV2 {
    /**
    * @dev VRFコーディネータを操作するためのオブジェクト
    */
    VRFCoordinatorV2Interface COORDINATOR;

    /**
     * @dev  このコントラクトがLINK資金要求のために使用するサブスクリプションID。コンストラクタで初期化される。
     */
    uint64 s_subscriptionId;

    /**
     * @dev  Rinkebyネットワーク用VRFコーディネータのコントラクトアドレス
     *       https://docs.chain.link/docs/vrf-contracts/#configurations
     */
    // for Rinkeby(not supported)
    // address vrfCoordinator = 0x6168499c0cFfCaCD319c818142124B7A15E857ab;
    // for Goerli
    address vrfCoordinator = 0x2Ca8E0C643bDe4C2E08ab1fA0da3401AdAD7734D;

    /**
     * @dev  ハッシュ値で、リクエストに対して支払ってもよいガス料金の上限をweiで指定する。
     *       https://docs.chain.link/docs/vrf-contracts/#configurations
     */
    // for Rinkeby(not supported)
    // bytes32 keyHash = 0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc;
    // for Goerli
    bytes32 keyHash = 0x79d3d8832d904592c0bf9818b621522c988bb8b0c05cdc3b15aea1b6e8db0c15;

    /**
     * @dev  コントラクトの fullillRandomWords 関数へのコールバック要求に使用するガス量の制限値
     */
    uint32 callbackGasLimit = 200000;

    /**
     * @dev Chainlinkノードが応答する前に待つ確認回数を指定。ノードが待てば待つほど、ランダムな値はより安全になる
     */
    uint16 requestConfirmations = 3;

    /**
     * @dev 要求する乱数の数
     */
    uint32 numWords =  4;

    /**
     * @dev 戻ってくる乱数を保存する配列変数
     */
    uint256[] public s_randomWords;

    /**
     * @dev Chainlinkへの要求ID
     */
    uint256 public s_requestId;

    /**
     * @dev このコントラクトオーナーのアドレス変数
     */
    address s_owner;
    
    constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_owner = msg.sender;
        s_subscriptionId = subscriptionId;
        }

    /**
     * @dev ランダムな数値を得る
     */
    function requestRandomWords() external onlyOwner {
        s_requestId = COORDINATOR.requestRandomWords(
            keyHash,
            s_subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
    }

    /**
     * @dev callback関数。オーバーライド
     */  
    function fulfillRandomWords(
        uint256, /* requestId */
        uint256[] memory randomWords
        ) internal override {
            s_randomWords = randomWords;
            }

    modifier onlyOwner() {
        require(msg.sender == s_owner);
        _;
    }
}
