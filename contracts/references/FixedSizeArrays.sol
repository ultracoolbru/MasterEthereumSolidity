// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract FixedSizeArrays {
    uint[3] public numbers = [1, 2, 3];

    function setElement(uint _index, uint _value) public {
        numbers[_index] = _value;
    }

    function getArrayLength() public view returns(uint) {
        return numbers.length;
    }

    bytes public b; // byte is an alias for bytes1 on older code
    bytes1 public b1;
    bytes2 public b2;
    //.. up to bytes32

    function setBytes() public {
        b = 'a';
        b1 = 'b';
        b2 = 'ab';
    }
}