const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("TaskManager", function () {
    let TaskManager;
    let taskManager;

    beforeEach(async function () {
        TaskManager = await ethers.getContractFactory("TaskManager");

        taskManager = await TaskManager.deploy();

        await taskManager.waitForDeployment();

        await taskManager.addTask("Wash clothes");
    });

    describe("Adding task", function (){
        it("Should add a task to the manager", async function () {
            const task = await taskManager.getTask(0);
            expect(task.description).to.equal("Wash clothes");
            expect(task.status).to.equal(0); // Pending
        });
    });

    describe("Completing task", function () {
        it("Should complete a given task", async function () {
            await taskManager.completeTask(0);
            const task = await taskManager.getTask(0);
            expect(task.status).to.equal(1); // Completed
        });
    });

    describe("Getting task", function () {
        it("Should get the details of a given task", async function () {
            const task = await taskManager.getTask(0);
            expect(task.id).to.equal(0);
            expect(task.description).to.equal("Wash clothes");        
        });
    });

    describe("Deleting task", function () {
        it("Should delete a given task", async function () {
            const task = await taskManager.getTask(0);
            await taskManager.deleteTask(0);
        });
    });
});