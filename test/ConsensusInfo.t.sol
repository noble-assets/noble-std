// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

import {Test} from "forge-std/Test.sol";
import {ConsensusInfo} from "../src/ConsensusInfo.sol";
import {CONSENSUS_INFO_ADDRESS, SYSTEM_ADDRESS} from "../src/Constants.sol";

/// @title ConsensusInfoTest
/// @author NASD Inc.
/// @notice Test suite for the ConsensusInfo library.
contract ConsensusInfoTest is Test {
    function setUp() public {
        vm.etch(
            CONSENSUS_INFO_ADDRESS,
            hex"3373fffffffffffffffffffffffffffffffffffffffe14603957366020146024575f5ffd5b5f35806003116031575f5ffd5b545f5260205ff35b5f355f5560203560015560403560025500"
        );

        vm.prank(SYSTEM_ADDRESS);
        (bool success,) = CONSENSUS_INFO_ADDRESS.call(
            abi.encode(1773826860000, 0, 0x56a3d0c4bb63de9988a2cb9d0be8dbaa4da785390cbb7d26b9919df82b621caa)
        );
        require(success);
    }

    /// @notice Tests that `timestampMs` returns the correct millisecond timestamp.
    function test_timestampMs() public view {
        assertEq(ConsensusInfo.timestampMs(), 1773826860000);
    }

    /// @notice Tests that `epoch` returns the correct epoch number.
    function test_epoch() public view {
        assertEq(ConsensusInfo.epoch(), 0);
    }

    /// @notice Tests that `proposer` returns the correct block proposer.
    function test_proposer() public view {
        assertEq(ConsensusInfo.proposer(), 0x56a3d0c4bb63de9988a2cb9d0be8dbaa4da785390cbb7d26b9919df82b621caa);
    }
}
