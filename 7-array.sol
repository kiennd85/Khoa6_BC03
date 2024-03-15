// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {

    uint256[] public arr; // stoarage array, loại array này có đầy đủ các method (phương thức) như trong javascript

    function test () public returns (uint256[] memory) {
        arr.push(5);
        arr.push(10);
        arr.pop();

        return arr;
    }

    //mặc định trong function, các array: 
    // - phải khai báo kiểu lưu trữ là memory
    // - phải khai báo bằng keyword new và fix size
    // - loại array này không có các phương thức push, pop
    // - sử dụng index để thay thế giá trị của một phần tử trong array
    // - các hàm xử lý logic nên khai báo là internal

    function test2() internal pure returns (uint256[] memory) {
        uint256[] memory x = new uint256[](6);
        x[0] = 0;
        x[1] = 1;
        x[2] = 2;
        x[3] = 3;
        x[4] = 4;
        x[5] = 5;

        return x;
    }


}