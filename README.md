# Autopools

Auto Pools allow users to delegate liquidity management to a strategy operator. This allows liquidity to be rebalanced frequently based on automated signals.

- Gas costs are paid by the Strategy Operator
- Users receive an `APT` token, an ERC4626 receipt token for their share of the Auto Pool.
- Users pay a % Automation Fee upon every rebalance to the Strategy Operator.

# Deployments

## Fantom

- Owner: 0xB26e6094796e5A4e682807eC8F3044287D8124f5

- VaultFactory ProxyAdmin: 0x00EE3816b966D05F73088b9BAC8De7dC49Cc5d7c
- VaultFactory Implementation: 0x531CCf7eEA0B8F6056B19668b78F05256e94e24F
- VaultFactory (behind ERC1967): 0xA14f897dCE04716e1e0F56Fcb35799F2E9aa169f

- OracleVault Implementation: 0xfEF7450118AcF5ff2e5AdfA0F2Ef068B918BA809
- SimpleVault Implementation: 0xf511075d12cE8B928FeE285C60B5646B400Cd51A
- Strategy Implementation: 0x35EA8df1344c56Ce59CE8eF07697b8c90E7Df4e2

- JoeDexLens ProxyAdmin: 0x1B6d50395c5AedFCA2BA3CB2022c9be6b7E6a24D
- JoeDexLens Implementation: 0xA4f07649A92425FA6Fd406158EC6B0259772b5DB
- JoeDexLens (behind ERC1967): 0x91EF620AcEE0BA4B62cBC3fB0ae6987583c41916

### FTM/USDC.lz

- LBPair: 0x97F02cf9e79aD6D45b77B4a0441063e4E5b2EAbB
- OracleLensAggregator -> wFTM: 0xE68CE33eD65a1D45Cbaf65Dd94DE1861838DF4F9
- OracleLensAggregator -> USDC.lz: 0x06eA6E3b2D37709C8Bfb84Ce83a51Ba390F465d8
- OracleVault: 0xa9C0254ee3bdba0439d6C2207D0E5c0b92f42578
- OracleStrategy: 0x53917f4Dd360970e0F5Cf721aA8D17B5FA59143C
- SimpleVault: 0xE01a4c91Bbf344E748b5da158BdcaEb51533DAa9
- SimpleStrategy: 0x14d3C08bd42B300efdD412bb00E46Ca6Eb83a5C2

  oracleVault 0x4fA90ac09Ad339bca26D65b25Fcdd9c66E75d9BC
  oracleStrategy 0xbeF4ae10224CD10d3140E653e9AE82894bf355ff
  simpleVault 0xd26646f5795FE0C1006B7611F582942d30565180
  simpleStrategy 0x7aCa6D67381845B947AE00D69994FaBfF23A0087

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
