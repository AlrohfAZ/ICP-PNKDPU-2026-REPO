const { ethers } = require("hardhat");

async function main() {

  // Sepolia Chainlink ETH/USD Price Feed
  const priceFeedAddress = "0x694AA1769357215DE4FAC081bf1f309aDC325306";

  const TaskManager = await ethers.getContractFactory("TaskManagerV3");

  console.log("Deploying TaskManagerV3...");

  const taskManager = await TaskManager.deploy(priceFeedAddress);

  await taskManager.waitForDeployment();

  const address = await taskManager.getAddress();

  console.log("TaskManagerV3 deployed to:", address);

  // wait for block confirmations
  console.log("Waiting for confirmations...");
  await taskManager.deploymentTransaction().wait(6);

  // verify contract
  console.log("Verifying contract...");
  await run("verify:verify", {
    address: address,
    constructorArguments: [priceFeedAddress],
  });

  console.log("Contract verified!");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});