const {ethers} = require("ethers");

const provider = new ethers.providers.JsonRpcProvider('https://mainnet.infura.io/v3/3a482d89edd44acd871ff34ae623768f');

// https://mainnet.infura.io/v3/3a482d89edd44acd871ff34ae623768f --> ye mainnet api ka link hai




const queryBlockchain = async()=>{
    const block = await provider.getBlockNumber(); // esase pata chlta hai ki actualy me es time per koun sa block create huaa hai

    console.log("Current Block Number:", block);


    const balance = await provider.getBalance("0xABD093746D4259De0B17E818E8f131b9310570B3")
    console.log("Account Balance in BigNumber:",balance);

    const balanceEthers = ethers.utils.formatEther(balance);
    console.log("Account Balance in Ether:", balanceEthers);


};

queryBlockchain();