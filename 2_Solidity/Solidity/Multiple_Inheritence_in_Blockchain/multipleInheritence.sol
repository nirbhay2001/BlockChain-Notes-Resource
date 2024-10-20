// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract multipleInheritence1{
    uint public a;

    constructor(){
        a = 100;
    }

    function fun1() public{
        a = 10;
    }
}

contract multipleInheritence2{
    uint public b;

    constructor(){
        b = 200;
    }

    function fun1() public{
        b = 20;
    }
}

