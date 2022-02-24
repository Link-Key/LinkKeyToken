// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";
import "./Ownable.sol";

interface Token {
    function transferFrom(address sender,address recipient, uint256 amount) public;
}

contract AirDropper is Ownable {

    function batchTransfer(address _tokenAddress, address _fromAddress, address[] memory _recipients, uint256[] memory _values) onlyOwner public{
        Token token = Token(_tokenAddress);
        for(uint j = 0; j < _recipients.length; j++){
            token.transferFrom(_fromAddress,_recipients[j], _values[j]);
        }
    }

}
