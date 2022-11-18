// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

/*
import
    - 외부에서 라이브러리를 가지고 오는 방법
*/
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";

contract ex_18 {
    using SafeMath for uint256;
    uint256 public num = 0;
    uint256 public max = 2**256 - 1;

    function becomeOverflow(uint256 a, uint256 b) public {
        num = a.add(b);
    }
}
