const CBNLogContract = artifacts.require("../contract/CBNLogContract.sol");
// Then deploy
module.exports = (deployer, network, accounts) => {
  deployer.deploy(
    CBNLogContract, // initialize the constructor
    "CBN Log Files Data",
    accounts[0]
  );
};
