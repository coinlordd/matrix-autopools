// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Console.sol";
import {TransparentUpgradeableProxy} from "openzeppelin/proxy/transparent/TransparentUpgradeableProxy.sol";
import {ProxyAdmin} from "openzeppelin/proxy/transparent/ProxyAdmin.sol";
import {VaultFactory} from "../../src/VaultFactory.sol";
import {SimpleVault} from "../../src/SimpleVault.sol";
import {OracleVault} from "../../src/OracleVault.sol";
import {Strategy} from "../../src/Strategy.sol";
import {IVaultFactory} from "../../src/interfaces/IVaultFactory.sol";

contract DeployCore is Script {
    address private constant WNATIVE = 0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83; // wFTM

    struct Contracts {
        address factoryImplementation;
        address oracleVaultImplementation;
        address simpleVaultImplementation;
        address strategyImplementation;
        address proxyAdmin;
        address factory;
    }

    function run() public returns (Contracts memory contracts) {
        vm.createSelectFork(vm.rpcUrl("fantom"));
        uint256 deployerPrivateKey = vm.envUint("DEPLOY_PRIVATE_KEY");

        // Start broadcasting the transaction to the network.
        vm.startBroadcast(deployerPrivateKey);

        contracts.proxyAdmin = address(new ProxyAdmin());
        contracts.factoryImplementation = address(new VaultFactory(WNATIVE));

        IVaultFactory factory = VaultFactory(
            address(
                new TransparentUpgradeableProxy(
                    contracts.factoryImplementation,
                    contracts.proxyAdmin,
                    abi.encodeWithSignature("initialize(address)", vm.addr(deployerPrivateKey))
                )
            )
        );

        contracts.factory = address(factory);
        contracts.oracleVaultImplementation = address(new OracleVault(factory));
        contracts.simpleVaultImplementation = address(new SimpleVault(factory));
        contracts.strategyImplementation = address(new Strategy(factory));

        // Initialize hot variables.
        factory.setVaultImplementation(IVaultFactory.VaultType.Simple, contracts.simpleVaultImplementation);
        factory.setVaultImplementation(IVaultFactory.VaultType.Oracle, contracts.oracleVaultImplementation);
        factory.setStrategyImplementation(IVaultFactory.StrategyType.Default, contracts.strategyImplementation);

        // Stop broadcasting the transaction to the network.
        vm.stopBroadcast();

        // Log the addresses of the deployed contracts.
        console.log("factoryImplementation", contracts.factoryImplementation);
        console.log("oracleVaultImplementation", contracts.oracleVaultImplementation);
        console.log("simpleVaultImplementation", contracts.simpleVaultImplementation);
        console.log("strategyImplementation", contracts.strategyImplementation);
        console.log("proxyAdmin", contracts.proxyAdmin);
        console.log("factory", contracts.factory);
    }
}
