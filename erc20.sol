// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// library Math {

// }



//openzepplin
// https://www.openzeppelin.com/contracts

//nodejs (js), => code frontend và backend 
//golang, => code product liên quan đến backend service 
//rust (code nền tảng blockchain)
//solidity

import "@openzeppelin/contracts/utils/math/Math.sol";

contract MathTest {
    using Math for uint;
    function add(uint a, uint b) public pure returns (uint) {
        (bool isAdd, uint c) = a.tryAdd(b);
        require(isAdd, "add error");
        return c;
    }
}
//https://ui.shadcn.com/examples/dashboard

//chỗ a.tryAdd(b), nếu mình có 2 using thư viện khác nhau thì hệ thống biết dùng thư viện nào vậy thầy