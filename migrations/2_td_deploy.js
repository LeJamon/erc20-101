const Str = require('@supercharge/strings')
// const BigNumber = require('bignumber.js');

var XpGzb = artifacts.require("XpGzb.sol");

module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
        await deployXpGzb(deployer, network, accounts); 
        await deployRecap(deployer, network, accounts); 
    });
};

async function deployXpGzb(deployer, network, accounts) {
	XpGzb = await XpGzb.new("XpGzb","XpGzb",web3.utils.toBN("594727662000000000000000000")); 
    deployer.deploy(XpGzb)
}


async function deployRecap(deployer, network, accounts) {
	console.log("XpGzb " + XpGzb.address)
}


// truffle run verify ERC20TD@0x09f14a40Fd672B5B056FF8b5c343498452CAC4b2 --network goerli
// truffle run verify evaluator@0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5 --network goerli
