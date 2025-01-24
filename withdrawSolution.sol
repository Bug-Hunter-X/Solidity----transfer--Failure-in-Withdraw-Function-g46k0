```solidity
function withdraw(uint amount) public {
  require(balanceOf[msg.sender] >= amount, "Insufficient balance");
  uint256 balanceBefore = address(this).balance;
  (bool success, ) = payable(msg.sender).call{value: amount}('');
  require(success, "Transfer failed");
  require(address(this).balance == balanceBefore - amount, "Transfer failed");
  balanceOf[msg.sender] -= amount;
}
```
This improved version checks if the transfer was successful.  It uses the low-level `call` function and checks the return value for success or failure. The balance is also checked before and after the transfer.  Consider using a safer transfer method from a library like OpenZeppelin for production applications.