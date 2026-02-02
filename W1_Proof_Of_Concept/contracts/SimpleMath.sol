// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleMath {
    // A basic additional function that takes in two integers as parameters and returns the sum.
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 sum = a + b;
        return sum;
    }

    // A basic multiplication function that takes in two integers as parameters and returns the product.
    function mult(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 product = a * b;
        return product;
    }

    // A basic division function that takes in two integers as parameters and returns the result.
    function div(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 result = a / b;
        return result;
    }
}
