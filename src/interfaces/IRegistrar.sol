// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title IRegistrar
/// @notice Interface for the Registrar contract.
interface IRegistrar {
    // =========================================================================
    // Types
    // =========================================================================

    /// @notice Storage struct for key-value entries.
    struct Entry {
        bytes32 value;
        uint64 epochFrom; // 0 = genesis value
    }

    // =========================================================================
    // Events
    // =========================================================================

    /// @notice Emitted when a key-value pair is updated.
    /// @param key The key that was updated.
    /// @param value The new value associated with the key.
    /// @param epochFrom The epoch from which the new value is active.
    event Updated(bytes32 indexed key, bytes32 value, uint64 epochFrom);

    // =========================================================================
    // Errors
    // =========================================================================

    /// @notice Error when keys and values arrays have different lengths.
    error LengthMismatch();

    // =========================================================================
    // Functions
    // =========================================================================

    /// @notice Gets the value associated with a key at the current epoch.
    /// @param key The key to look up.
    /// @return value The value associated with the key.
    function get(bytes32 key) external view returns (bytes32 value);

    /// @notice Gets the value associated with a key at the next epoch.
    /// @param key The key to look up.
    /// @return value The value associated with the key.
    function getNext(bytes32 key) external view returns (bytes32 value);

    /// @notice Batch gets the values associated with keys at the current epoch.
    /// @param keys The keys to look up.
    /// @return values The values associated with the keys.
    function batchGet(bytes32[] calldata keys) external view returns (bytes32[] memory values);

    /// @notice Batch gets the values associated with keys at the next epoch.
    /// @param keys The keys to look up.
    /// @return values The values associated with the keys.
    function batchGetNext(bytes32[] calldata keys) external view returns (bytes32[] memory values);

    /// @notice Gets all historical entries for a key.
    /// @param key The key to look up.
    /// @return entries The entries associated with the key.
    function getEntries(bytes32 key) external view returns (Entry[] memory entries);

    /// @notice Sets a key-value pair, applied from the next epoch.
    /// @param key The key to set.
    /// @param value The value to set.
    function set(bytes32 key, bytes32 value) external;

    /// @notice Batch sets key-value pairs, applied from the next epoch.
    /// @param keys The keys to set.
    /// @param values The values to set.
    function batchSet(bytes32[] calldata keys, bytes32[] calldata values) external;
}
