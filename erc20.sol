// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


//nhóm token erc20: token mint
contract BonkBonk is ERC20 {

    address owner;

    constructor() ERC20("BonkBonk", "BONK") {
        owner = msg.sender;
    }

    //Hàm tạo số lượng token, và yc chỉ người tạo contract mới đc mint
    function mint(uint token) public {
        require(owner == msg.sender);
        _mint(msg.sender, token);
    }
    //hàm mint là hàm private trong thư viện, vì vậy để thực hiện mint,
    //cần khai báo một hàm mint (kiểu public) để ghi đè lên hàm mint trong thư viện

    //convert eth => bonk

}

//tính năng flash mint > dùng cho flash loan


