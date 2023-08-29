// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import {IAggregatorV3} from "./IAggregatorV3.sol";

/// @dev Modified version of IAggregatorV3 that returns the price from a JoeDexLens
interface IOracleLensAggregator is IAggregatorV3 {}
