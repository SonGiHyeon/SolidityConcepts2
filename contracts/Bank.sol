// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Vault.sol";

contract Bank is Vault {
    // address public owner = msg.sender;
    // uint public sentValue;
    // uint public timestamp;
    // uint public gasUsed;

    // function deposit() public payable {
    //     require(msg.value > 0, "Must send some ether.");
    //     sentValue = msg.value;
    //     timestamp = block.timestamp;
    // }
    // function getCaller() public view returns (address) {
    //     return msg.sender;
    // }
    // function getOrigin() public view returns (address) {
    //     return tx.origin;
    // }
    // function getBlockDetails() public view returns (uint, uint, uint, address) {
    //     return (block.number, block.prevrandao, block.gaslimit, block.coinbase);
    // }
    // function trackGasUsage() public {
    //     uint initialGasUsed = gasleft();
    //     uint finalGasUsed = gasleft();

    //     gasUsed = initialGasUsed - finalGasUsed;
    // }
    // function generateHash(
    //     string memory _generateHash
    // ) public pure returns (bytes32) {
    //     return keccak256(bytes(_generateHash));
    // }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call withdraw.");
        _;
    }

    event Withdrawn(address indexed user, uint256 amount);

    function withdraw(uint _value) public onlyOwner {
        require(sentValue > _value, "Insufficient balance in Vault.");
        sentValue = sentValue - _value;
        emit Withdrawn(msg.sender, _value);
    }
}
