// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract cond_ex {
    /*
    조건문 if, else if else

    if (조건) {

    } else if(조건) {

    } else {

    }
    */

    function isOdd(uint256 _num) public pure returns (bool) {
        return _num % 2 != 0;
    }

    function isEven(uint256 _num) public pure returns (bool) {
        return _num % 2 == 0;
    }

    function test(uint256 _num) public pure returns (string memory) {
        if (isOdd(_num)) {
            return "odd";
        } else {
            return "even";
        }
    }
}
