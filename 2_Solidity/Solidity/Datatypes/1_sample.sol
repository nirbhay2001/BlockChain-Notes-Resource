// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// data types : values and references
// values: bool, int, address, bytes etc
// references: Array etc 

contract valuesType{
    bool public boolTemp = true;
    uint public temp = 243; // eska use hamesha gas ke lenden me use hota hai, eska range: 0 to 2^256 - 1
    int public temp2 = 143; // eska range -2^255 to 2^255 - 1
    address public addr = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    // esme 20 bits tak data store ho sakta hai; esme data hexadecimal ke form me data store hota hai
    bytes32 public b3; // string ke jagah per eska use krte hai, ye bhi hexadecimal ko hi store krta hai

}

// 0xd9145CCE52D386f254917e481eB44e9943F39138 ye valueType contract ka address hai