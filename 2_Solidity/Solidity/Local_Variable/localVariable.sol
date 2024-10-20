// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract localVariable{
    // jo variable contract ke kisi function ke ander define hota hai wah local variable hota hai
    // local variable memory me store hota hai i.e RAM me store hota hai
    // local variable ke liye negilegible cost i.e gas lagta hai
    // local variable execution ke bad memory se delete ho jata hai

    uint public age;
    bool public b;
    address public newAdd;

    function fun(uint _x, bool _y, address _z) public returns(uint,bool){
        uint i = 29;
        bool b1 = true;
        i+= 29;
        b1 = false;


        age = _x;
        b = _y;
        newAdd = _z;

        return (i,b1);
    }
}