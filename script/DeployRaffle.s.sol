//SPDX-License-Identifier: MIT
import {Raffle} from "src/Raffle.sol";
import {Script} from "forge-std/Script.sol";

pragma solidity ^0.8.30;

contract DeployRaffle is Script {
    Raffle public raffle;

    function run() external returns (Raffle) {
        vm.startBroadcast();
        raffle = new Raffle(1, 1000);
        vm.stopBroadcast();
        return raffle;
    }
}
