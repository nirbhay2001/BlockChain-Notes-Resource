const {ethers} = require('ethers');
const transfer = require('./transfer.json');

const RPC = 'https://mainnet.infura.io/v3/be7a4549c48b432daf4b614ab37c6c2c';// ye API ka link hai jo infura provide karta hai 

const provider = new ethers.providers.JsonRpcProvider(RPC);
const contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

const ABI = transfer.abi;

async function readContract(){
    const contract = new ethers.Contract(contractAddress,ABI,provider);

    console.log(`The address of Owner: ${await contract.callOwner()}`);
}

readContract();