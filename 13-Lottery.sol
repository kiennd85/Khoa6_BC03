// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Lottery {
    address public owner; //người tạo contract + quay số lottery
    address[] public players;// danh sach người chơi
    uint256 ticket = 2 ether;
    uint256 public jackpot = 0;
    uint256 nonce = 0;
    address public winner;

    constructor() {
        owner = msg.sender;
    }

    function random(uint256 _nonce, uint256 _mod) public view returns (uint256) {
        uint256 randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, _nonce))) % _mod;
        return randomNumber;
    }

    function buyTicket() public payable  {
        require(msg.value == ticket, "Price ticket is 2 ether");
        jackpot += msg.value;
        players.push(msg.sender);

    }

    function getPlayers() public view returns (address[] memory) {
        return players;
    }

    modifier isManager {
        require(msg.sender == owner, "Only manager pick winner");
        _;
    } 

    function pickWinner() public payable isManager {
        nonce++;
        uint256 mod = players.length;
        uint256 randomNumber = random(nonce,mod);

        winner = players[randomNumber];

        payable(winner).transfer(jackpot);

        jackpot = 0;    //Reset jackpot

        delete players; //Reset danh sach players
       
    }


}