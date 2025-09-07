// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions


//SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

/**
 * @title Raffle Contract
 * @author Tanishk Dhope
 * @notice This is a sample Raffle contract
 * @dev Implements ChainLink VRFv2.5
 */

contract Raffle{
    /*Errors*/

    error NotEnoughEth();
    
    address payable[] sPlayers;
    uint256 private sTimestamp;
    uint256 private immutable I_ENTRANCE_FEE;
    uint256 private immutable I_INTERVAL;

    /**Events */
    event RaffleEntered(address);

    constructor(uint256 entranceFee,uint256 interval){
        I_ENTRANCE_FEE=entranceFee;

        //@dev The duration of lottery in seconds
        I_INTERVAL=interval; 

        sTimestamp=block.timestamp;
    }


    function enterRaffle()external payable{
        // require(msg.value>=I_ENTRANCE_FEE, "Not Enough Eth");   //not gas efficient
        if (msg.value< I_ENTRANCE_FEE){
            revert NotEnoughEth();
        }
        sPlayers.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);

    }

    function pickWinner() view external{
        if(block.timestamp-sTimestamp<I_INTERVAL){
            revert();
        }
    }
    function getEntranceFee()public view returns(uint256){
        return I_ENTRANCE_FEE;
    }
}