// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract loop_ex {
    /*
    반복문 for, while, do-while

    for(초기식; 조건식; 증감식;) {}

    while(조건식) {}

    do {

    } while(조건식)
    */

    function forSum(uint256 _start, uint256 _end)
        public
        pure
        returns (uint256)
    {
        uint256 sum = 0;
        for (uint256 i = _start; i <= _end; i++) sum += i;
        return sum;
    }

    function whileSum(uint256 _start, uint256 _end)
        public
        pure
        returns (uint256)
    {
        uint256 i = _start;
        uint256 sum = 0;

        while (i <= _end) {
            sum += i;
            i++;
        }

        return sum;
    }

    function doWhileSum(uint256 _start, uint256 _end)
        public
        pure
        returns (uint256)
    {
        uint256 i = _start;
        uint256 sum = 0;

        do {
            sum += i;
            i++;
        } while (i <= _end);

        return sum;
    }
}
