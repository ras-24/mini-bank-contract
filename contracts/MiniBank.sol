// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract MiniBank {
    event deposit(address indexed account, uint value);
    event withdraw(address indexed account, uint value);

    mapping(address => uint) public balance;

    function cashDeposit() public payable {
        require(msg.value > 0, "You must deposit some Ether");
        balance[msg.sender] += msg.value;
        emit deposit(msg.sender, msg.value);
    }

    function cashWithdraw(uint _value) public {
        require(balance[msg.sender] >= _value, "Insufficient balance");
        payable(msg.sender).transfer(_value);
        emit withdraw(msg.sender, _value);
    }

    function getBalance() public view returns (uint256) {
        return balance[msg.sender];
    }
}