# TaskManager dApp Frontend

## Overview

This is the frontend for the TaskManagerV3 decentralized application.

The application allows users to interact with the TaskManager smart contract deployed on the Ethereum Sepolia test network.

Users can create, complete, and delete tasks directly from the UI using their Ethereum wallet.

## Table of Contents

- [Features](#features)
- [Tech Stack](#techstack)
- [Project Structure](#projectstructure)
- [Installation](#installation)
- [Running](#running)
- [Requirements](#requirements)
- [Smart Contract Integration](#smartcontractintegration)
- [Environment Setup](#environmentsetup)

## Features

• Connect wallet with MetaMask  
• Create tasks with deadlines  
• View tasks stored on-chain  
• Complete tasks  
• Delete tasks  
• Real-time blockchain interaction

## Tech Stack

Frontend:

• React  
• JavaScript  
• CSS

Blockchain Interaction:

• Ethers.js  
• MetaMask

Smart Contract:

• Solidity  
• Hardhat

Network:

• Ethereum Sepolia Testnet

## Project Structure

• src/
• App.js
• App.css
• TaskManagerABI.json

## Installation

• Clone the repository and install dependencies.
• npm install

## Running

• Start the development server:
• npm start

• The application will open at:
• http://localhost:3000

## Requirements

• Users must install MetaMask and connect to the Sepolia test network.

## Smart Contract Integration

The frontend connects to the deployed smart contract using:

• Contract Address
• ABI
• Ethers.js Provider

## Environment Setup

Ensure the contract address and ABI are updated in:
• src/TaskManagerABI.json
and
• App.js
