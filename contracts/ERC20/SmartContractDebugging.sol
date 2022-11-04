// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract MyContract {
    uint public myUint = 123;

    function setMyUint(uint newUint) public {
        myUint = newUint;
    }

    function getMyUnit() public view returns(uint) {
        return myUint;
    }
}