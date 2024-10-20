// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


contract sendTransferCall{
    // address payable public getter = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    receive() external payable{}

    function checkBal() public view returns(uint){
        return address(this).balance;
    }

    event log(uint value);

    function SEND(address payable getter) public payable{
        // es tarah se ether ak account se dusre account me sath hi sath ja raha ahi
       emit log(msg.value);
       bool sent =  getter.send(msg.value);
       require(sent,"tran is fail");
    }

    function TRANSFER(address payable getter) public payable{
        getter.transfer(msg.value);
    }

    function CALL(address payable getter) public payable{
        emit log(msg.value);
        (bool sent, ) = getter.call{value:msg.value}("");

        require(sent,"tran is failed");
    }
}

contract GetETH{
    receive() external payable{}

    function checkBal() public view returns(uint){
        return address(this).balance;
    }
}