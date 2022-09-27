// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract Deposit {
    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}