# Sample TaskManager Project

This project demonstrates a basic on-chain Task Manager implemented in Solidity.  
It is designed to practice core Solidity concepts such as structs, enums, events, and dynamic storage arrays.

## Table of Contents

- [Features](#features)
- [TechStack](#techstack)
- [Contracts](#contracts)
- [License](#license)

## Features

- Addition/Creation of a task.
- Completion of a task.
- Deletion of a task.
- Retrieves task details by index.

## TechStack

- Solidity
- Hardhat

## Contracts

- [TaskManager](#taskmanager)

## TaskManager

The `TaskManager` contract manages tasks using a dynamic array.  
Each task consists of:

- An ID (array index)
- A description
- A status (`Pending` or `Completed`)

-This contract consists of 4 functions:

- A function for adding a task.
  function addTask(string memory \_description) public;
- A function for completing a task.  
  function completeTask(uint256 \_id) public;
- A function for deleting a task.  
  function deleteTask(uint256 \_id) public;
- A function for getting task details.  
  function getTask(uint256 \_id) public view returns(Task memory);

## License

- This project is licensed under MIT.
