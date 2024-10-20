// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract dynamicSizeArray{
    // Dynamic array memory ke ander nahi ho sakte hai
    uint[] public arr = [10,299,3432,434,34,32,1];

    function returnArray() public view returns(uint[] memory){
        return arr;
    }

    function fun() public{
        // get
        uint temp = arr[3];

        // update
        arr[4] = 222; // [10,299,3432,434,222,32,1]

        // delete
        delete arr[1]; // [10,0,3432,434,222,32,1]

        // length
        uint len = arr.length;

        // push
        arr.push(111); // [10,0,3432,434,34,32,1,111]
        

        // pop
        arr.pop(); // ye array ke last element ko pop krta hai
    }
}