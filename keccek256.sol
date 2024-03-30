// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

//học cách viết thư viện để tái sử dụng
contract Random {

    uint256 nonce = 0;

    function rand(uint256 _mod) public returns (uint) {

        nonce ++;
        return uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,nonce))) % _mod;

        //các tham số trong keccak256:
        // - time
        // - fee
        // - seed
    } 
}