// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract ByetsAndStrings {
    bytes public byteOne = 'byte';
    bytes2 public byteTwo = '22';
    string public stringOne = 'string';

    uint i = 0;

    function addElementToByte() public {
        // For some reason this is not working :-(
        //byteOne.push('new');
        //byteTwo.push(i);
    }

    function addElementToString() public {
        // Adding an element to a string is not possible.
    }
}