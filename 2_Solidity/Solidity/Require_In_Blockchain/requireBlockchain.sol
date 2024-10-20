// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract requireBlockchain{
    // require ka use Error handling me kiya jata hai
    // require input validation me kam ata hai
    // require access control karta hai

    address public owner = msg.sender;
    uint public age = 25;

    function CheckRequire(uint _x) public{
        age = age + 5; // yaha per age ka value tab tak change nahi jab tak require wala condition true nahi hoga
        require(_x>2,"Value of x is less than 2"); // input validation
        // jab require wala condition false ho jata hai to gas ko return kar diya jata hai
        
    }
    function onlyOwner() public{
        require(owner == msg.sender,"You are note the owner");
        age = age-2;
    }

}