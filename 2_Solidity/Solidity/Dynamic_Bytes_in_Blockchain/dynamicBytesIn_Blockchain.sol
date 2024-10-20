// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract dynamicBytesInBlockchain{
    bytes public temp;

    constructor(){
        temp = "123abc45";
    }

    function pushElement() public {
        temp.push('c');
    }

    function popElement() public{
        temp.pop();
    }

    function getlength() public view returns(uint){
        return temp.length;
    }

    function getElement(uint _idx) public view returns(bytes1){
        return temp[_idx];
    }

}