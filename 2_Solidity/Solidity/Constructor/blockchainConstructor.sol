// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract blockchainConstructor{
    // ak contract me kewal ak hi constructor ho sakta hai
    // constructor ak tarah ka function hota hai, ye aisa function hai jab smart contract create hota hai to ye sabse pahel call hone wala function hai
    // eska use smart conract ke owner ko set karne ke liye kiya jata hai ya state variable ko initialize karne ke liye use kiya jata hai
    // state variable ko initialize karne ke liye tin tarike hote hai 
    // pahle state variable banate time hi initialize kar sakte hai, dusra constructor ke doura, tisra function ke doura

     uint public age;
     address public owner;
     string public name;

     constructor(string memory _name, uint _age, address _owner){
        //  age = 20;
        age = _age;
        owner = _owner;
        name = _name;

        // jab constructor me as argument koi value lete hai to ye deploy ke time hi es value ko dena padega as input, nahi to samart contract deploy nahi hoga 
     }
}

