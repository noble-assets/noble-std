// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

/// @title IFeeDistributor
/// @notice Interface for the Fee Distributor contract.
interface IFeeDistributor {
    // =========================================================================
    // Types
    // =========================================================================

    /// @notice Return struct for recipient information.
    struct RecipientInfo {
        address recipient;
        uint16 bps;
    }

    // =========================================================================
    // Events
    // =========================================================================

    /// @notice Emitted when a recipient is added or updated.
    /// @param recipient The recipient address.
    /// @param bps The new share of fees in basis points.
    event RecipientSet(address indexed recipient, uint16 bps);

    /// @notice Emitted when a recipient is removed.
    /// @param recipient The recipient address.
    event RecipientRemoved(address indexed recipient);

    // =========================================================================
    // Errors
    // =========================================================================

    /// @notice Error when the caller is not authorized.
    error Unauthorized();

    /// @notice Error when zero basis points is provided.
    error ZeroBps();

    /// @notice Error when total basis points exceeds 10,000.
    error TotalBpsExceeded(uint16 totalBps);

    /// @notice Error when the recipient does not exist.
    error RecipientNotFound(address recipient);

    // =========================================================================
    // Functions
    // =========================================================================

    /// @notice Sets or updates a recipient's share in basis points.
    /// @param recipient The address to receive fees.
    /// @param bps The share of fees in basis points.
    function setRecipient(address recipient, uint16 bps) external;

    /// @notice Removes a recipient from fee distribution.
    /// @param recipient The address to remove.
    function removeRecipient(address recipient) external;

    /// @notice Distributes the contract's native balance to recipients.
    /// @dev Called during block finalization outside of the normal transaction
    /// lifecycle. Implementations must not revert. Each recipient receives a
    /// portion of the balance according to their configured basis points. Any
    /// remainder is sent to the current block proposer's fee recipient address.
    function distribute() external;

    /// @notice Returns all current recipients and their basis points.
    /// @return recipients The array of recipient addresses and their shares.
    function getRecipients() external view returns (RecipientInfo[] memory recipients);
}
