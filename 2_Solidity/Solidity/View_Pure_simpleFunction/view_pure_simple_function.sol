// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract view_pure_simple_function{ 

    // kisi bhi contract me function 3 type ke hote hai --> 1. view, 2. pure, 3. simple
    // Gas cost in increasing order --> pure > view > simple

    // view --> ye read only karta hai;
    // ye blockchain ke ander, statevariable, global variable ko kewal read karta hai usko change nahi karta hai i.e write nahi karta hai

    // pure --> ye na to read karta hai aur nahi write karta hai

    // simple function --> ye state variable ko change kar sakte hai

    // jo simple type function ya transaction function hota hai wah kuchh bhi return nahi karta hai

    // jab kabhi bhi state variable aur blockchain me kuchh bhi write karna ho to simple function ka use karte hai
    // jab kabhi bhi state variable ko read i.e access karna ho to view ka use karte hai
    // jab kabhi bhi state variable ko n to read karna hai aur nahi write karna hai us case me pure ka use karte hai


    uint public age = 20;
    function viewFunc() public view returns(uint){
        return age;
    }

    function pureFunc1() public pure returns(uint){
        return 1;
    }

    function pureFunc2(uint _x) public pure returns(uint){
        return _x;
    }

    function simpleFunc() public{
        age = age + 10;
        // yaha per age ka value read bhi ho raha hai aur age ka value write bhi ho raha hai
    }

    function dummy() public view returns(uint){
        return age+10;
        // yaha per kewal view type function age ko read kar raha hai , us age me koi change nahi kar raha hai; 
        // ye kewal age ko read karke usme 10 ko add kiya hai kewal
    }
}