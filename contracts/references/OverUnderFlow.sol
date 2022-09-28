// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract OverUnderFlow {
    uint public price;
    bool public sold;

    string public location = "Paris";
   
    function setPrice(uint _price) public {
        price = _price;
    }

    // IMPORTANT is integer over and under flow (use of SafeMath will help)
    // Test for overflow 
    uint8 public x = 255;
    int8 public y = -128;

    function testOverFlow() public {
        x++;
    }

    function testUncheckedOverFlow() public {
        unchecked {x++;} // Only to be used for backward compatability.
    }

    function testUnderFlow() public {
        y--;
    }
}