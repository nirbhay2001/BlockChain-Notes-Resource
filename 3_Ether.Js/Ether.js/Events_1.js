const {ethers} = require('ethers');
const transfer = require('./transfer.json');

const RPC = 'https://mainnet.infura.io/v3/be7a4549c48b432daf4b614ab37c6c2c';// ye API ka link hai jo infura provide karta hai 

const provider = new ethers.providers.JsonRpcProvider(RPC);
const contractAddress = "0xd9145CCE52D386f254917e481eB44e9943F39138";

const ABI = transfer.abi;

async function readContract(){
    const contract = new ethers.Contract(contractAddress,ABI,provider);

    const block = await provider.getBlockNumber();

    const transctions = await contract.queryFilter('transactions',block-20,block)

    transctions.map((item) => {
        console.log(item.args.to, ":", ethers.utils.formatEther(item.args.amount))
    })
    // console.log(transctions)
}

readContract();