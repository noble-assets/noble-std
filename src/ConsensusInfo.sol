// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

import {CONSENSUS_INFO_ADDRESS} from "./Constants.sol";

/// @title ConsensusInfo
/// @author NASD Inc.
/// @notice A library for interacting with Noble's ConsensusInfo system contract.
library ConsensusInfo {
    /// @notice Reads a value from the ConsensusInfo system contract.
    /// @param slot The storage slot to read from.
    /// @return result The value stored at the specified slot.
    function read(uint256 slot) private view returns (bytes32 result) {
        assembly ("memory-safe") {
            mstore(0x20, slot)
            mstore(0x00, 0)
            pop(staticcall(gas(), CONSENSUS_INFO_ADDRESS, 0x20, 0x20, 0x00, 0x20))
            result := mload(0x00)
        }
    }

    /// @notice Returns the current block timestamp in milliseconds.
    /// @return The current block timestamp in milliseconds.
    function timestampMs() internal view returns (uint256) {
        return uint256(read(0));
    }

    /// @notice Returns the current consensus epoch.
    /// @return The current consensus epoch.
    function epoch() internal view returns (uint64) {
        return uint64(uint256(read(1)));
    }

    /// @notice Returns the current block proposer.
    /// @return The current block proposer.
    function proposer() internal view returns (bytes32) {
        return read(2);
    }
}
