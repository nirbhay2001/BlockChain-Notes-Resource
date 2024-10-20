// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract fixedSizeArray{
    uint[5] public arr = [10,20,30,40,50];
    uint[5] public arr1;

    uint[5] arr2;
    constructor(){
        arr2 = [10,20,30,40,50];
    }

    function returnArray() public view returns(uint[5] memory){
        return arr2;
        // es tarah se kisi function se kisi array ko pass kar sakte hai
        // array return karne per gas kaphi jyada lagta hai esliye array ko return nahi karte hai
    }


    // yadi hame es array ka length aur es array ke kisi element ko update karna ho ya delete karna ho ya get karna ho ye sab kisi function ke ander hi kar sakte hai, 
    // ese contract ke ander aur function ke bahr nahi kar sakte hai
    // contract ke ander kewal state variable, function, and modifier hi bana sakte hai
    // array bhi string ki tarah bydefault storage me store hota hai

    function array() public view returns(uint){
        // get
        uint temp;
        temp = arr[3];

        // update
        // arr[2] = 3000;
        
        // delete
        // delete arr[4];

        // length
        uint len = arr.length;
        return len;
        
    }

    function arrayWithLoop(uint _x) public {
        for(uint i=0; i<arr.length; i++){
            arr1[i] = _x+i;
        }
    }

    function createArray() public pure returns(uint){
        uint[] memory arrMem = new uint[](3);
        // memory ke ander kewal fixed size array hi bana sakte hai, Dynamic array nahi bana sakte hai
        // es tarah se kisi function ke ander array create karte hai

        arrMem[0] = 33;
        arrMem[1] = 35;
        arrMem[2] = 40;
        
        return arrMem[0];
        // array return karne per gas kaphi jyada lagta hai esliye array ko return nahi karte hai
        // return arrMem;
    }


}