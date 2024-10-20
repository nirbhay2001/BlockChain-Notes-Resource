// SPDX-License-Identifier: Unlicensed

pragma solidity >=0.7.0;

contract wallet{
    // read
    string public name="wallet";
    uint num;


    // write
    function setValue(uint _num) public {
        num = _num;
    }

    //read
    function getvalue() public view returns(uint){
        return num;
    }


    // write
    function sendEthContract() public payable{

    }


    // read
    function contractBalance() public view returns(uint){
        return address(this).balance;
    }

    // write
    function sendEthBalance(address _user) public payable{
        payable(_user).transfer(msg.value); // es tarah se kisi contract ke balance ko kisi user ke account me transfer karte hai
    } 


    // read
    function accountBalance(address _address) public view returns(uint){
        return (_address).balance;
    }
}