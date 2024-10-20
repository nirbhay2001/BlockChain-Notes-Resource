// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


contract sendTransferCall{
    // address payable public getter = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    receive() external payable{}

    function checkBal() public view returns(uint){
        return address(this).balance;
    }

    function SEND(address payable getter) public{
       bool sent =  getter.send(1000000000000000000);
       require(sent,"tran is fail");
    }

    function TRANSFER(address payable getter) public{
        getter.transfer(1000000000000000000);
    }

    function CALL(address payable getter) public {
        (bool sent, ) = getter.call{value:1000000000000000000}("");

        require(sent,"tran is failed");
    }
}