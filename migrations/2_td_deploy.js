const Str = require('@supercharge/strings')
// const BigNumber = require('bignumber.js');

var TDToken = artifacts.require("XpGzb.sol");


module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployErc20(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts); 
    });
};

async function deployErc20(deployer, network, accounts) {
	Q2contract = await TDToken.new("7bZpW","7bZpW",web3.utils.toBN("581502946000000000000000000"))
}

async function deployRecap(deployer, network, accounts) {
	console.log("7bZpW : " + Q2contract.address)
}

//Nb : truffle migrate --f 2 --to 2 --network goerli