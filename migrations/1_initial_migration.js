const Migrations = artifacts.require("Migrations");
const bus_safe = artifacts.require("bus_safe");


module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(bus_safe);
};
