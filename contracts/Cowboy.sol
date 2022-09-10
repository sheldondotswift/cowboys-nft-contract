// SPDX-License-Identifier: MIT
//  ______ _____  ______ ______  _____  _____          _____  ______
// |  ____|  __ \|  ____|  ____|/ ____|/ ____|   /\   |  __ \|  ____|
// | |__  | |__) | |__  | |__  | (___ | |       /  \  | |__) | |__
// |  __| |  _  /|  __| |  __|  \___ \| |      / /\ \ |  ___/|  __|
// | |    | | \ \| |____| |____ ____) | |____ / ____ \| |    | |____
// |_|    |_|  \_\______|______|_____/ \_____/_/  __\_\_|    |______|
//                / ____/ __ \ \        / /  _ \ / __ \ \   / / ____|
//               | |   | |  | \ \  /\  / /| |_) | |  | \ \_/ / (___
//               | |   | |  | |\ \/  \/ / |  _ <| |  | |\   / \___ \
//               | |___| |__| | \  /\  /  | |_) | |__| | | |  ____) |
//                \_____\____/   \/  \/   |____/ \____/  |_| |_____/
//
//     BY CRYPTYDE INC.
//                                                             .;"I[o4C#4\
//     Based on the ERC-721A Contract by Chiru Labs         .10HNBBMBMMMMMBi
//     ( + ERC2981 and signed message whitelisting )       .eBMMMMBBBMMMMMM+
//                                                        lRRBR&SZCCCC%g&R2\
//                                                      .:LHGE&gw#ggS#AwgON$I*
//                                                   .1pOBM@@@@@@@@@@@@@@@@@@@MDk"
//     For Terms & Conditions, please visit:       .sM@@@@@@@@@@@@@@@@@@@@@@@@@@@@Bx:
//     freescape.io/terms-of-service               \M@@@@@@@@@@@MMBNBBMM@@@@@@@@@@@@B?
//                                                ,N@@@@@@@MBBBBDmk7k#BBBBBM@@@@@@@@w.
//                                                 jM@@@@@MRD&D#000okUORDDHRB@@@MBmc'
//                                                  ;hEBMBHS5sXGDgwEENBMMBBB&Cot_.
//                                                     .f&N&Ch0xqRE$&DBMMMBB[
//                                                       ~mR$ewqqZRN0BBMMMBg_
//                                                        .fEBBB$5wBBMMMMMB1
//                                                       .-_rkBMBNNBBMMMMMC`
//                                                   _1yFERRMMMB&BBMMMMMMD~
//                                              .~]kCBBBMMBRGGNWpHDBMMMMMBCsv_
//                                            .^p&RBBBBBBMMMMBBDO$EWBM@@@MBRNW2l.
//                                           l&MMMMMMBBBBBBBBBMMBBN&$HM@MB&DBMMM&?,
//                                           1MMBBBMMMMBBBBBBBBBBBBBBBN&GWNBBBMMMMD+:
//                                          ,oBBBBBBMBBBBBMMMBBBRBBBBBBBBRBBBMMMMMME_
//                                         i$BBBBBBBMMBBBBBMBDCSNBBBRBBBBBBMMMBBMMMMG_
//                                        +DBBBBBBBMMMBBBBBBE2v1]#RBBBBBRBMMMMBBMMMMMw,
//                                       fNBBBBBBBBMMMBBBBBNgz1+ty#O&NBBMMMMMMMBMMMMMMa
//                                     .7RBBBBBBBBMMMMMBBBBOqfj++}sUGRBMMMMMMMMMBBMMMMM*
//                                    `oBBBBBBBMMMMMMMBBBMB$F?}v?}zSBBMMMMMMMMMMMMBMMMMe
//                                   `hBBBBBBBMMMMMMMMBBBMB$k1ff1foSBMMMBBBBMMMMMMMMMMMB+
//                                  `kBBBBBBBMMMMMMMMMBBMBDg]t11tc2HEHA%R&EWRBMMMMMMMBMMMe;
//                                  aBBBBBBBMMMMMMMMMMMMMB$h>1f=xCH0yyoXDSHg$DRBMMMMMMBMMMBe_
//                                 rBBBBBBMMMMM@@@MMMMMMMRSxjtLh#Xo77ssHRSm%wH&RMMM@MMMMMMMMBs`
//                                ;HBBBBBMMMMM@MRMMMMMMMMRHn1ow&w[x]ns4DNSgUm#$NBMMMMMM@MMMMMM#;
//                                [BBBBBBMMMMMM7.LMMM@MMBDAc=}0wsv7c[o%G&HgXUgONBMMMM@@@@MMMMMM$;
//                               `ZBBBBBBMMMMMq. _BBM@MMREq>tv??1fvLzFX&EHZCXHERMBMM@@@@@@MMMMMMH;
//                               ^BBBBBBBMMMMR'  sMBM@@MN&2vv}?f>}}xnoX&&gUXZgEBMBMBhzR@@@MMMMMMMm`
//                               oBBBBBBBMMMM]  _BMM@@@MD$ovvvtf[[f?zLkw&SwmAHGBMBBMC,`hM@@MMMMMMMs
//                              -EBBBBBMMMMMR:  hMM@@@@MNHx1}v=tv?c7zsa$HggmZ$DBMBBMBL  _UM@MMMMMMB~
//                              oBBBBBMMMMMMh  ~BM@@@@@MNHovv1fvvf?}7oUNS#HwgONMMBBBBw    iN@MMMBMMD*
//                             \DBBBBMMMMMMM+ .oM@@@@@MBN$5[v?c}vf}czkHD#w$gmERMMBBBBS     -XMMMBBBM$;
//                            ,XBBBBBMMMMMMD: 1BM@@@@@MBREgovfv}ff}LypS#wUSHg$RMBBBBBH      .7MMMBBBMH_
//                            }BBBBBBMMMMMM} |BM@@@@@@MBREH2v1vvtf]LkFpHG%SHSHBMBBBBBH        !BMMMMMMN;
//                           .UBBBBBBBMMMB?.rBM@@@@@@@@MMBN$C5XgH$OSHS&RBG&G&RMMBBBBB$.        ~SMMMMB1.
//                           ;DBBBBBBM@@Br lBM@@@@@@@M@MMMMRNRBBGGBBBRBMBMMMBM@MBBBMMBl          ZBMMD}.
//                           !BBBBBBM@@@v IBMM@@@@@@@M@@@MBRRBBBNNMMMBMMBMMMBMMMBBBBBBC          kBBBBNo
//                           ,zBNCRMBRME'cMM@@@@@@@@@M@@MBHgggH$O&&GDNDRBRRNNRBMBBBBBBB`         .oRNMMm\
//                            IWDS2$BENR#MMM@@@@@@@@MMM@BOg#wwgSHHSHHO&WDNNRNNBMMBBBBMMl          -oRBMC;
//                            vRBN]hf.IgBM@@@@@@@@@@MMMM&Sg##w#w##g$E&DDNDNNNNNBMBBBBBMo           .mGRU\
//                            ;SEUss-:XMMM@@@@@@@@@MMMMRHSgwmUZg$E&GWDDDNNNDGWNBMBBBMBBZ           .oUEC,
//                            .pB&B&cwMMM@@@@@@@@@@BBMBESg#Aw#S$EE$EGDDNNDDDGGDBMBBBMBB&`           'oH[
//                             ;UBMMMMMM@@@@@@@@@@MBBBB&gwZU%Z#gSHENBBRRNWDG&GWRBMMMBBB&,             .
//                              :qBMMMM@@@@@@@@@@@MM@B$HggSgg#wwHRBBBBNNNGGEEE&NBBMBBBB%.
//                               '%BMM@@@@@@@@@@@@MMMG$$O$S#ZAHNBBBBBBBRDW&O$E&DBBMBBBBo
//                              ~EBBM@@@@@@M@@@@@MM@MN$$HSSHERBBBBBMMMMRD&E$EE&DBMBBBBBc
//                             IGBBM@@@@@@M@@@@@@M@MB&HHH$EWDDWNRBM@@MBEEE&&&WRBBMBBBBB}
//                           .?RBBM@@@@@@MM@@@@@@@@MEHH$E&&&&&DBBM@@MMB&$E&GGWRBMMBBBBBv                                                                               ...`:;_____;'`.
//                          `oBBBM@@@@@@@M@@@M@@@@@BHH$OOOEE&RBBBM@@MMBNEE&&DNRBMMBBBBB^                                                                            ..,;_""""""""*_;'`.
//                         '0BBBM@@@@@@@MM@@MMM@@@@B$H$$$OEDBBBBM@@@@MBW&GGDRRBBMMBBBBB_                                                                      ..`:;;__""""""*__;;-,..
//                        _UBBBM@@@@@@@MM@@MMMM@@@MRGHH$E&RBRRRM@@@@@MBDWDDDRRBMMBBBBBB.                                                                 .`'__""""""""""*""*;,.
//                       *SBBBM@@@@@@@MM@@MMMM@@@MR&EEO&&DDWNBM@@@@@@MMBGGDDDNRMMBBBBBB                                                              .`:;_*"""""""""""""""*_:.
//                      lDBBM@@@@@@@@MMMMMMMMM@@@M&HH$EEEWDNRBM@@@@@@MMBGOEEE&RMMBBBBBB:                                                       ..:-__*"""""""""""""""""*_;:.
//                     iDBBM@@@@@@@@MMMMMMMMM@@@@B&OHH$E&WNBBM@@@@@@@@MR$$EGRBMMMBBBBBM"                                                    .,;_*""""""""""""""""""""""_'.
//                    _$BBM@@@@@@@@MMMMMMMMMM@@@MGHH$$$E&DBMM@@@@@@@@@BW$NRBRBMMMBBBBBMi .                        ........... .         ..'_*""""""""""""""""""""""""*_-`
//                   .2BM@@@@@@@@@MMMMMMMMMM@@@@ME$SSH$EDBMM@@@@@@@@@@R&RRD&&RBMMBBBBMM? ....     .....................................:;_"~~~~~~"""""""""""""""""""_-.
//                  ;kBM@@@@@@@@MMMMMMMMMMM@@@@@MOHHHH$&RBMM@@@@@@@@@@NG&$HHHODBBBBBBMMe...........................................,;_"~~~~~~~~~~~~~~""""~~"""*_""_;,.
//                 IEBM@@@@@@@@@MMMMMMMMMM@@@@@@BHHSHH$&RBBM@@@@@@@@@@BDO$$HH$&BBBBBBMM#`......................................`:;_~~~~~~~~~~~~~~~~~~~~~~~"*;,..`..
//               .\RBM@@@@@@@@@MMMMMMMMMMM@@@@@@BSSgggSENBM@@@@@@@@@@@MMBBBBBBMMMBBBBMMR;................................`:-;_"~~~~~~~~~~~~~~~~~~~~~~~~~"_'`.
//               \&BBM@@@@@@@@MMMMMMMMMMM@@@@@MMMBDG&&WRBMM@@@@@@@@@@@@MMMMMMM@MBBBBMMMB_.........................`,';__"~\\\\\\\\~~\~~~~~~~~~~~~~~~~"_-`...       .
//           ...\DBBBM@@@@@@@@MMMMMMMMM@@@@@@M@MMMMBBBMM@@@@@@@@@@@@@@@MMBRBBMMMBBBBM@MBi................``,';__"~\\ii\\\\\\\\\\\\\\\~~~~~~~~~~~~~_;,................
//     ..  ....-wBBBBM@@@@@@@@MMMMMMMM@@@@@@@B@MMBMMMMM@@@@@@@@@@@@@@@@MMMBMMMMMBBBBM@MMI```````````,';__"~\iiiiiiiiiiiii\\\\\\\\\\\\\\\~\~~~~~_;,....................
//     .......;0BBBBBM@@@@@@@MMMMMMMM@@@@@MM@MMMMBBBRMMM@@M@@@@@@@@@@@@@MMMMMM@MBBBBM@MBi```,';__*~\iiiiiiiiiiiiiiiiiiiiiiiiiiii\\\\\\\\\\\"_-,........................
//...........~SBBBBBBM@@@@@@@MMMMMMM@@@@MMMMMMMMMBMMBMMMMMB@@@@@@@@@@@@@MMMMMMMMBBBBMMMBr*~\i!!!!!!!!!!!!!!!!!!!!!iiiiiiiiiiiiiiiiiii\\\~*-`............................
//........`lFNBBBBBBBB@@@@@@MMMMMMMM@@MMMMMMM@MMMMMMMMM@@MM@@@@@@@@MDRMMMMMMMMMBBBBMMMMN|^rrr^^^^^^^^^^^^^^^!!!!!!!!!iiiiiiiiiiiiiiii~_;,`.............................
//........,]DBBBBBBBBBM@@@@@MMMMMM@@@MMMMMMMMMMBMBMBBM@@@B@@@@@@@@@U:^HBMMMMMMMBBBBMMMMwlllllllllllllrrrrrrrr^^^^^!!!!!!!!iiiiiiii~_;,`................................     .
//..........*$BBBBBBBBM@@@@@MMMMMM@MMMMMMMMMMMMMMBMMMM@@MB@@@@@@MB&]*~+&MMMMMMBBBBBMMMMpIIIIIIIlllllllllllllllrrr^^^^^^!!!!!!ii~_-,``..`...............................      .
//...........fHBBBBBBRMMMMMMMMMMMMMMMMMMMMMMMMRRMBMBMM@MRBBNS4[|l|+++>jpMMMBBMBBBBBMMMMHj|||||I|IIIIIIIIIIIIllllllrrr^^^^!!i*;:````````...............................
//..........``,rkDBBE~~c2$BMMMMMMMMMMMMMMMMMMM&NMBBBMM@Mn_~|tttt1t>t]X1?BMMMMBBBBBMMM%s1jjj++++++++++|||Ir!!lIIllllllrr^i*;:,`````````................................
//..........`````;v#j,,,,,'*i|>+I^!i\i^+v[L7]coDMBRBMMMB>_\j11}h%0so%NC[RMMBBBBBBBShFx==jI^!Ittt>>>jjj|^~~\ilIIIIIllli"_',,,``````````..............................
//..........```````,,,,,,,,::::::''''---;;;;;;|NMBBBMM@Bl__i+>cHBBBBNBBDMMBRDBBBBBXvft|ll|t1111111=tl!!^I+++|||IIli";'::,,,,,`````````.............................
//..........````````,,,,,,:::::::'''---;;;;;;;rXBBBDBMMB1l+t=IlkRB&k]nwRMMMBGEWRBBE7?fv??}vvvfff11|~_!+jj+++||li*;':::::,,,,`````````............................. ..
//..........````````,,,,,,::::::'''---;;;;;;___jBBE$WMMM5]?c]xzo2gaxzzoDBBMMB&A&BMM&&$U][c??}vvf>r__;;_"ilI!~_;''::::::,,,,````````...........................   .
//..........`````````,,,,,:::::'''----;;;;;____nMN00gRBMCl^rtsokkooossoEBBRSBBDNBMMMBBNzL][??}vfl~__;;;;;;;-''''::::,,,,,`````````..........................
//...........```````,,,,,,:::::''--;;;;;;____"~2MBEHNBMMX|1[okkkkkkkookSMBBGWBBRBBMMMMB&0zLc?}vfi_;;;;;;;--'''::::,,,,,`````````..........................
//.............```````,,,,,,::::'--;;;;;____*"|$MBBBMMMMBCFFFF4FF444Faos$BMMMEOMMBBBMMMBBRmo7[}f1i_;;;;;-''::::,,,,````````...........................
//................`````,,,,::::''--;;;;____*~~sGMMMMMMM@M$5500qpp2aaaFo]f?zoke#BMMMBDNBMMBBR$kL?f=l_;--'':::,,,,`````````...........................
//    ............`````,,,:::::'--;;;;;___*"~iwMMMMMMMMMMR#A%XC5qp2ak}jjjtt=1v?oSBMMMRHORBMMBNhxcf=";-'::,,,,,```````.............................
//    ..........```````,,::::''--;;;;;____*"~ieMBMMMMMMMMBOS#UX5q2Fkc|IIIIIIII|j=caEBMB&ggERBBDo7?|_;-::,,,````````................................
// ............`````,,,,:::''--;;;;;;____*"~i^oMBMMMMMMMMMN$gUC024kx|l^!!iiii!!!^lI|vkmRBBBRBBMg7I_;-'::,,``````................................... .    ..
//...........`````,,,,:::''--;;;;;_____"""~~i^kMMBMMMMMMMMBOwX5peks1^iii\\~~~~~~~\\\iiirtLkCHRBBXl;-'':::,,,,`````..................................
//........``````,,,:::'---;;;;;;______""*"~~\ifNMBBBBMMMMMM&ACpek[Iii\\~~~""""""""""""*______*\l\;-''''::::,,,,``````.................................
//...``````,,,,,:::''-;;;;;;__________""*""~~\i]BMBRDRBMMMM$XpkcIi\~~~""""""____________;;;;;;;----''''::::::,,,,````````..............................
//```````,,,,:::'''--;;;;;____________""*"""~~\izOBBNgEBMMDCovl\~~"""""*______________;;;;;;;;-----'''':::::::,,,,,````````..............................
//``````,,,,::::'''-;;;;;;____________""""""*"""~ivF&BBMMBo+i~""""""_______________;;;;;;;;;;;----''''':::::::,,,,,,,`````````............................... .
//````,,,,,::::'''--;;;;;;;_______________""""""""*"\oOD&h^"""__________________;;;;;;;;;;;;;-----'''''::::::::,,,,,,,,,````````............................... ..
//``,,,,,,,:::::''---;;;;;;;;;________________________*"*_____________________;;;;;;;;;;;;;;------'''''::::::::,,,,,,,,,````````````..............................
//``,,,,,,,:::::'''-----;;;;;;;;_______________________________________;;;;;;;;;;;;;;;;;;;;;-----'''''':::::::::,,,,,,,,``````````````............................    ..

pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IERC2981Royalties {
    function royaltyInfo(uint256 _tokenId, uint256 _value)
        external
        view
        returns (address _receiver, uint256 _royaltyAmount);
}

contract SpaceCowboys is ERC721A, IERC2981Royalties, Ownable {
    using Address for address;
    using Strings for uint256;
    using ECDSA for bytes32;

    address _treasuryAddress;
    string private _notRevealedUri = "";
    string private baseURI = "";
    string private _uriSuffix = ".json";
    uint256 private _whitelistPrice = 0.05 ether;
    uint256 private _basePrice = 0.088 ether;

    uint256 public maxSupply = 8888;
    uint256 royaltyPercentage = 10;
    bool public mintIsOpen = false;
    bool public revealed = false;

    constructor(address treasuryAddress)
        ERC721A("Space Cowboys", "COWBOYS")
    {
        _treasuryAddress = treasuryAddress;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    function setRevealed(bool reveal) public onlyOwner {
        revealed = reveal;
    }

    function setNotRevealedUri(string memory notRevealedURI) public onlyOwner {
        _notRevealedUri = notRevealedURI;
    }

    function setBaseURI(string memory newBaseUri) public onlyOwner {
        baseURI = newBaseUri;
    }

    // function withdraw() public onlyOwner {
    //     _withdraw();
    // }

    function _withdraw() internal {
        (bool os, ) = payable(_treasuryAddress).call{
            value: address(this).balance
        }("");
        require(os);
    }

    function setOpenMint(bool open) public onlyOwner {
        mintIsOpen = open;
    }

    function royaltyInfo(uint256, uint256 value)
        external
        view
        override
        returns (address receiver, uint256 royaltyAmount)
    {
        return (_treasuryAddress, value * royaltyPercentage / 100);
    }

    function setTreasuryAddres(address treasuryAddress) public onlyOwner {
        _treasuryAddress = treasuryAddress;
    }

    function getMintPrice() public view returns (uint256) {
        if (mintIsOpen) {
            return _basePrice;
        } else {
            return _whitelistPrice;
        }
    }

    function setBasePrice(uint256 basePrice) public onlyOwner {
        _basePrice = basePrice;
    }

    function setWhitelistPrice(uint256 whitelistPrice) public onlyOwner {
        _whitelistPrice = whitelistPrice;
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override
        returns (bool)
    {
        return
            interfaceId == type(IERC2981Royalties).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    function mint(uint256 quantity) public payable {
        _prepareMint(msg.sender, quantity, false); // whitelisted = false
    }

    function mintForAddress(uint256 quantity, address to) public payable {
        _prepareMint(to, quantity, false); // whitelisted = false
    }

    function mintWhiteList(uint256 quantity, bytes memory signature)
        public
        payable
    {
        bytes32 messagehash = keccak256(
            abi.encodePacked(address(this), owner(), msg.sender)
        );
        address signer = messagehash.toEthSignedMessageHash().recover(
            signature
        );
        _prepareMint(msg.sender, quantity, owner() == signer);
    }

    function _prepareMint(
        address to,
        uint256 quantity,
        bool whitelisted
    ) internal {
        require(
            owner() == msg.sender || mintIsOpen,
            "Minting is currently closed"
        ); // Don't allow anyone to mint if the mint is closed
        require(to != address(0), "Cannot send to 0x0"); // mint to the 0x0 address
        require(
            msg.value >=
                (whitelisted ? _whitelistPrice : _basePrice) * quantity,
            "Insufficient funds!"
        );
        require(_nextTokenId() <= maxSupply, "No Cowboys left!"); // sold out
        require(
            _nextTokenId() + quantity <= maxSupply,
            "Not enough Cowboys left!"
        ); // cannot mint more than maxIndex tokens

        _mint(to, quantity);

        _withdraw();
    }
}
