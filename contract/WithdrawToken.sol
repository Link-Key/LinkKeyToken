// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Ownable.sol";

contract WithdrawToken is Ownable {

    uint256 _maxFee;
    uint256 _fee;
    address private _feeAddr;
    uint256 _unit;

    constructor(uint maxFee_, uint fee_, address feeAddr_) {
        _maxFee = maxFee_;
        _fee = fee_;
        _feeAddr = feeAddr_;
        _unit = 1 ether / 1000;
    }

    function withdraw() public payable{
        require(msg.value >= _fee * _unit ,"001 --- WithdrawToken.sol --- withdraw --- gas fee not enough!");
        require(msg.value < _maxFee * _unit,"002 --- WithdrawToken.sol --- withdraw --- gas fee over limit!");
        //Management address to collect money
        (bool success, ) = payable(_feeAddr).call{value:msg.value}("");
        require(success, "003 --- WithdrawToken.sol --- withdraw --- send matic to fee collect address fail!");
    }

    function setFee(uint256 fee_) public onlyOwner{
        require(fee_ < _maxFee,"004 --- WithdrawToken.sol --- withdraw --- gas fee must less than max fee!");
        _fee = fee_;
    }

    function setMaxFee(uint256 maxFee_) public onlyOwner{
        require(maxFee_ > _fee,"005 --- WithdrawToken.sol --- withdraw --- max fee must more than gas fee!");
        _maxFee = maxFee_;
    }

    function setFeeAddr(address feeAddr_) public onlyOwner{
        require(feeAddr_ != address(0),"006 --- WithdrawToken.sol --- withdraw --- fee collect address is the zero address!");
        _feeAddr = feeAddr_;
    }

    function setUnit(uint256 unit_) public onlyOwner{
        require(unit_ > 0 ,"007 --- WithdrawToken.sol --- withdraw --- unit must more than zero!");
        _unit = unit_;
    }

    function queryFeeValue() public view returns (uint256){
        return _fee * _unit;
    }

}
