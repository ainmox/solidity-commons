pragma solidity >=0.8.6;

import {IERC20} from "solidity-standard-interfaces/IERC20.sol";

/// @title An implementation of the ERC20 token standard
/// @custom:coauthor Ainmox (https://github.com/ainmox)
contract ERC20 is IERC20 {
    /// @inheritdoc IERC20
    uint256 public override totalSupply;

    /// @inheritdoc IERC20
    mapping(address => uint256) public override balanceOf;

    /// @inheritdoc IERC20
    mapping(address => mapping(address => uint256)) public override allowance;

    /// @inheritdoc IERC20
    function approve(address spender, uint256 value) external returns (bool success) {
        allowance[msg.sender][spender] = value;
        success = true;
        emit Approval(msg.sender, spender, value);
    }

    /// @inheritdoc IERC20
    function transfer(address recipient, uint256 amount) external returns (bool success) {
        uint256 senderBalance = balanceOf[msg.sender];
        require(senderBalance >= amount);

        unchecked {
            balanceOf[msg.sender] = senderBalance - amount;
            balanceOf[recipient] += amount;
        }

        success = true;

        emit Transfer(msg.sender, recipient, amount);
    }

    /// @inheritdoc IERC20
    function transferFrom(address owner, address recipient, uint256 amount) external returns (bool success) {
        uint256 senderAllowance = allowance[owner][msg.sender];
        uint256 ownerBalance = balanceOf[owner];

        require(senderAllowance >= amount);
        require(ownerBalance >= amount);

        unchecked {
            allowance[owner][msg.sender] = senderAllowance - amount;
            balanceOf[owner] = ownerBalance - amount;
            balanceOf[recipient] += amount;
        }

        success = true;

        emit Transfer(msg.sender, recipient, amount);
    }

    /// @dev Mint `amount` tokens to `recipient`
    /// @param recipient The address of the recipient
    /// @param amount The amount of tokens to mint
    function _mint(address recipient, uint256 amount) internal {
        totalSupply += amount;
        unchecked {
            balanceOf[recipient] += amount;
        }

        emit Transfer(address(0), recipient, amount);
    }

    /// @dev Burn `amount` tokens from `account`
    /// @param owner The address of the account
    /// @param amount The amount of tokens to burn
    function _burn(address owner, uint256 amount) internal {
        uint256 ownerBalance = balanceOf[owner];
        require(ownerBalance >= amount);

        unchecked {
            totalSupply -= amount;
            balanceOf[owner] = ownerBalance - amount;
        }

        emit Transfer(owner, address(0), amount);
    }
}