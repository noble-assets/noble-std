// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

/// @title ConsensusInfo
/// @author NASD Inc.
/// @notice A library for interacting with Noble's ConsensusInfo system contract.
library ConsensusInfo {
    /// @notice The address of the ConsensusInfo system contract on Noble.
    address internal constant CONSENSUS_INFO_ADDRESS = 0x6625300000000000000000000000000000000001;

    /// @notice Reads a value from the ConsensusInfo system contract.
    /// @param selector The selector indicating which value to read.
    /// @return result The value returned by the system contract.
    function read(uint256 selector) private view returns (uint256 result) {
        assembly ("memory-safe") {
            mstore(0x20, selector)
            mstore(0x00, 0)
            pop(staticcall(gas(), CONSENSUS_INFO_ADDRESS, 0x20, 0x20, 0x00, 0x20))
            result := mload(0x00)
        }
    }

    /// @notice Returns the current block timestamp in milliseconds.
    /// @return The current block timestamp in milliseconds.
    function timestampMs() internal view returns (uint256) {
        return read(0);
    }

    /// @notice Returns the current consensus epoch.
    /// @return The current consensus epoch.
    function epoch() internal view returns (uint64) {
        return uint64(read(1));
    }
}
