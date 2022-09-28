// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17;

contract PayableReceiveFallback {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    fallback() external payable {}

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function send() public payable {
        uint i;
        i++;
    }

    function transfer(address payable _to, uint _amount) public returns(bool) {
        require(owner == msg.sender, "Transaction failed, not the owner.");
        if (_amount <= balance()) {
            _to.transfer(_amount);
            return true;
        } else {
            return false;
        }
     }
}

contract Deposit{
    address public owner;
     
    constructor(){
        owner = msg.sender;    
     }
     
    function sendEther() public payable{}
     
    function getBalance() public view returns(uint){
         return address(this).balance;
     }
 }