// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract DynamicSizeArray {
    uint[] public members;

    function getLength() public view returns(uint) {
        return members.length;
    }

    function addElement(uint _item) public {
        members.push(_item);
    }

    function getElement(uint _index) public view returns(uint) {
        if (_index < members.length) {
            return members[_index];
        }
        return 0;
    }

    function removeElement() public {
        members.pop();
    }
}