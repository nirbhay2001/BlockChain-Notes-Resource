// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract payableBlockchain{
    // payable ke doura contract ke kisi bhi address aur function ko payable banaya ja sakta hai,
    // address aur function ko payable banane ka matlab hai ki jis address ko payable banaya hai us address per hum ether ko send kar sakte hai
    // kisi function ko payable banane ka matlab hai ki payable function ke doura hi kisi contarct per ether ko store kar sakte hai, 
    // jo function payable nahi hai uske doura ether ko contract per store nahi kiya ja sakta hai

    // payable constructor
    constructor() payable{
        // eske doura deploy ke time hi kuchh ether ko contract per dal sakte hai
        // jab kabhi bhi contract per ak hi bar kewal ether send karna ho to hum payable function ka na use karke, payable constructor ka use karte ahi

    }

    // function payable
    function getEth() payable  public{
        // es function ko view and pure nahi bana sakte hai kyuki direct blockchain me changing ho raha hai
    }

    function checkBal() public view returns(uint){
        return address(this).balance;
        // ye function es contract me kitna ether hai usko return kar dega
        // this keyword se es contract ka address pata chalega
    }


    // Address payable
    address payable public owner = payable(msg.sender);
}