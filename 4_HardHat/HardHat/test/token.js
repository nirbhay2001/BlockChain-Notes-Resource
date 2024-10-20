const {expect} = require("chai");

// mocha --> ye framework hai, eska use testing ke liya kiya jata hai
// chai --> ye ak library hai


/*
syntax:
describe("contract_name contract", function(){
    describe --> ye contract ke bare me batata hai, contract_name ka contract hai
})
*/


/*
describe("Token contract",function(){
    it("Deployment should assign the total supply of tokens to the owner",async function(){
        // esko har ak function ke liye banan padega jisko test karna hai

        const [owner] = await ethers.getSigners();
        // console.log("Signers object:",owner);
    
    Certainly! ethers.getSigners(); is a piece of code that gets a list of Ethereum accounts that you can use in your program.

    I magine you have a wallet with multiple keys (like a set of keys to your house). ethers.getSigners(); is like a function that fetches a list of all those keys so you can use them to do things like open doors (send transactions) or access secure places (interact with the Ethereum blockchain). It gives you access to these keys/accounts so you can perform actions on the Ethereum network, like sending cryptocurrency or interacting with smart contracts.
        


        const Token = await ethers.getContractFactory("Token"); // instance contract

        The code ethers.getContractFactory("Token"); is like a special tool that helps you create new smart contracts for the Ethereum blockchain.

        Imagine you want to make many copies of a toy using a toy factory. This line of code is like telling the toy factory, "I want a new toy, and I want it to be based on the design of a toy called 'Token.'"

        So, ethers.getContractFactory("Token") prepares a way to make new copies of a smart contract named "Token" whenever you need them in your blockchain program. It's like setting up a factory for creating smart contracts.



        const hardhatToken = await Token.deploy(); // deploy contract

        The code await Token.deploy(); is like telling the smart contract factory, "Okay, now that you've set up the factory, actually create a new smart contract based on the design we discussed."

        It's the step where the factory takes the blueprint (the Token smart contract template) and makes a real, usable instance of that contract on the Ethereum blockchain. This new instance is ready to do its job, like handling transactions or storing data, just like how a real toy comes out of a toy factory ready to play with



        const ownerBalance = await hardhatToken.balanceOf(owner.address); // ownerBalance = 10000

        // console.log("Owner Address:",owner.address);
        expect(await hardhatToken.totalSupply()).to.equal(ownerBalance); // total Supply = 10000

    })

    it("Should transfer tokens between accounts",async function(){
        // esko har ak function ke liye banana padega jisko test karna hai

        const [owner,addr1,addr2] = await ethers.getSigners();
        // console.log("Signers object:",owner);

        const Token = await ethers.getContractFactory("Token"); // instance contract

        const hardhatToken = await Token.deploy(); // deploy contract

        // Transfer 10 tokens from owner to addr1
        await hardhatToken.transfer(addr1.address,10); // yaha per transaction owner ke account se kisi address addr1 wala ke  account me ho raha hai
        expect(await hardhatToken.balanceOf(addr1.address)).to.equal(10);

        // Transfer 5 tokens from addr1 to addr2
        await hardhatToken.connect(addr1).transfer(addr2.address,5); // yaha per transaction address addr1 se address addr2 ke account me ho raha hai
        expect(await hardhatToken.balanceOf(addr2.address)).to.equal(5)

    })


})
*/



describe("Token Contract",function(){
    let Token;
    let hardhatToken;
    let owner;
    let addr1;
    let addr2;
    let addrs;

    beforeEach(async function(){
        Token = await ethers.getContractFactory("Token");
        [owner,addr1,addr2,...addrs] = await ethers.getSigners();
        hardhatToken = await Token.deploy();
    })

    // beforeEach ak hook hai jo mocha framework provide karta hai

    describe("Deployment",function(){
        it("Should set the right owner",async function(){
            expect(await hardhatToken.owner()).to.equal(owner.address);
        })
        it("Should assign the total supply of tokens to the owner",async function(){
            const ownerBalance = await hardhatToken.balanceOf(owner.address);
            expect(await hardhatToken.totalSupply()).to.equal(ownerBalance);
        })
    })

    describe("Transactions",function(){
        it("Should transfer tokens between accounts",async function(){
            // owner account to addr1.address
            await hardhatToken.transfer(addr1.address,5);
            const addr1Balance = await hardhatToken.balanceOf(addr1.address);
            expect(addr1Balance).to.equal(5);


            await hardhatToken.connect(addr1).transfer(addr2.address,5);
            const addr2Balance = await hardhatToken.balanceOf(addr2.address);
            expect(addr2Balance).to.equal(5);
        })

        it("Should fail if sender does not have enough tokens",async function(){
            const initialOwnerBalance = await hardhatToken.balanceOf(owner.address);
            await expect(hardhatToken.connect(addr1).transfer(owner.address,1)).to.be.revertedWith("Not enought tokens"); // initially -> 0 tokens addr1
            expect(await hardhatToken.balanceOf(owner.address)).to.equal(initialOwnerBalance);
        })

        it("Should update balances after transfers",async function(){
            // it --> ye ak test hai
            const initialOwnerBalance = await hardhatToken.balanceOf(owner.address)
            await hardhatToken.transfer(addr1.address,5);
            await hardhatToken.transfer(addr2.address,10);

            const finalOwnerBalance = await hardhatToken.balanceOf(owner.address);
            expect(finalOwnerBalance).to.equal(initialOwnerBalance-15);

            const addr1Balance = await hardhatToken.balanceOf(addr1.address);
            expect(addr1Balance).to.equal(5);

            const addr2Balance = await hardhatToken.balanceOf(addr2.address);
            expect(addr2Balance).to.equal(10);
        })

        it("Should delete balances after transfer",async function(){
            const initialdeleteBalance = await hardhatToken.balanceOf(owner.address);
            expect(initialdeleteBalance).to.equal(initialdeleteBalance-20);

            const addr1Balance = await hardhatToken.balanceOf(addr1.address);
            expect(addr1Balance).to.equal(5);

            const adrr2Balance = await hardhatToken.balanceOf(addr2.address);
            expect(adrr2Balance).to.equal(15);
        })
    })
})