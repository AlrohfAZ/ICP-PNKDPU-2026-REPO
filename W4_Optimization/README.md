# Task Manager V3

This project demonstrates an advanced version of a decentralized **Task Manager Smart Contract** built with Solidity.  
It introduces **price oracle integration, task ownership, deadlines, and access control**.

The project was developed as part of a **Web3 Smart Contract Development Internship**.

# Table of Contents

- Features
- Tech Stack
- Smart Contract
- Contract Functions
- Future Improvements
- License

# Features

### Week 3 Features

- Integration with Chainlink Price Feeds
- Conditional task creation based on ETH price
- Oracle data usage in smart contracts

### Week 4 Features

- Task ownership
- Access control using modifiers
- Task deadlines
- User task tracking
- Improved event logging

# Tech Stack

- Solidity
- Hardhat
- Chainlink Price Feeds

# Smart Contract

## TaskManagerV3

The contract allows users to create and manage tasks on-chain.

Each task contains:

- ID
- Owner
- Description
- Deadline
- Status (Pending / Completed)

# Contract Functions

### addTask()

Creates a new task.

Parameters:
string \_description
uint256 \_deadline

Conditions:

- ETH price must be above the minimum threshold.
- Deadline must be in the future.

### completeTask()

- Marks a task as completed.
- Only the **task owner** can call this function.
- function completeTask(uint256 \_id)

### deleteTask()

- Deletes a task using the **swap and pop pattern** to save gas.
- Only the **task owner** can delete their task.
- function deleteTask(uint256 \_id)

### getUserTasks()

- Returns all task IDs created by a specific user.
- function getUserTasks(address \_user)

### getLatestPrice()

Fetches the latest ETH price using Chainlink's price feed oracle.

# Key Solidity Concepts Demonstrated

- Structs
- Enums
- Events
- Mappings
- Modifiers
- Oracle integration
- Access control
- Gas-efficient array deletion

# Future Improvements

Possible future upgrades include:

- ERC20 reward tokens
- Task bounty system
- DAO-based task approval
- Frontend integration
- Subgraph indexing

# License

This project is licensed under the MIT License.
