// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract loopBlockchain{
    // loop bhi contract level per kam nahi karte hai, ye function level per kam karte hai

    function loop() public pure returns(uint){
        uint count = 0;
        for(uint i=0; i<10; i++){
            count = count+5;
        }
        // return count;

        uint j=0;
        while(j<10){
            count = count+10;
            j++;
        }

        // return count;

        do{
            count = count+10;
            j++;
        }while(j<10);

        return count;
    }

}