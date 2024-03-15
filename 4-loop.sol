// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Loop {

    function loop() public pure {
        for (uint i = 0; i < 10; i++) {
            if (i == 5) {
                continue;
            } 
            if (i == 7) {
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            //logic code
            j ++;
        }

    }


}