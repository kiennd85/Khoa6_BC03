// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ifElse {

    function foo(uint score) public pure returns (string memory) {
        if (score > 8) {
            return 'A';
        } else if (score > 7) {
            return 'B';
        } else if (score >= 6) {
            return 'C';
        } else if (score >= 5) {
            return 'D';
        } else {
            return 'E';
        }
    }

}