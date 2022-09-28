// SPDX-License-Identifier: MIT

pragma solidity >=0.8.17 <0.9.0;

contract MemoryStorage {
    string[] public cities = ['Johannesburg', 'Cape Town'];

    function fMemory() public view {
        string[] memory _cities = cities;

        _cities[0] = 'Pretoria';
    }

    function fStorage() public {
        string[] storage _cities = cities;

        _cities[0] = 'Welkom';
    }
}