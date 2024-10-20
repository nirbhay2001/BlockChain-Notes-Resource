// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract functionIntro{
    uint age = 20;
    function add(uint _x, uint _y) public pure returns(uint){
        return _x + _y;
    }

    function changeAge() public{
        age+= 1;
    }

    function getage() public view returns(uint){
        return age;
    }

    function fun() internal{
        // code
    }
}

function dummy(uint _x) pure returns(uint){
    return _x*10;
    // ye function contract ke bahr likha gya hai; eski visibility bydefault internal hoti hai 
    // jo function contract ke bahr likha rahta hi unki visibility change nahi kar sakte hai
    // es function ka use hum apne contract me import karne ke liye use kar sakte hai
}