const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TaskManagerV3", function () {

  let taskManager;
  let owner;
  let user;
  let mockPriceFeed;

  beforeEach(async function () {

    [owner, user] = await ethers.getSigners();

    // Deploy Mock Chainlink Price Feed
    const MockV3Aggregator = await ethers.getContractFactory("MockV3Aggregator");

    const decimals = 8;
    const initialPrice = 2000e8; // $2000 ETH price

    mockPriceFeed = await MockV3Aggregator.deploy(decimals, initialPrice);
    await mockPriceFeed.waitForDeployment();

    // Deploy TaskManagerV3 using mock price feed
    const TaskManagerV3 = await ethers.getContractFactory("TaskManagerV3");

    taskManager = await TaskManagerV3.deploy(await mockPriceFeed.getAddress());
    await taskManager.waitForDeployment();

  });

  it("Should allow user to create task", async function () {

    const deadline = Math.floor(Date.now() / 1000) + 3600;

    await taskManager.connect(user).addTask("Write Solidity", deadline);

    const task = await taskManager.getTask(0);

    expect(task.description).to.equal("Write Solidity");

  });

  it("Should allow owner to complete task", async function () {

    const deadline = Math.floor(Date.now() / 1000) + 3600;

    await taskManager.connect(user).addTask("Write Solidity", deadline);

    await taskManager.connect(user).completeTask(0);

    const task = await taskManager.getTask(0);

    expect(task.status).to.equal(1); // Completed

  });

  it("Should delete task", async function () {

    const deadline = Math.floor(Date.now() / 1000) + 3600;

    await taskManager.connect(user).addTask("Write Solidity", deadline);

    await taskManager.connect(user).deleteTask(0);

    const count = await taskManager.totalTasks();

    expect(count).to.equal(0);

  });

});