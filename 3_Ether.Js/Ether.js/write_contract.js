const {ethers} = require('ethers');
const transfer = require('./transfer.json');

const RPC = 'https://mainnet.infura.io/v3/be7a4549c48b432daf4b614ab37c6c2c';// ye API ka link hai jo infura provide karta hai 

const account1 = '0xABD093746D4259De0B17E818E8f131b9310570B3'; // ye public key hai account ka 

const privateKey = '04b4e8c039f7ca157e913af2c90301faa61ac9b6845d944be98f28da5a3ac9ba'; // ye private key hai account ka

const provider = new ethers.providers.JsonRpcProvider(RPC);

const wallet = new ethers.Wallet(privateKey,provider);

const contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

const ABI = transfer.abi;

async function writeContract(){
    const contract = new ethers.Contract(contractAddress,ABI,wallet);

    console.log(`${account1}: ${ethers.utils.formatEther(await provider.getBalance(account1))}`) // ye account ka balance show karega

    console.log(`${await wallet.getAddress()} : ${ethers.utils.formatEther(await wallet.getBalance())}`) // ye bhi account ka balance hi show karega

    // write in blockchain
    const tx = await contract._transfer(account1,{

        value: ethers.utils.parseEther('0.25')
        // es tarah se kisi contract per hum write kar sakte hai , jo bhi hum write karte hai o blockchain me write hota hai, jiske liye kuchh gas cost dena padta hai

    })
    await tx.wait();


    console.log(`${account1}: ${ethers.utils.formatEther(await provider.getBalance(account1))}`) // ye account ka balance show karega

    console.log(`${await wallet.getAddress()} : ${ethers.utils.formatEther(await wallet.getBalance())}`)

    console.log(tx);

    
}

writeContract();