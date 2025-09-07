//SPDX-License-Identifier:MIT
import {Test} from "forge-std/Test.sol";
import {DeployRaffle} from "script/DeployRaffle.s.sol";
import {Raffle} from "src/Raffle.sol";

pragma solidity ^0.8.30;

contract RaffleTest is Test{
    Raffle public raffle;
    DeployRaffle public deployer;
    function setUp()external{
        deployer=new DeployRaffle();
        raffle=deployer.run();
    }
    function testDemo()public{

    }
}