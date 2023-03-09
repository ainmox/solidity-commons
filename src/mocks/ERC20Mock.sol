pragma solidity >=0.8.0 <0.9.0;

import {ERC20} from "../ERC20.sol";
import {IERC20Optional} from "solidity-standard-interfaces/IERC20Optional.sol";

contract ERC20Mock is ERC20, IERC20Optional {
    /// @inheritdoc IERC20Optional
    string public name;

    /// @inheritdoc IERC20Optional
    string public symbol;

    /// @inheritdoc IERC20Optional
    uint8 public immutable decimals;

    struct Config {
        string name;
        string symbol;
        uint8 decimals;
    }

    constructor(string memory name_, string memory symbol_, uint8 decimals_) {
        name     = name_;
        symbol   = symbol_;
        decimals = decimals_;
    }

    function mint(address recipient, uint256 amount) public {
        _mint(recipient, amount);
    }

    function burn(address owner, uint256 amount) public {
        _burn(owner, amount);
    }
}
