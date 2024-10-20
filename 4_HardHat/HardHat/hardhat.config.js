/** @type import('hardhat/config').HardhatUserConfig */
require("@nomiclabs/hardhat-waffle")

const ALCHEMY_API_KEY = "GKJu2QOB01TphtY1bZmGjsEd5Zf5bHhb";
const ROPSTEN_PRIVATE_KEY = "177871b6863c3c651ce083c723fa79692baeef107c29d105c2b8dbd70de18dea";
module.exports = {
  solidity: "0.8.9",

  networks:{
    ropsten:{
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY}`,
      accounts:[`0x${ROPSTEN_PRIVATE_KEY}`],
    }
  }
};


