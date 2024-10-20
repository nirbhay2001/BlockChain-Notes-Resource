// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract enumBlockchain{
    // enum ak user define data types hai
    // enum ki help se smart contract ke maintences easy ho jati hai
    //enum ki help se readability badh jati hai
    // enum ke use se error hone ki chance kam ho jati hai

    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancel

    }

    Status public status;

    function getStatus() public view returns(Status){
        return status;
    }

    function setStatus(Status _status) public{
        status = _status;
    }

    function reset() public{
        delete status;
    }

}