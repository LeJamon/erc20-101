const erc20 = artifacts.require("XpGzb.sol"); 

module.exports = function(deployer, network, accounts){
    deployer.deploy(erc20);  
}