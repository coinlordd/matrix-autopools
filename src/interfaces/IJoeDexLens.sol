// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

/// @dev Simplified version of https://github.com/traderjoe-xyz/joe-dex-lens/blob/main/src/interfaces/IJoeDexLens.sol
interface IJoeDexLens {
    /// @notice Returns the price of token in Native, scaled with `DECIMALS` decimals
    /// @param _token The address of the token
    /// @return price The price of the token in Native, with `DECIMALS` decimals
    function getTokenPriceNative(address _token) external view returns (uint256 price);
}
