pragma solidity >=0.6.4;

import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
    @title Facilitates registration of contract to get metadata for migration
 */
contract LPReward is Ownable, Pausable{
    event SetAdmin(address indexed addr, bool isEnabled);
    event Transfer(address indexed addr, uint amount);

    constructor(address _owner) public{
        _transferOwnership(_owner);
    }

    function transfer(address receiver, uint amount) external whenNotPaused onlyOwner(){
        payable(receiver).transfer(amount);
        emit Transfer(receiver, amount);
    }
}