// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract bytesInBlockchain{
    // 1 byte = 8bits
    // 1 hexadecimaldigit = 4bit
    // 1 byte = 2 hexadecimaldigit
    bytes5 public temp1;
    bytes7 public temp2;

    // bytes ke value ko bhi tin tarah se set kar sakte hai

    function setvalue() public{
        temp1 = "abcde";
        temp2 = "12abcde";
    }

    function getdigit() public view returns(bytes1){
        return temp1[2];
    }

    function getlen() public view returns(uint){
        return temp1.length;
    }
}