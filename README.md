# Autopools

Auto Pools allow users to delegate liquidity management to a strategy operator. This allows liquidity to be rebalanced frequently based on automated signals.

- Gas costs are paid by the Strategy Operator
- Users receive an `APT` token, an ERC4626 receipt token for their share of the Auto Pool.
- Users pay a % Automation Fee upon every rebalance to the Strategy Operator.

# Deployments

## Fantom

- Owner: 0xB26e6094796e5A4e682807eC8F3044287D8124f5

- VaultFactory ProxyAdmin: 0x731067dB25F3DF9e7e73CfbEeF78A1a38291f0c4
- VaultFactory Implementation: 0x74eaeE4c554839C36CEF4D4971F6E7d23650A1aF
- VaultFactory (behind ERC1967): 0x094B36652Dc726Ad31126060cC37B6ac6973809E

- OracleVault Implementation: 0x26F1B764e7aD375baC1D8E36E1d6C4fDA62E0A49
- SimpleVault Implementation: 0x9F9a2C0001D3865c3A4E479B5c9C0Bc0f772b041
- Strategy Implementation: 0x33d49378bE300C7b30E8486B205889737afe22e1

- JoeDexLens ProxyAdmin: 0x1B6d50395c5AedFCA2BA3CB2022c9be6b7E6a24D
- JoeDexLens Implementation: 0xA4f07649A92425FA6Fd406158EC6B0259772b5DB
- JoeDexLens (behind ERC1967): 0x91EF620AcEE0BA4B62cBC3fB0ae6987583c41916

### FTM/USDC.lz

- LBPair: 0x97F02cf9e79aD6D45b77B4a0441063e4E5b2EAbB
- OracleLensAggregator -> wFTM: 0xE68CE33eD65a1D45Cbaf65Dd94DE1861838DF4F9
- OracleLensAggregator -> USDC.lz: 0x06eA6E3b2D37709C8Bfb84Ce83a51Ba390F465d8
- OracleVault: 0x306C1BB374cC2C7024d965173E4698A4553E6914
- OracleStrategy: 0xDB53E2B8b1e8Ce822848fcb7f46fF03472257FA6
- SimpleVault: 0xA344e223Db0A2615680129AC96593ffC11aD3188
- SimpleStrategy: 0x0b1c76Fc663b7ab7fD856385b828167CBf832A49

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
