# Sample Math Project

This project demonstrates a basic Arithmetic operation.

## Table of Contents

- [Features](#features)
- [TechStack](#techstack)
- [Contracts](#contracts)
- [License](#license)

## Features

- Addition of two unsigned integers
- Multiplication of two unsigned integers
- Division of two unsigned integers

All functions are implemented as `pure` functions, meaning they do not read from or modify blockchain state.

## TechStack

- Solidity
- Hardhat

## Contracts

- [SimpleMath](#simplemath)

## SimpleMath

-This contract consists of 4 functions:

- A simple function for adding two integers.
  function add(uint256a, uint256 b) public pure returns(uint256 sum);
- A simple function for multiplying two integers.  
  function mult(uint256a, uint256 b) public pure returns(uint256 product);
- A simple function for dividing two integers.  
  function div(uint256a, uint256 b) public pure returns(uint256 result)

## License

- This project is licensed under MIT.
