// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
//contract auto-distribute recieving ETH to two addresses immediately

contract NewProxy {  
    address payable private _feeAddrWallet1;
    address payable private _feeAddrWallet2;
    uint public balance;

    constructor(){
        _feeAddrWallet1 = payable(0x000000000000000000000000000000000000dEaD);
        _feeAddrWallet2 = payable(0x000000000000000000000000000000000000dEaD);
  }
    //immediately distributing
    receive() external payable {
        balance = address(this).balance;
        _feeAddrWallet1.transfer(balance/2);
        _feeAddrWallet2.transfer(balance/2);
        }
}