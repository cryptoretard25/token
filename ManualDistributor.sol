// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
//contract manual distributing recieved ETH to two addresses when someone call distribute() function

contract NewProxy {  
    //set payable variables 
    address private _feeAddrWallet1;
    address private _feeAddrWallet2;
    uint public balance;

    //assign
    constructor(address feeAddrWallet1, address feeAddrWallet2){
        _feeAddrWallet1 = payable(feeAddrWallet1);
        _feeAddrWallet2 = payable(feeAddrWallet2);
  }
    //external function, updating contract balance
    receive() external payable {
        distribute()
        }
    
    //manual distributing func
    function distribute() private {
        balance = address(this).balance;
        _feeAddrWallet1.transfer(balance/2);
        _feeAddrWallet2.transfer(balance/2);
    }
}
