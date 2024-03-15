// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Wallet {

    //address to owner
    address public owner;
    uint256 public balance;

    //global variable (biến global): msg

    // constructor là option function
    // khi contract được tạo ra, constructor sẽ chạy đầu tiên

    constructor(uint256 _b) {
        // initial state
        owner = msg.sender;
        balance = _b;
    }


    //keyword payable: hàm thực thi thanh toán một cách tự động
    //khi deploy contract, contract sinh ra hàm deposit, 
    //hàm này tự động nhận địa chỉ contract làm địa chỉ nhận
    
    // 1 eth == 10^18 wei
    // 1 eth = 1e18 
    // 1 wei == 1
    
    function deposit() public payable  {

    }

    //have withdraw


}

