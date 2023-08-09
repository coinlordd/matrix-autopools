// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Console.sol";
import {OracleLensAggregator} from "../../src/periphery/OracleLensAggregator.sol";

contract CreateOracleLensAggregator is Script {
    address constant JOE_DEX_LENS = 0x91EF620AcEE0BA4B62cBC3fB0ae6987583c41916; // taken from README.md
    address constant TOKEN_X = 0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83; // wFTM
    address constant TOKEN_Y = 0x28a92dde19D9989F39A49905d7C9C2FAc7799bDf; // USDC.lz

    function run() public {
        vm.createSelectFork(vm.rpcUrl("fantom"));
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");

        // Start broadcasting the transaction to the network.
        vm.startBroadcast(deployerPrivateKey);

        address token = TOKEN_X;
        address aggregator = address(new OracleLensAggregator(JOE_DEX_LENS, token));

        // Stop broadcasting the transaction to the network.
        vm.stopBroadcast();

        // Log the addresses of the deployed contracts.
        console.log("aggregator", aggregator);
    }
}
