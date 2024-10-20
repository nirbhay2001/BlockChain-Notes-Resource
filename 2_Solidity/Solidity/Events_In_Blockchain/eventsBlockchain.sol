// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract eventsBlockchain{

    // event ka use tab karte hai jab data ko blockchain me dalna ho
    event balance(address account, string message, uint val);

    function setData(uint _val) public{
        // jo simple type function ya transaction function hota hai wah kuchh bhi return nahi karta hai
        emit balance(msg.sender, "has value", _val);
        // jab koi setData button per click karega to data blockchain ke ander chala jayega, 
        //us data me ether ka value hoga aur ye ether kiske doura send kiya ja raha hai uska account ka detail hoga aur hash value hoga

    }
}


contract chatApp{
    event chat(address indexed  _from, address _to, string message);

    function sendMess(address to_, string memory message_) public{
        emit chat(msg.sender,to_, message_);
    }
}