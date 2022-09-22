// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";
import "@openzeppelin/contracts@4.6.0/utils/Strings.sol";
import "@openzeppelin/contracts@4.6.0/utils/Base64.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract OnRandomURIOracle is ERC721URIStorage, VRFConsumerBaseV2 {

    /**
     * @dev
     * - _tokenIdsはCountersの全関数が利用可能
     */
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    /**
     * @dev
     * 色の構造体を定義し、この配列変数colorsを定義
     */
    struct Color {
        string name;
        string code;
    }

    Color[] public colors;

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

    /**
     * @dev
     * - URI設定時に誰がどのtokenIdに何のURIを設定したか記録する
     */
    event TokenURIChanged(address indexed sender, uint256 indexed tokenId, string uri);

    /**
     * @dev
     * 配列変数colorsに色データを登録
     */
    constructor(uint64 subscriptionId) ERC721("OnRandomURIOracle", "ONO") VRFConsumerBaseV2(vrfCoordinator){
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_owner = msg.sender;
        s_subscriptionId = subscriptionId;

        colors.push(Color("Yellow", "#ffff00"));
        colors.push(Color("Whitesmoke","#f5f5f5"));
        colors.push(Color("Blue","#0000ff"));
        colors.push(Color("Pink","#ffc0cb"));
        colors.push(Color("Green","#008000"));
        colors.push(Color("Gold","#FFD700"));
        colors.push(Color("Purple","#800080"));
        colors.push(Color("Light Green","#90EE90"));
        colors.push(Color("Orange","#FFA500"));
        colors.push(Color("Gray","#808080"));          
    }

    /**
     * @dev 
     * - このコントラクトをデプロイしたアドレスだけがmint可能 onlyOwner
     * - tokenIdをインクリメント _tokenIds.increment()
     * - 画像データメタデータを設定しURIを定義 imageData, metaData,uri     
     * - nftMint関数実行アドレス(=デプロイアドレス)にtokenIdを紐づけ _msgSender()
     * - mintの際にURIを設定　_setTokenURI（）
     * - EVENT発火 emit TokenURIChanged
     */
    function nftMint() public onlyOwner {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();

        uint256 colorNum1 = s_randomWords[0]%colors.length;
        uint256 colorNum2 = s_randomWords[1]%colors.length;
        uint256 colorNum3 = s_randomWords[2]%colors.length;
        uint256 colorNum4 = s_randomWords[3]%colors.length;

        string memory colorName1 = colors[colorNum1].name;
        string memory colorName2 = colors[colorNum2].name;
        string memory colorName3 = colors[colorNum3].name;
        string memory colorName4 = colors[colorNum4].name;

        string memory imageData = _getImage(colorNum1, colorNum2, colorNum3, colorNum4);

        bytes memory metaData = abi.encodePacked(
            '{"name": "',
            'Colorful Cordinate Square # ',
            Strings.toString(newTokenId),
            '", "description": "Randomly colored the square.",',
            '"image": "data:image/svg+xml;base64,',
            Base64.encode(bytes(imageData)),
            '","attributes": [{ "trait_type": "First color", "value": "',
            colorName1,
            '"}, { "trait_type": "Second color", "value": "',
            colorName2,
            '"}, { "trait_type": "Third color", "value": "',
            colorName3,
            '"}, { "trait_type": "Fourth color", "value": "',
            colorName4,
            '"}]}'
        );

        string memory uri = string(abi.encodePacked("data:application/json;base64,",Base64.encode(metaData)));

        _mint(_msgSender(), newTokenId);
        _setTokenURI(newTokenId, uri);

        emit TokenURIChanged(_msgSender(), newTokenId, uri);
    }

    /**
     * @dev
     * - 引数で渡されるカラーコードを指定したSVGデータを返す
     */
    function _getImage(uint256 colorNum1, uint256 colorNum2, uint256 colorNum3, uint256 colorNum4) internal view returns (string memory) {
        string memory colorCode1 = colors[colorNum1].code;
        string memory colorCode2 = colors[colorNum2].code;
        string memory colorCode3 = colors[colorNum3].code;
        string memory colorCode4 = colors[colorNum4].code;

        return (
            string(
                abi.encodePacked(
                    '<svg viewBox="0 0 350 350" xmlns="http://www.w3.org/2000/svg">',
                    '<polygon points="0 0, 175 0, 175 175, 0 175" stroke="black" fill="',
                    colorCode1,
                    '" />',
                    '<polygon points="0 175, 175 175, 175 350, 0 350" stroke="black" fill="',
                    colorCode2,
                    '" />',
                    '<polygon points="175 0, 350 0, 350 175, 175 175" stroke="black" fill="',
                    colorCode3,
                    '" />',
                    '<polygon points="175 175, 350 175, 350 350, 175 350" stroke="black" fill="',
                    colorCode4,
                    '" />',
                    '</svg>'
                )
            )
        );        
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
