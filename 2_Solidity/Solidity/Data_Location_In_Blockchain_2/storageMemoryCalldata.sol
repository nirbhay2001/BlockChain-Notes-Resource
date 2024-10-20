// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract storageMemoryCalldata{
    function Memory(string memory str,uint[] memory arr) public{
        getInMem(arr);
        // getInCall(arr); // show Error
    }

    function Calldata(string calldata str, uint[] calldata arr) public{
        getInMem(arr);
        getInCall(arr);
        // Calldata se memory me pass ho sakta hai lekin memory se Calldata me pass nahi ho sakta hai
        // storage se storage pass ho sakta hai data
        // storage se memory me bhi pass ho sakta hai data
        // Calldata se Calldata me pass ho sakta hai data,
        // Calldata se Calldata me jab array pass ho raha hai to koi new array create nahi ho raha hai wahi same to same array hai
        // jab Calldata se Memory me Array pass ho raha ahi to Memory me ak new array create ho raha hai esliye eska gas cost calldata se jyada hota hai
    }

    function getInMem(uint[] memory arr) public{

    }

    function getInCall(uint[] calldata arr) public{

    }
}