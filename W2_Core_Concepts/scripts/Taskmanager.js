const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const TaskManager = await ethers.getContractFactory("TaskManager");
    const taskManager = await TaskManager.deploy();
    await taskManager.waitForDeployment();

    console.log("TaskManger deployed to:", deployer.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
