# TaskManagerV2

TaskManagerV2 is a decentralized task management smart contract built with Solidity.  
It allows users to create, complete, and delete tasks on-chain while using a Chainlink price feed to gate task creation based on ETH price.

## Table of Contents

- [Features](#features)
- [TechStack](#techstack)
- [Contracts](#contracts)
- [Chainlink Integration](#chainlinkintegration)
- [Main Functions](#mainfunctions)
- [Deployment](#deployment)
- [Future Improvements](#futureimprovements)
- [License](#license)

## Features

- Addition/Creation of a task.
- Completion of a task.
- Deletion of a task.
- Retrieves task details by index.
- ETH price validation using Chainlink oracle
- Event logging for off-chain monitoring

## TechStack

- Solidity
- Hardhat
- Chainlink Price Feeds
- Ethereum Smart Contracts

## Contracts

- [TaskManager](#taskmanager)

## TaskManager

Each task contains:

- `id` — Unique identifier
- `description` — Task text
- `status` — Pending or Completed

### Task Status

- Pending
- Completed

## Chainlink Integration

- The contract integrates Chainlink's ETH price feed.
- Users can only add a task if the ETH price is above: $1500
- This demonstrates how **external oracle data can influence smart contract logic**.

## Main Functions

### Add Task

```solidity
addTask(string memory description)
```

- Creates a new task if ETH price is above the required threshold.

### Complete Task

```solidity
completeTask(uint256 id)
```

Marks a task as completed.

### Delete Task

```solidity
deleteTask(uint256 id)
```

Removes a task using the gas-efficient swap-and-pop method.

### Get Task

```solidity
getTask(uint256 id)
```

Returns the full details of a task.

### Events

The contract emits events for off-chain tracking:

- TaskAdded
- TaskCompleted
- TaskDeleted

## Deployment

- Deploy the contract using Hardhat.

- Example constructor parameter:
  ETH / USD Price Feed Address

- Example (Sepolia): 0x694AA1769357215DE4FAC081bf1f309aDC325306

## Future Improvements

- Possible extensions:
- Task ownership
- Task rewards
- Task deadlines
- DAO task voting
- Frontend integration (React + Ethers.js)

## License

- This project is licensed under MIT.
