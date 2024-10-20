// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract mappingBlockchain{
    // mapping ko contract se bahr nahi define kar sakte hai
    // mapping ko function ke ander bhi define nahi kar sakte hai i.e mapping ko function level per define nahi kar sakte hai
    // mapping ko contract level per define kar sakte hai

    mapping(uint=>string) public emp_id;
    // emp_id ka mapping ke wajah se ak table ban jayega jisme key aur value hoga
    function setId() public{
        emp_id[31] = "Nirbhay Gupta";
        emp_id[27] = "Mohit Gupta";
        emp_id[33] = "Rohit Gupta";
        emp_id[28] = "Aryan Gupta";
        emp_id[14] = "Harsh Gupta";

    }

    function getId(uint _id) public view returns(string memory){
        return emp_id[_id];
    }


}