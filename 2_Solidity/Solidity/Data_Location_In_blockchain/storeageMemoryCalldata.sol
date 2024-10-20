// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract storageMemoryCalldata{
    // storage ak box hai jo state variable ko store karta hai, aur ye storage khud blockchain per hota hai
    // memory ke ander local variable store hote hai, ye RAM me aur stack me hota hai, ye blockchain per nahi jata hai esliye eska cost bahut kam hota hai
    /*
        kuchh data types By default storage me hi store hota hai jab es tarah ke data types ke variable ko local variable banana ho to 
        'memory' keyword ka use karna padta hai
    */
    // Calldata bhi RAM per hi hota hai
    /*
        Calldata ka use function input me hota hai, jaha jaha function input me 'memory' ka use karte hai waha waha per Calldata ka use kar sakte hai 
        kyuki eska gas cost bahut kam hota hai
    */
    // jis data ko 'Calldata' me dal dete hai to us data ko change nahi kar sakte ahi
    // Gas cost in increasing order : Calldata > Memory > Storage

    uint[] public arr = [1,3,7,9,22];


    function Storage() public{
        uint[] storage arrs = arr;
        // arrs me arr ko photocopy nahi aya hai, arrs ke data ko change kerne per arr ka data change ho jayega
        arrs[3] = 99;
    }

    function Memeory() public view{
        uint[] memory arrm = arr;
        // arrm me arr ke data ka photocopy aya hai, arrm me data ko change karne se arr ke data chnge nahi hoga
        arrm[1] = 192;
    }

}