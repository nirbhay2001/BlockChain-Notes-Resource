// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract global_Variable{
//   These are spacial variable which exist in global workspace and provide 
//   information about the blockchain and transaction properties. 
// ye predefine variable hota hai e.g msg.sender
// msg.sender --> ye account ko detail ko deta hai jis account se deploy huaa rahta hai
// msg.sender --> ye us account ke detail ko bhi deta hai jo mere smart contract se communicate karna chahta hai
// msg.sender --> jab koi smart contract ke function call hota us function ka bhi information deta hai

address public myadd = msg.sender;
uint public time = block.timestamp;
uint public diff = block.difficulty;
uint public gascost = tx.gasprice;
}