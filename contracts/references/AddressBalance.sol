// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Deposit {
    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}