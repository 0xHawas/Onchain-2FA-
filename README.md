# Onchain-2FA-
By integrating Drosera's traps onchain and tweaking it's purpose to serve as an Onchain 2 Factor Authentication Mechanism

# Auto-Rotating Onchain Authentication Trap Example

## Overview
This example shows how to use an auto-rotating 6-digit authentication code as an on-chain security layer for protected treasury withdrawals.

## Components
- **OnchainAuthTrap.sol** — Generates a new 6-digit code every N blocks
- **ProtectedTreasury.sol** — Holds ERC20 tokens, requires valid code for withdrawals
- **TestToken.sol** — Simple ERC20 token for testing
- **DeployAuthTrap.s.sol** — Foundry deployment script
- **AuthTrap.t.sol** — Foundry test

## How It Works
1. Trap auto-generates a new auth code every `rotationInterval` blocks
2. Treasury withdrawals require correct current code
3. Codes are derived from block data for unpredictability

