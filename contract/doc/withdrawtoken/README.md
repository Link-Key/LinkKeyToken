# Withdraw contract
## Interaction
1. query the fee of function 'withdraw' to send by the query function named 'queryFeeValue'.
2. call the payable function named 'withdraw'.
## Attention
1. ensure your token enough in the system.
2. don't send too much ether to the contract when you call the 'withdraw' function.
## Error code
001 --- WithdrawToken.sol --- withdraw --- gas fee not enough!
002 --- WithdrawToken.sol --- withdraw --- gas fee over limit!
003 --- WithdrawToken.sol --- withdraw --- send matic to fee collect address fail!
004 --- WithdrawToken.sol --- withdraw --- gas fee must less than max fee!
005 --- WithdrawToken.sol --- withdraw --- max fee must more than gas fee!
006 --- WithdrawToken.sol --- withdraw --- fee collect address is the zero address!
007 --- WithdrawToken.sol --- withdraw --- unit must more than zero!