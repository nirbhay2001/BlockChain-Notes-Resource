// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


/*
       1. payable function, payable contructor,  fallback and receive ki help se hum kisi contract per ether ko store kar sakte hai
       2. Send, Transfer, Call ki help se hum ak contract se kisi dusre contract me ether ko send kar sakte hai
          aur eske help se ak contract se kisi dusre ke account me ether ko bhej sakte hai
       3. Send --> Send ka gas limit 2300 hota hai, yadi es gas limit se jdaya ka operation raha to us case me ye fail ho jata hai
           jab operation fail ho jata hai to ye gas ko return bhi nahi karta hai esliye Transfer aur Call ko use kiya jata ahi
           jab opertaion fail ho jata hai to es operation ke douran jo bhi state variable me change hota hai to wah revert nahi ho pata hai
           esliye eska use require ke sath use karte hai, jab send ke sath require ka use karte hai to jab operation fail ho jata hai to bachha gas wapas aa jata hai
            ye hamesha true ya false ko return karta hai; true --> success, false --> fail
        4.  Transfer --> eska bhi gas limit 2300 hota hai, lekin ye state variable ke change ko phir se pahle jaisa kar deta hai aur bache gas ko bhi return kar deta 
            hai. ye sara kam khud se hi kar deta hai

        5.  Call --> esme hum gas limit ko decide kar sakte hai.ye bool aur sath hi sath byte data ko return karta hai. 
            eske sath bhi require ka use krna padta hi kyuki Send wala hi problem esme bhi hai
            
*/

contract SendTransferCallBlockchain{
    address payable public getter = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);

    receive() external payable{}

    function checkBal() public view returns(uint){
        return address(this).balance;
    }

    function SEND() public{
       bool sent =  getter.send(1000000000000000000);
       require(sent,"tran is fail");
    }

    function TRANSFER() public{
        getter.transfer(1000000000000000000);
    }

    function CALL() public {
        (bool sent, ) = getter.call{value:1000000000000000000}("");

        require(sent,"tran is failed");
    }
}