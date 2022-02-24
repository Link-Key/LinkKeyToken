// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20.sol";
import "./Ownable.sol";

contract AirDropTest is ERC20,Ownable {

    constructor(string memory name_, string memory symbol_) ERC20(name_,symbol_){

    }

    function mint(address account, uint256 amount) public onlyOwner{
        _mint(account, amount);
    }
}
