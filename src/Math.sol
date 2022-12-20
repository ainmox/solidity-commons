pragma solidity >=0.5.0;

/// @title A library for various common math operations
/// @custom:coauthor Ainmox (https://github.com/ainmox)
library Math {
    /// @dev Gets the minimum of two unsigned 256 bit integers
    /// @param x The first 256 bit integer
    /// @param y The second 256 bit integer
    /// @return result The minimum of the two 256 bit integers
    function min(uint256 x, uint256 y) internal pure returns (uint256 result) {
        result = x < y ? x : y;
    }
}