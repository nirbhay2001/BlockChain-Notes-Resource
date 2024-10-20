// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract inheritenceBlockchain1{
    function fun1() public pure returns(string memory){
        return "i'm in contract inheritenceBlockchain1";
    }

    function fun2() public pure returns(string memory){
        return "i'm in contract inheritenceBlockchain1";
    }

    function fun3() public pure virtual returns(string memory){
        return "i'm in contract inheritenceBlockchain1";
        // virtual keyword ki help se hum es function ko change kar sakte hai child contract me
        // virtual keyword se parent contract  se permission mil gya hai ki es function ko child contract me edit kar sakte hai
    }

    function fun4() public pure virtual returns(string memory){
        return "i'm in contract inheritenceBlockchain1";
    }
}


contract inheritenceBlockchain2 is inheritenceBlockchain1{

    function fun3() public pure override returns(string memory){
        return "i'm in contract inheritenceBlockchain2";
        
    }

    function fun4() public pure virtual override returns(string memory){
        return "i'm in contract inheritenceBlockchain3";
    }

}

contract inheritenceBlockchain3 is inheritenceBlockchain2{
    function fun4() public pure override returns(string memory){
        return "i'm in contract inheritenceBlockchain2";
    }
}