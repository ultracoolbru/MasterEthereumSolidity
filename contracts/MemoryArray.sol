// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract MemoryArray {
    uint[] public members;

    function memoryFunction() public {
        uint[] memory memoryObject = new uint[](3);

        memoryObject[0] = 1;
        memoryObject[1] = 2;
        memoryObject[2] = 3;

        members = memoryObject;
    }

    function getMembersCountFromMemory() public view returns(uint) {
        return members.length;
    }

    function getMemoryMemberFromIndex(uint _index) public view returns(uint) {
        if (_index < members.length) {
            return members[_index];
        }

        return 0;
    }
}