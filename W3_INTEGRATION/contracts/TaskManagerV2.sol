// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Import Chainlink price feed interface to access external price data
import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



contract TaskManagerV2 {
    // Enum used to track the state of a task
    enum TaskStatus {
        Pending,
        Completed
    }
    // Structure representing a task
    struct Task {
        uint256 id;
        string description;
        TaskStatus status;
    }
    // Minimum ETH price required to add a task
    // Chainlink price feeds return prices with 8 decimals
    uint256 public constant MIN_PRICE = 1500 * 1e8;
    // Dynamic array storing all tasks
    Task[] public tasks;
    // Chainlink price feed contract interface
    AggregatorV3Interface internal priceFeed;

    // Events emitted for frontend/off-chain tracking
    event TaskAdded(uint256 id, string description, TaskStatus status);
    event TaskCompleted(uint256 id);
    event TaskDeleted(uint256 id);

    // Constructor sets the Chainlink price feed address
    constructor(address _priceFeed) {
        priceFeed = AggregatorV3Interface(_priceFeed);
    }

    /**
     * @dev Fetch the latest ETH price from Chainlink
     */
    function getLatestPrice() public view returns(int) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return price;
    }

    /**
     * @dev Adds a new task.
     * @param _description The short text description of the task.
     */
    function addTask(string memory _description) public {
        int price = getLatestPrice();
        require(price > 0, "Really???");
        require(uint256(price) > MIN_PRICE, "ETH Price too low!");
        uint256 taskId = tasks.length;
        tasks.push(
            Task({
                id: taskId,
                description: _description,
                status: TaskStatus.Pending
            })
        );
        emit TaskAdded(taskId, _description, TaskStatus.Pending);
    }

    /**
     * @dev Completes a given task.
     * @param _id The index of an existing task in the tasks array.
     */
    function completeTask(uint256 _id) public {
        require(_id < tasks.length, "Task does not exist");
        tasks[_id].status = TaskStatus.Completed;
        emit TaskCompleted(_id);
    }

    /**
     * @dev Deletes a given task.
     * @param _id The index of an existing task in the tasks array.
     */
    function deleteTask(uint256 _id) public {
        require(_id < tasks.length, "Task does not exist");
        tasks[_id] = tasks[tasks.length - 1];
        tasks[_id].id = _id;
        tasks.pop();
        emit TaskDeleted(_id);
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
}
