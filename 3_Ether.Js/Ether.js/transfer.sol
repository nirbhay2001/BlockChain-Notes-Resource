// SPDX-License-Identifier: Unlicensed

pragma solidity >=0.7.0;

contract transfer{
    address public owner;
    event transsactions(address indexed to, uint indexed amount);
    // event ki help se hum data ke filter karke show k ra sakte hai
    // event ko call hum hamesha ether.js ke doura hi kar sakte hai

    constructor(){
        owner = msg.sender;
    }

    function callOwner() public view returns(address){
        return owner;
    }

    function _transfer(address payable _to) public payable{
        _to.transfer(msg.value);
        emit transsactions(_to, msg.value);
    }
}