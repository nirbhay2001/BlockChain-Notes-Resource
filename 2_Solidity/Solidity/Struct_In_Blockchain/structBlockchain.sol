// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

struct Emp{
        string name;
        uint age;
        address acc;
    }

contract structBlockchain{
    // struct keyword ka use hum contract ke bahr use kar sakte hai
    // struct ke help se khud ka data types bana sakte hai
    // struct data type me storage me hi store hota hai esliye jab local variable bnayenge to memory keyword ka use karna padega

    // struct Emp{
    //     string name;
    //     uint age;
    //     address acc;
    // }

    Emp public emp; 
    // emp ak variable hai jo jiska data type Emp hai 
    // emp ke ander ak address hai ye address us data ka hai jaha per name, age, acc hai



    constructor(string memory _name,uint _age,address _acc){
        emp.name = _name;
        emp.age = _age;
        emp.acc = _acc;
    }




    Emp[] public emps;
    // emps ak array hai jiska datatype Emp hai

    function setvalues() public {
        Emp memory emp1 = Emp("Nirbhay Gupta",21,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); 
        // emp = emp1;
        Emp memory emp2 = Emp({acc:msg.sender,name:"Mohit Gupta",age:23});
        Emp memory emp3;
        emp3.name = "Rohit Gupta";
        emp3.age = 24;
        emp3.acc = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;

        emps.push(emp1);
        emps.push(emp2);
        emps.push(emp3); 

        emps.push(Emp("Ritik",99,msg.sender)); 

        // Data update in Array
        Emp storage emp_temp1 = emps[1];
        emp_temp1.age = 31; 
        delete emp_temp1.acc; 

        delete emps[2];



        // es tarah se hum emp variable ke data ko update kar sakte hai
        Emp storage emp_temp = emp;
        // jab storage ke jagah per yadi memory rahta to emp ka data update nahi ho pata
        // emp ke ander ak address hai ye address us data ka hai jaha per name, age, acc hai
        // ab emp ka address emp_temp me aa jayega, ye address blockchain ke ander rakhe data ka address hita hai esliye hum emp ke data ko update kar pate hai


        emp_temp.name = "Harsh Gupta";

        // es tarah se bhi emp ke data ko update kar sakte hai
        // emp.name = "Harsh Gupta";

    }

}