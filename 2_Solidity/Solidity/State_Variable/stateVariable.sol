// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract stateVariable{
    // state variable contract ke ander aur function ke bahr define hota hai
    // state variable sidha blockchain and contract storage per store hota hai joki costly hai

    uint public salary;

    constructor(){
        salary=100;
        // constructor ak special function hai jo apne aap hi call ho jata hai
    }

    function setSalary() public{
        salary = 2000;
    }
}