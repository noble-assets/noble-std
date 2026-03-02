// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.8.0 <0.9.0;

/// @title IValidatorManager
/// @notice Interface for the Validator Manager contract.
interface IValidatorManager {
    // =========================================================================
    // Types
    // =========================================================================

    /// @notice Storage struct for validators.
    struct Validator {
        uint64 index;
        uint64 epochAdded; // 0 = genesis validator
        uint64 epochRemoved; // 0 = active validator
        uint32 ip;
        uint16 port;
        bytes32 publicKey;
        bytes32 name;
    }

    /// @notice Return struct for view functions.
    struct ValidatorInfo {
        uint64 index;
        bytes32 publicKey;
        string name;
        string socketAddress;
    }

    /// @notice Input struct for genesis validators.
    struct GenesisValidator {
        bytes32 publicKey;
        bytes32 name;
        uint32 ip;
        uint16 port;
    }

    // =========================================================================
    // Events
    // =========================================================================

    /// @notice Emitted when a validator is added.
    event ValidatorAdded(uint64 indexed index, bytes32 indexed publicKey, string name, uint64 epochAdded);

    /// @notice Emitted when a validator is removed.
    event ValidatorRemoved(uint64 indexed index, bytes32 indexed publicKey, string name, uint64 epochRemoved);

    // =========================================================================
    // Errors
    // =========================================================================

    /// @notice Error when a validator is already added.
    error ValidatorAlreadyAdded(bytes32 publicKey);

    /// @notice Error when a validator is already removed.
    error ValidatorAlreadyRemoved(bytes32 publicKey);

    /// @notice Error when a validator does not exist.
    error ValidatorNotFound(bytes32 publicKey);

    // =========================================================================
    // Functions
    // =========================================================================

    /// @notice Adds a new validator to the set, applied from the next epoch.
    /// @param publicKey The validator's public key.
    /// @param name The validator's name.
    /// @param ip The validator's IPv4 address.
    /// @param port The validator's port.
    function addValidator(bytes32 publicKey, bytes32 name, uint32 ip, uint16 port) external;

    /// @notice Removes a validator from the set, applied from the next epoch.
    /// @param publicKey The validator's public key.
    function removeValidator(bytes32 publicKey) external;

    /// @notice Returns validators active in the current epoch.
    function getCurrentValidators() external view returns (ValidatorInfo[] memory);

    /// @notice Returns validators that will be active in the next epoch.
    function getNextValidators() external view returns (ValidatorInfo[] memory);

    /// @notice Returns validators active at a specific epoch.
    /// @param epoch The epoch number.
    function getValidatorsAtEpoch(uint64 epoch) external view returns (ValidatorInfo[] memory);
}
