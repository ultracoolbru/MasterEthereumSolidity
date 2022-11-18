// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.17;

// 0.1 Ether = 100000000000000000
contract Lottery {
    address payable[] public players;
    address public manager;
    uint openingBalance;
    uint prizePool;
    bool lotteryComplete = false;

    constructor() {
        manager = msg.sender;
        openingBalance = address(this).balance;
    }

    receive() external payable {
        require(!lotteryComplete);
        require(msg.value == 0.1 ether);
        prizePool += msg.value;
        players.push(payable(msg.sender));
    }

    fallback() external payable {
        revert();
    }

    function getOpeningBalance() public view returns(uint) {
        require(msg.sender == manager);
        require(!lotteryComplete);
        return openingBalance;
    }

    function getCurrentPrizePool() public view returns(uint) {
        require(msg.sender == manager);
        require(!lotteryComplete);
        return prizePool;
    }

    function getClosingBalance() public view returns(uint) {
        require(msg.sender == manager);
        require(lotteryComplete);
        return openingBalance - getBalance();
    }

    function getBalance() public view returns(uint) {
        require(msg.sender == manager);
        require(!lotteryComplete);
        return address(this).balance;
    }

    function randomNumberGenerator() internal view returns(uint) {
        // Do not use a random number generator in production, because you can get hacked.
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    function selectWinner() public {
        require(msg.sender == manager);
        require(lotteryComplete);
        require(players.length >= 3);
        require(address(this).balance > 0);

        uint r = randomNumberGenerator();
        address payable winner;
        uint index = r % players.length;
        
        prizePool = 0;
        openingBalance = 0;
        lotteryComplete = true;
        winner = players[index];
        winner.transfer(getBalance());
        players = new address payable[](0);
    }
}