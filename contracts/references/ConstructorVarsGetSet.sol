// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract ConstructorVarsGetSet {
    uint public price;
    address immutable public owner;

    int constant constArea = 100;   // Must be initialized.
    int immutable immutableArea;    // Can be initialized like a variable.

    constructor() {
        owner = msg.sender;
        immutableArea = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // function changeOwner(address _owner) public onlyOwner {
    //     owner = _owner;
    // }

    function setPrice(uint _price) public {
        price = _price;
    }

    function getPrice() public view returns(uint) {
        return price;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}