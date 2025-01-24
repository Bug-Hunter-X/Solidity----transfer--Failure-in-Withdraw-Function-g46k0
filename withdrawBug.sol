```solidity
function withdraw(uint amount) public {
  require(balanceOf[msg.sender] >= amount, "Insufficient balance");
  balanceOf[msg.sender] -= amount;
  payable(msg.sender).transfer(amount);
}
```
This code has a vulnerability.  If the `transfer` function fails (due to insufficient gas or other reasons), the `balanceOf` will be reduced, but the funds will not be sent. This results in a loss of funds for the user.