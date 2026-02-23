// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.8.13 <0.9.0;

import {Test} from "forge-std/Test.sol";
import {ConsensusInfo} from "../src/ConsensusInfo.sol";
import {CONSENSUS_INFO_ADDRESS} from "../src/Constants.sol";

/// @title ConsensusInfoTest
/// @author NASD Inc.
/// @notice Test suite for the ConsensusInfo library.
contract ConsensusInfoTest is Test {
    function setUp() public {
        vm.etch(
            CONSENSUS_INFO_ADDRESS,
            hex"3373fffffffffffffffffffffffffffffffffffffffe14603957366020146024575f5ffd5b5f35806002116031575f5ffd5b545f5260205ff35b5f355f5560203560015500"
        );

        vm.prank(0xffffFFFfFFffffffffffffffFfFFFfffFFFfFFfE);
        (bool success,) = CONSENSUS_INFO_ADDRESS.call(abi.encode(uint256(1773826860000), uint64(0)));
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
}
