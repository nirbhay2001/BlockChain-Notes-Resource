// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract revertAssertBlockchain{

    // Revert bhi require ki tarah hi kam karta hai, esme ak extra function hai ki esme custom error likh sakte hai
    // assert ka use bug check karne ke liye kiya jata hai aur security ke liye kiya jata hai
    address public owner = msg.sender;
    uint public age = 25;

    function CheckRequire(uint _x) public{
        age = age + 5; // yaha per age ka value tab tak change nahi jab tak require wala condition true nahi hoga
        require(_x>2,"Value of x is less than 2"); // input validation
        // jab require wala condition false ho jata hai to gas ko return kar diya jata hai
        
    }

    error throwError(string,address); // custom error

    function CheckRevert(uint _x) public {
        age = age +5;
        if(_x<2){
            // revert("value of x is less than 2");
            revert throwError("value of x is less than 2",msg.sender);
        }
    }

    function onlyOwner() public{
        // require(owner == msg.sender,"You are note the owner");

        if(owner!=msg.sender){
            revert("You are note the owner");
        }
        age = age-2;
    }

    // Assert
    function checkOwnership() public view{
        assert(owner != 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }


}