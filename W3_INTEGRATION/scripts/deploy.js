const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const priceFeedAddress = "0x694AA1769357215DE4FAC081bf1f309aDC325306";

    const TaskManagerV2 = await ethers.getContractFactory("TaskManagerV2");
    const taskManagerV2 = await TaskManagerV2.deploy(priceFeedAddress);
    await taskManagerV2.waitForDeployment();

    console.log("TaskManger deployed to:", deployer.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
