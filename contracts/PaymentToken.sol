// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PaymentToken is ERC20 {
    address public owner;

    constructor() ERC20("Payment Token", "PAYE") {
        owner = msg.sender;
        _mint(msg.sender, 2000000 * 10**18);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
