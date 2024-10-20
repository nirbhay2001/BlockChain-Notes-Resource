// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract strings{
    // String bydefault blockchain i.e contract storage me store hota hai , chahe local variable ho ya state variable ho
    // esliye string data type ko jab local variable banate hai to memory keyword ka use karna padta hai

    string public str = "gaurav"; // str state variable hai
    function checkstring() public pure{
        string memory name = "aman";

        // es function ko return nahi kar rahe hai esliye button click karne per dikh nahi raha hai
    }

    function checkstring2() public pure returns(string memory){
        string memory name2 = "Nirbhay Gupta";
        return name2;

        // es function ko return  kar rahe hai esliye button per click karne per dikh  raha hai
    }

    function checkstring3(string memory _str) public pure returns(string memory){
        string memory name3 = _str;
        return name3;
    }
}
