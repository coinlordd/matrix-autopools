# Autopools

Auto Pools allow users to delegate liquidity management to a strategy operator. This allows liquidity to be rebalanced frequently based on automated signals.

- Gas costs are paid by the Strategy Operator
- Users receive an `APT` token, an ERC4626 receipt token for their share of the Auto Pool.
- Users pay a % Automation Fee upon every rebalance to the Strategy Operator.

# Deployments

## Fantom

- Owner: 0xB26e6094796e5A4e682807eC8F3044287D8124f5

- VaultFactory ProxyAdmin: 0x79F937C5172bD66301D9cf90837106d486eC06Bf
- VaultFactory Implementation: 0x31231063b2f4c2b77A7b37e661CC997632320b3C
- VaultFactory (behind ERC1967): 0x0B8e497644086255F2a05ca12F180Fb55822f81C

- OracleVault Implementation: 0x538Fc0007C1F13787B77bBe63ddFc0A13563B640
- SimpleVault Implementation: 0x2208256A00D3d673E1436b7DFe9010Dd524169e1
- Strategy Implementation: 0x29224e90C15555162a585236f7Cd7B2A82b953E6

- JoeDexLens ProxyAdmin: 0x1B6d50395c5AedFCA2BA3CB2022c9be6b7E6a24D
- JoeDexLens Implementation: 0xA4f07649A92425FA6Fd406158EC6B0259772b5DB
- JoeDexLens (behind ERC1967): 0x91EF620AcEE0BA4B62cBC3fB0ae6987583c41916

### FTM/USDC.lz

- LBPair: 0x97F02cf9e79aD6D45b77B4a0441063e4E5b2EAbB
- OracleLensAggregator -> wFTM: 0xE68CE33eD65a1D45Cbaf65Dd94DE1861838DF4F9
- OracleLensAggregator -> USDC.lz: 0x06eA6E3b2D37709C8Bfb84Ce83a51Ba390F465d8
- OracleVault: 0xdae60a0e9cA483AFed1ff61E38C919A762C39b5d
- OracleStrategy: 0x0990428c9F2a6470D1204F968D09A6543E493ea4
- SimpleVault: 0xea804Ec0cbe684169f5A88F0FcB1a456fFC04e58
- SimpleStrategy: 0xb018b03Ab4c08762D716c570Ff58Ee05F67aAD5E

## Install dependencies

To install dependencies, run the following to install dependencies:

```
forge install
```

---

## Tests

To run tests, run the following command:

```
forge test
```
