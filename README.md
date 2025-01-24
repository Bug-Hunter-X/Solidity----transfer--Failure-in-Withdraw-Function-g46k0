# Solidity Withdraw Function Vulnerability

This repository demonstrates a common vulnerability in Solidity smart contracts: improper handling of the `transfer` function's potential to revert.  The `withdraw` function, as initially written, doesn't handle the case where `transfer` fails. This can lead to a loss of funds for users.

The `withdrawBug.sol` file contains the vulnerable code.  The `withdrawSolution.sol` file presents a corrected version using `safeTransfer` or a similar mechanism.

**Vulnerability:** The original `withdraw` function subtracts funds from the user's balance (`balanceOf`) *before* attempting to transfer them. If the `transfer` fails (e.g., due to insufficient gas), the user's balance is incorrectly reduced, but they don't receive their funds.