// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


//xử lý lỗi trong solidity (giống như try/catch trong jsvascript)
contract ErrorControl {
    string public x;

    function buy(uint256 _x) public  returns (uint256) {
        
        //Khi hàm bị lỗi, thì hệ thống sẽ chuyển các state về trạng thái ban đầu
        x = "Hello";

        //check all requires
        require(_x > 10, "must have > 10");

        if(_x >= 10 && _x <= 15) {
            // sold out
            revert("All items sold out");
        } 

        return 10000;

   
    } 



}