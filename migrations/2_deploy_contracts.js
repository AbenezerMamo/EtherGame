var BotFactory = artifacts.require("BotFactory");

module.exports = function(deployer) {
  deployer.deploy(BotFactory);
};