// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory _arr)
        public
        pure
        returns (uint256[] memory)
    {
        // your code here
        return run(_arr);

    }

    function run(uint256[] memory _arr) internal pure returns (uint256[] memory) {
        
        //Đếm số phần tử Even trong mảng
        uint256 countEvenNumber = 0;

        for (uint256 i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                countEvenNumber ++;
            }
        }

        //Tạo dynamic array để lưu các phần tử Even
        uint256[] memory evenArr = new uint256[](countEvenNumber);
        uint256 index = 0;

        for (uint256 i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                evenArr[index] = _arr[i];
                index ++;
            }
        }       

        return evenArr;       
    }



}