// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vault {
    address public owner = msg.sender;
    uint public sentValue;
    uint public timestamp;
    uint public gasUsed;

    function deposit() public payable {
        require(msg.value > 0, "Must send some ether.");
        sentValue = msg.value;
        timestamp = block.timestamp;
    }
    function getCaller() public view returns (address) {
        return address(msg.sender);
    }
    function getOrigin() public view returns (address) {
        return address(tx.origin);
    }
    function getBlockDetails() public view returns (uint, uint, uint, address) {
        return (block.number, block.prevrandao, block.gaslimit, block.coinbase);
    }
    function trackGasUsage() public {
        uint initialGas = gasleft();
        uint finalGas = gasleft();

        gasUsed = initialGas - finalGas;
    }
    function generateHash(
        string memory _generateHash
    ) public pure returns (bytes32) {
        return keccak256(bytes(_generateHash));
    }
}
