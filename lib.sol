// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

//học cách viết thư viện để tái sử dụng
library Random {

    function rand(uint256 nonce, uint256 _mod, uint256 _min) external view returns (uint) {
        return (uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,nonce))) % _mod) + _min;
    } 
}

contract Fun {
    uint256 nonce = 0;
    uint256 constant minValue = 1 ether;
    address owner;

    constructor () {
        owner = msg.sender;
    }

    function deposit() public payable {}

    function payment() public {
        require(msg.sender == owner);
        payable(owner).transfer(address(this).balance);
    }

    function play(bool isHigh) public  payable {
        require(msg.value >= minValue, "Minimum 1 ether");

        nonce ++;
        uint256 luckyNum = Random.rand(nonce, 13, 4);

        if (luckyNum <= 10 && isHigh == false) {
            payable(msg.sender).transfer(msg.value*2);
        } else if  (luckyNum > 10 && isHigh == true) {
            payable(msg.sender).transfer(msg.value*2);
        }
    }
}

//khái niệm interface
//khái niệm inherit kế thừa
