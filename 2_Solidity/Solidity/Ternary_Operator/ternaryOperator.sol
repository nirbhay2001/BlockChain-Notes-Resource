// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract ternaryOperator{
    function fun(uint _x) public pure returns(string memory){
        string memory val;

        val = _x>100 ? "greater than 100" : "equal or smaller than 100";
        return val;
    }
}