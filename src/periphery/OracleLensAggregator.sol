// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {Ownable} from "openzeppelin/access/Ownable.sol";
import {IERC20Metadata} from "openzeppelin/token/ERC20/extensions/IERC20MetaData.sol";
import {IJoeDexLens} from "../interfaces/IJoeDexLens.sol";
import {IOracleLensAggregator} from "../interfaces/IOracleLensAggregator.sol";

contract OracleLensAggregator is Ownable, IOracleLensAggregator {
    IJoeDexLens public immutable joeDexLens;
    address public immutable token;
    uint8 private immutable _decimalsOffset;

    constructor(address _joeDexLens, address _token) {
        joeDexLens = IJoeDexLens(_joeDexLens);
        token = _token;
        _decimalsOffset = IERC20Metadata(_token).decimals();
    }

    /// @dev returns price in WNATIVE
    function _getPriceNativeFromLens() internal view returns (int256) {
        uint256 price = joeDexLens.getTokenPriceNative(token); // WNATIVE is 18 decimals
        uint256 scaledPrice = price / (10 ** (18 - _decimalsOffset)); // scale it
        return int256(scaledPrice);
    }

    function decimals() public pure override returns (uint8) {
        return 18; // WNATIVE is 18 decimals
    }

    function description() external pure override returns (string memory) {
        return "OracleLensAggregator";
    }

    function version() external pure override returns (uint256) {
        return 1;
    }

    function getRoundData(
        uint80
    )
        external
        view
        override
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
    {
        return (0, _getPriceNativeFromLens(), 0, block.timestamp, 0);
    }

    function latestRoundData()
        external
        view
        override
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
    {
        return (0, _getPriceNativeFromLens(), 0, block.timestamp, 0);
    }

    function setPrice(int256 _price) external onlyOwner {
        // nothing
    }
}
