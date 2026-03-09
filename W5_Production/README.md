# TaskManagerV3 – Deployment & Testing

## Overview

TaskManagerV3 is a decentralized task management smart contract built on Ethereum. The contract allows users to create, complete, and delete tasks while enforcing ownership and integrating real-world ETH price data using Chainlink.

This version focuses on **production readiness**, including contract deployment, automated testing, and oracle integration.

## Table of Contents

- [Features](#features)
- [TechStack](#techstack)
- [Project Structure](#projectstructure)
- [Deployment](#deployment)
- [Testing](#testing)
- [Chainlink Integration](#chainlinkintegration)
- [Future Improvements](#futureimprovements)
- [License](#license)

## Features

- Create tasks with a description and deadline
- Task ownership enforcement
- Complete tasks
- Delete tasks
- Retrieve tasks by ID
- Retrieve tasks owned by a specific user
- ETH price validation using Chainlink price feeds

## TechStak

- Solidity
- Hardhat
- Ethers.js
- Chainlink Price Feeds
- Sepolia Testnet
- Mocha & Chai (Testing)

## Project Structure

contracts/
TaskManagerV3.sol
MockV3Aggregator.sol

scripts/
deploy.js

test/
test.js

hardhat.config.js

## Deployment

The contract is deployed using Hardhat.

```
npx hardhat run scripts/deploy.js --network sepolia
```

Deployment uses a Chainlink ETH/USD price feed to ensure ETH price conditions are met before task creation.

## Testing

Unit tests are written using Mocha and Chai.

Run tests:

```
npx hardhat test
```

Tests cover:

- Task creation
- Task completion
- Task deletion

A mock Chainlink price feed is used during testing to simulate oracle data.

## Chainlink Integration

The contract fetches ETH price data from Chainlink to validate that ETH price is above a defined minimum before allowing task creation.

```
AggregatorV3Interface priceFeed
```

This ensures the smart contract interacts with trusted off-chain data.

## Future Improvements

- Frontend DApp integration
- Event indexing
- Gas optimization
- Task pagination
- User task dashboards

## License

- This project is licensed under MIT.
