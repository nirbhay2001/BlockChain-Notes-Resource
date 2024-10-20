// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract immubilityBlockchain{
    // Immutable state variable ko 2 hi jagah initialize kiya ja sakta hai first inline aur second me deploy ke time per
    // constant state variable ke liye kewal inline hi initialize kiya ja sakta hai, kisi function me aur deploy ke time initialize karne per ye Error show krega
    // kisi bhi data type ko immutable bana sakte hai
    // jis variable ko constants bana dete hai usko bhi kabhi change nahi kar sakte hai, constant variable ko kewal inline hi define kar sakte hai
    // constants variable ki value ko user ke doura set nahi karwa sakte hai
    // immutable variable ko user ke doura set karwa sakte hai

    // address public immutable owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address public immutable owner;
    address public constant owner2 = address(1);
    address public owner3 = address(1);

    constructor(address _owner){
        owner = _owner;
    }

    function I() public view returns(address){
        return owner;
    }

    function C() public pure returns(address){
        // jab koi variable constant rahta hai , usko read karne ke liye bhi function ka type pure hi hona chahiye
        return owner2;
    }

    function S() public view returns(address){
        return owner3;
    }

    // function of cost in increasing order: C > I > S
}