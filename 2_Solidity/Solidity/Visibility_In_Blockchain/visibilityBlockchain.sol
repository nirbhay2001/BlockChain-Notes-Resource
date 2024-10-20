// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract visibilityBlockchain1{
    // visibility state variable and function ke liye define hoti hai
    // Visibility char tarah ka hota hai
    // 1. public
    // 2. private
    // 3. Internal
    // 4. External

    // Gas cost in increasing order --> private > Internal > External > Public

    // Potential call char tarah ka hota hai
    // 1. Mycontract --> jab ak contarct ke ander bane state variable and function jab usi contract me use hota hai to wah Mycontract ke ander ata hai

    // 2. DerivedContract is Mycontract --> jab ak contarct se koi dusra contract derived hota hai to wah child contract kahlata hai, 
    //    esme parent contract ke state variable and function ka use child contract me kar sakte hai

    // 3. Another Contract --> jab ak hi file me 2 contract bana aur es dono contract ka koi aapas me relation nahi hai, 
    //    lekin jab ak contract ka state variable and function kisi dusre contract me use karte hai

    // 4. outside world --> 

    // private visibility --> eska use kewal Mycontract ke liye hi ho sakta hai i.e 
    //  jis variable aur function per private ko use karte hai to varriable aur function ka use usi contract me ho sakta hi jis contract me ye define hai

    // internal visibility --> eska use Mycontract and DerivedContract is Mycontract me hi kewal use kar sakte hai

    // external visibility --> eska use kabhi bhi state variable banane ke liye use nahi karte hai, 
    //                         esaka use kewal AnotherContract and outside world me hi kiya ja sakta hai

    // public visibility --> eska use sabhi tarah ke potential calling me use kiya ja sakta hai

    // public and external visibility ke liye button banta hai

    // Koi bhi state variable By default internal hota hai aur function By default public hota hai


    uint private x = 10; // only within the contract
    uint internal y = 100; // within the contract and derived contract
    uint public z = 1000; // everywhere

    function check1() private pure returns(string memory){
        return "private";
    }

    function check2() internal pure returns(string memory){
        return "internal";
    }

    function check3() external pure returns(string memory){
        return "external";
    }

    function check4() public pure returns(string memory){
        return "public";
    }

    function checkAll() public view returns(string memory){
        // return x;
        // return y;
        // return z;

        // return check1();
        // return check2();
        // return check3(); // show Error
        return check4();


    }



}


contract visibilityBlockchain2 is visibilityBlockchain1{

    // visibilityBlockchain2 child contract hai visibilityBlockchain1 ka

    // uint a = x; // show Error
    // uint a = y;
    // uint a = z;

    // string b = check1() // Show Error
    // string b = check2();
    // string b = check3(); // Show Error
    string b = check4();



}

contract visibilityBlockchain3{

    visibilityBlockchain1 obj = new visibilityBlockchain1();
    // uint public a = obj.y(); // Show Error
    // uint public a = obj.x(); // Show Error
    uint public a = obj.z();

    function anotherCaller() public view returns(string memory){
        return obj.check3();
    }
}