// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Console.sol";
import {ILBPair} from "joe-v2/interfaces/ILBPair.sol";
import {IVaultFactory} from "../../src/interfaces/IVaultFactory.sol";
import {IOracleLensAggregator} from "../../src/interfaces/IOracleLensAggregator.sol";

contract CreateVault is Script {
    IVaultFactory public constant VAULT_FACTORY = IVaultFactory(0x094B36652Dc726Ad31126060cC37B6ac6973809E); // taken from README.md
    ILBPair public constant PAIR = ILBPair(0x97F02cf9e79aD6D45b77B4a0441063e4E5b2EAbB); // FTM/USDC.lz
    IOracleLensAggregator public constant DATAFEED_X = IOracleLensAggregator(0xE68CE33eD65a1D45Cbaf65Dd94DE1861838DF4F9); // wFTM Datafeed
    IOracleLensAggregator public constant DATAFEED_Y = IOracleLensAggregator(0x06eA6E3b2D37709C8Bfb84Ce83a51Ba390F465d8); // USDC.lz Datafeed

    function run() public returns (address oracleVault, address oracleStrategy, address simpleVault, address simpleStrategy) {
        vm.createSelectFork(vm.rpcUrl("fantom"));
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");

        // Start broadcasting the transaction to the network.
        vm.startBroadcast(deployerPrivateKey);

        (oracleVault, oracleStrategy) = VAULT_FACTORY.createOracleVaultAndDefaultStrategy(PAIR, DATAFEED_X, DATAFEED_Y);
        (simpleVault, simpleStrategy) = VAULT_FACTORY.createSimpleVaultAndDefaultStrategy(PAIR);

        // Poke the contract to make sure we can verify them
        (bool s1, ) = oracleVault.call(abi.encodeWithSignature("getFactory()"));
        (bool s2, ) = oracleStrategy.call(abi.encodeWithSignature("getFactory()"));
        (bool s3, ) = simpleVault.call(abi.encodeWithSignature("getFactory()"));
        (bool s4, ) = simpleStrategy.call(abi.encodeWithSignature("getFactory()"));

        require(s1 && s2, "CreateVault::1");
        require(s3 && s4, "CreateVault::2");

        // Stop broadcasting the transaction to the network.
        vm.stopBroadcast();

        // Log the addresses of the deployed contracts.
        console.log("oracleVault", oracleVault);
        console.log("oracleStrategy", oracleStrategy);
        console.log("simpleVault", simpleVault);
        console.log("simpleStrategy", simpleStrategy);
    }
}
