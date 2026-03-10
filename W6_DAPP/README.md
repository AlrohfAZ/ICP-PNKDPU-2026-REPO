# TaskManagerV3 Smart Contract

## Overview

TaskManagerV3 is a decentralized task management smart contract built on Ethereum.

Users can create, complete, and delete tasks directly on-chain while maintaining task ownership and access control.

The contract also integrates a Chainlink price feed oracle to demonstrate external data usage in smart contracts.

## Table of Contents

- [Features](#features)
- [Contract Structure](#contractstructure)
- [Events](#events)
- [Functions](#functions)
- [Tech Stack](#techstack)
- [Deployment](#deployment)
- [Testing](#testing)
- [License](#license)

## Features

• Create tasks with descriptions and deadlines  
• Task ownership enforced using access control  
• Complete tasks on-chain  
• Delete tasks  
• Fetch individual tasks  
• Retrieve tasks created by a user  
• Chainlink oracle integration for ETH price validation

## Contract Structure

### Task Struct

Each task contains:

- `id` — task identifier
- `owner` — address that created the task
- `description` — task description
- `deadline` — timestamp deadline
- `status` — task status (Pending / Completed)

## Events

• The contract emits events for frontend interaction:
• TaskAdded
• TaskCompleted
• TaskDeleted

• These events allow frontends to update UI state when transactions occur.

## Functions

### addTask

• Creates a new task.

• Parameters:
• string description
• uint256 deadline

Requirements:

• ETH price must be above `MIN_PRICE`
• Deadline must be in the future

### completeTask

• Marks a task as completed.
• Only the task owner can perform this action.

### deleteTask

• Deletes a task.
• Only the task owner can delete their task.

### getTask

• Returns the details of a task.

### getUserTasks

• Returns all task IDs created by a specific user.

### totalTasks

• Returns the total number of tasks stored in the contract.

## Tech Stack

• Solidity  
• Hardhat  
• Chainlink Price Feeds  
• Sepolia Testnet

## Deployment

• Deploy using Hardhat:
• npx hardhat run scripts/deploy.js --network sepolia

## Testing

• Run tests with:
• npx hardhat test

## License

- This project is licensed under MIT.
