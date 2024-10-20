const {ethers} = require("ethers");

const provider = new ethers.providers.JsonRpcProvider(`https://goerli.infura.io/v3/3a482d89edd44acd871ff34ae623768f`);


// https://goerli.infura.io/v3/3a482d89edd44acd871ff34ae623768f --> ye goerli test net api ka link hai

const contractAddress = "0x0862400f549BD2f0204847e5B918BB5c6e6202D7";

const walletABI = [
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_user",
				"type": "address"
			}
		],
		"name": "sendEthBalance",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "sendEthContract",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_num",
				"type": "uint256"
			}
		],
		"name": "setValue",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "accountBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "contractBalance",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getvalue",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "name",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]


const contractIntraction = async() => {

const walletContract = new ethers.Contract(contractAddress,walletABI,provider); // esase ak object mil jayega jisase contract ke ander jo bhi variable hoga ya function hoga usko ham access kar payenge, es contract ke ander 3 aisi operation hai jo read ko perform karte hai, jisko provider ki help se access kar payenge 

    const contractName = await walletContract.name();
    console.log("Contract Name:",contractName);

    const num = await walletContract.getValue();
    console.log("Number Value:",String(num));

    const contractBalance = await walletContract.contractBalance();
    console.log("Contract Balance",contractBalance);
    const balethContract = ethers.utils.formatEther(contractBalance);
    console.log("Contract Balance",balethContract);

    const userBalance = await walletContract.accountBalance("0x236f244F49C6C8dA9D303AF291B1e7C2ACf4d508");
    // 0x236f244F49C6C8dA9D303AF291B1e7C2ACf4d508 --> ye wallet ke account1 ka public key hai
    console.log("User Balance",userBalance);
    const balethUser = ethers.utils.formatEther(userBalance);
    console.log("User Balance",balethUser);





}


contractIntraction();