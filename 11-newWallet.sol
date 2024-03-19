// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Wallet {
    address public owner;
    bool private locked;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable  {}

    //mục đích của modifier dùng để
    // - restrict access
    // - validate input
    // - guard againist reentrancy attacks
    modifier isOwner {
        require(owner == msg.sender,"Who are you?");
        _; //code
    }

    modifier validateInput(uint256 _token) {
        require(_token > 0,"Must have greater than 0");
        require(address(this).balance >= 0, "Tham lam" ); //từ khóa this đại diện cho contract
        _; //code
    }

    // guard againist reentrancy attacks (kỹ thuật mutex)
    // khi hàm được gọi, sẽ block hàm cho đến khi chạy xong
    modifier noReentrancy() {
        require(!locked,"No reentrancy");
        
        locked = true;
        _; //code
        locked = false;
    }


    function withdraw(uint256 _token) public isOwner validateInput(_token) payable noReentrancy {
        (bool sent, bytes memory data) = payable(owner).call{value: _token}("");
        require(sent,"Fail to send Ether");
    }

    function transfer(address _to,uint256 _token) public isOwner validateInput(_token) payable noReentrancy  {
        (bool sent, bytes memory data) = payable(_to).call{value: _token}("");
        require(sent,"Fail to send Ether");       
    }


}

