// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


/*

 1. It is executed when a non-existant function is called on the contract.
 2. It is required to be marked external.
 3. It has no name.
 4. It has No arguments
 5. It can not return any thing.
 6. It can be define one per contract.
 7. If not marked payable, it will throw exception if contract receives ether.
 8. It's main use is to directly send the ETH to contract

*/
contract fallbackReceiveBlockchain{

    event log(string _fun,address _sender,uint _val,bytes _data);

    fallback() external payable{
        // ye ether or data dono ko le sakta hai
        // receive kewal ether ko hi le sakta hai
        // es function ke help se direct hi es contract per ether ko get kiya ja sakta hai aur data bhi

        emit log("fallback", msg.sender, msg.value, msg.data);

        /* 
            msg.sender, msg.value, msg.data ye predefine global variable hai
        */

    }

    receive() external payable{
        // es function ke doura hamesha ether ko get hi kiya ja sakta hai es contract per esliye eske liye payable use hamesha karna padta hai
        // receive kabhi bhi data nahi le sakta ahi

        emit log("fallback", msg.sender, msg.value, "");
    }

    /*
        jab kabhi bhi fallback and receive dono ko ak hi sath define kar dete hai to us case me
        jab data+ether dono sath me send karenge to fallback ke doura accept kiya jayega
        lekin jab kewal ether ko send kiya jayega to receive de doura accept kiya jayega
    */


    function chechBal() public view returns(uint){
        return address(this).balance;
    }

}