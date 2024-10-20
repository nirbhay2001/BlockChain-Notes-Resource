// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract continueBreakKeyword{
    function loop() public pure returns(uint){
        uint count = 0;
        // continue and break ka use if else ke bahr bhi use kar sakte hai

        for(uint i=0; i<10; i++){
            if(i==8){
                continue;
            }
            count = count+5;
        }

        for(uint i=0; i<10; i++){
            if(i==6){
                break;
            }
            count = count+5;
        }


        return count;
    }
}