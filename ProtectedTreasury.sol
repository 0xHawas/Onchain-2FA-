// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./OnchainAuthTrap.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/// @title Treasury protected by OnchainAuthTrap
contract ProtectedTreasury {
    IERC20 public immutable token;
    OnchainAuthTrap public immutable trap;
    address public owner;

    constructor(address _token, address _trap) {
        token = IERC20(_token);
        trap = OnchainAuthTrap(_trap);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function withdraw(uint256 amount, uint256 authCode) external onlyOwner {
        require(trap.checkCode(authCode), "Invalid auth code");
        require(token.transfer(msg.sender, amount), "Transfer failed");
    }
}
