// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TaskManager {
    enum TaskStatus {
        Pending,
        Completed
    }

    struct Task {
        uint256 id;
        string description;
        TaskStatus status;
    }

    Task[] public tasks;

    event TaskAdded(uint256 id, string description, TaskStatus status);
    event TaskCompleted(uint256 id);
    event TaskDeleted(uint256 id);

    function addTask(string memory _description) public {
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

    function completeTask(uint256 _id) public {
        require(_id < tasks.length, "Task does not exist");
        tasks[_id].status = TaskStatus.Completed;
        emit TaskCompleted(_id);
    }

    function deleteTask(uint256 _id) public {
        require(_id < tasks.length, "Task does not exist");
        tasks[_id] = tasks[tasks.length - 1];
        tasks[_id].id = _id;
        tasks.pop();
        emit TaskDeleted(_id);
    }

    function getTask(uint256 _id) public view returns (Task memory) {
        require(_id < tasks.length, "Task does not exist");
        return tasks[_id];
    }
}
