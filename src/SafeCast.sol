pragma solidity >=0.5.0;

/// @title A library for safely casting integer types
/// @custom:coauthor Ainmox (https://github.com/ainmox)
library SafeCast {
    function toInt128(uint256 value) internal pure returns (int128) {
        require(value <= 2**127-1);
        return int128(uint128(value));
    }

    function toUint256(int128 value) internal pure returns (uint256) {
        require(value >= 0);
        return uint256(uint128(value));
    }
}