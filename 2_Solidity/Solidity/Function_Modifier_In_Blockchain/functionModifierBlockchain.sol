// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract functionModifierBlockchain{
     // Modifier ak special type function hai
     // modifier code reuse karne ki facility deta hai
    // ak contract ke ander bahut sara modifier ho sakte hai lekin constructor ak hi ho sakta hai

    modifier sameCode(){
        for(uint i=0; i<10; i++){
            //code
        }
        _;

        // code
    }

    function fun1() public pure sameCode returns(string memory){
        

        return "fun1 say hi";
    }

    function fun2() public pure sameCode returns(uint _x){
        

        _x = 20;
    }

    function fun3() public view sameCode returns(address){
       

        return msg.sender;
    }


    //

    address public owner = msg.sender;
    modifier onlyOwner(){
        require(owner == msg.sender, "Ypu are not the owner");

        _;
    } 
    // jis jis function me onlyOwner ka use karenge us function ko kewal owner hi access kar sakta hai

    function startAuction() public view onlyOwner{
        

        // code
    }

    function stopAuction() public view onlyOwner{
        

        // code
    }

    function checkState() public view onlyOwner{
        

        // code
    }




    // 

    uint public age = 30;
    modifier temp(uint _x){
        age = age+_x;
        _;
    }

    function changeAge(uint _y) public temp(_y){
        // sabse pahle changeAge function ke ander value aa raha hai phir uske bad temp modifier me pass ho ja raha hai, 
        // uske bad modifier me age ka value change ho ja raha hai
    }

}