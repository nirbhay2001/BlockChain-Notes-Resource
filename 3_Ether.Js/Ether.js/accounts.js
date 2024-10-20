const {ethers} = require('ethers');

const RPC = 'https://mainnet.infura.io/v3/be7a4549c48b432daf4b614ab37c6c2c';// ye API ka link hai jo infura provide karta hai

const account1 = '0xABD093746D4259De0B17E818E8f131b9310570B3'; // ye public key hai account ka 

const privateKey = '04b4e8c039f7ca157e913af2c90301faa61ac9b6845d944be98f28da5a3ac9ba'; // ye private key hai account ka

const provider = new ethers.providers.JsonRpcProvider(RPC);

const wallet = new ethers.Wallet(privateKey,provider); // jab account ka balance check karna hota hai private key ki help se to es tarah se karte hai

async function checkBalUsingPublickey(){
    const bal = await provider.getBalance(account1) // ye ether coin ko wei ke form me return karta hai
    console.log(ethers.utils.formatEther(bal)) // ye ether ke wei form ko ether form me convert kar deta hai

    // es function ke doura kisi account ka balance check kar sakte hai public key ki help se
}

checkBalUsingPublickey();


async function checkBalUsingPrivatekey(){
    const bal = await provider.getBalance(account1);
    const AccDetail = await wallet;
    console.log(AccDetail);
    console.log(ethers.utils.formatEther(await wallet.getBalance()));

    // jab account ka balance check karna hota hai private key ki help se to es tarah se karte hai
}

checkBalUsingPrivatekey()

async function transferBal(){
    const bal = await provider.getBalance(account1);
    console.log(account1, ":", ethers.utils.formatEther(bal)); // ye balance show karega account1 ka

    console.log(await wallet.getAddress(), ":", ethers.utils.formatEther(await wallet.getBalance())); // ye us account ka balance show karega jis account ka hum private key use kar rahe hai
    

    const trans = await wallet.sendTransaction({
        to: account1,
        value: ethers.utils.parseEther('1') // parseEther ether ko wei ether me convert karta hai
        // sendTransaction function object ke format me argument leta hai
        // es function me hum ak account ke private key ki help se kisi dusre account balance send kar rahe hai us account ke public key ki help se
    })

    await trans.wait(); // esase jabtak transction complete nahi hoga tab tak koi kam nahi hoga

    const bal2 = await provider.getBalance(account1);
    console.log(account1, ":", ethers.utils.formatEther(bal2));

    console.log(await wallet.getAddress(), ":", ethers.utils.formatEther(await wallet.getBalance()));

    console.log(trans);

    
}

transferBal();
