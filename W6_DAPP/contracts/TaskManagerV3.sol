// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract TaskManagerV3 {

    enum TaskStatus {
        Pending,
        Completed
    }

    struct Task {
        uint256 id;
        address owner;
        string description;
        uint256 deadline;
        TaskStatus status;
    }

    uint256 public constant MIN_PRICE = 0;

    AggregatorV3Interface internal priceFeed;

    // Task storage
    Task[] public tasks;

    // Mapping user => tasks they created
    mapping(address => uint256[]) public userTasks;

    event TaskAdded(uint256 id, address owner, string description, uint256 deadline);
    event TaskCompleted(uint256 id, address owner);
    event TaskDeleted(uint256 id, address owner);

    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    /**
     * @dev Fetch latest ETH price from Chainlink
     */
    function getLatestPrice() public view returns (int) {
        (, int price,,,) = priceFeed.latestRoundData();
        return price;
    }

    /**
     * @dev Modifier to check task ownership
     */
    modifier onlyTaskOwner(uint256 _id) {
        require(_id < tasks.length, "Task does not exist");
        require(tasks[_id].owner == msg.sender, "Not task owner");
        _;
    }

    /**
     * @dev Adds a new task.
     * @param _description The short text description of the task.
     */
    function addTask(string memory _description, uint256 _deadline) public {

        int price = getLatestPrice();

        require(price > 0, "Invalid price feed");
        require(uint256(price) > MIN_PRICE, "ETH price too low");
        require(_deadline > block.timestamp, "Invalid deadline");

        uint256 taskId = tasks.length;

        tasks.push(
            Task({
                id: taskId,
                owner: msg.sender,
                description: _description,
                deadline: _deadline,
                status: TaskStatus.Pending
            })
        );

        userTasks[msg.sender].push(taskId);

        emit TaskAdded(taskId, msg.sender, _description, _deadline);
    }

     /**
     * @dev Completes a given task.
     * @param _id The index of an existing task in the tasks array.
     */
    function completeTask(uint256 _id) public onlyTaskOwner(_id) {

        require(tasks[_id].status == TaskStatus.Pending, "Already completed");

        tasks[_id].status = TaskStatus.Completed;

        emit TaskCompleted(_id, msg.sender);
    }

    /**
     * @dev Deletes a given task.
     * @param _id The index of an existing task in the tasks array.
     */
    function deleteTask(uint256 _id) public onlyTaskOwner(_id) {

        address owner = tasks[_id].owner;

        tasks[_id] = tasks[tasks.length - 1];
        tasks[_id].id = _id;

        tasks.pop();

        emit TaskDeleted(_id, owner);
    }

    /**
     * @dev A getter function to provide all the details of a task.
     * @param _id The index of an existing task in the tasks array.
     * @return The details of the task.
     */
    function getTask(uint256 _id) public view returns (Task memory) {

        require(_id < tasks.length, "Task does not exist");

        return tasks[_id];
    }

    /**
     * @dev Get tasks owned by a user
     * @param _user The index of an existing task in the tasks array.
     */
    function getUserTasks(address _user) public view returns (uint256[] memory) {
        return userTasks[_user];
    }

    /**
     * @dev Total number of tasks
     */
    function totalTasks() public view returns (uint256) {
        return tasks.length;
    }
}