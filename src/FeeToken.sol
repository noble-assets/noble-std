// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

/// @title FeeToken
/// @author NASD Inc.
/// @notice An interface that must be implemented by any ERC20 that wants to be a supported fee token on Noble.
interface FeeToken {
    /// @notice Allows the system address to transfer tokens from one address to another.
    function systemTransfer(address from, address to, uint256 amount) external returns (bool);
}
