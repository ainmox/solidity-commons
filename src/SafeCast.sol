pragma solidity >=0.5.0;

/// @title A library for safely casting integer types
/// @custom:coauthor Ainmox (https://github.com/ainmox)
library SafeCast {
    function toUint256(int128 value) internal pure returns (uint256) {
        require(value >= 0);
        return uint256(uint128(value));
    }
}