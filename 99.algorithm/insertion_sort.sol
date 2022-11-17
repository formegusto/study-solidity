// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract insertion_sort {
    event show(uint256[] arr);
    event showNumber(uint256 num);

    function sort_test(uint256[] memory arr) public {
        emit show(arr);

        for (uint256 i = 1; i < arr.length; i++) {
            int256 prevI = int(i - 1);
            while ((prevI >= 0) && (arr[uint(prevI + 1)] < arr[uint(prevI)])) {
                uint256 tmp = arr[uint(prevI + 1)];
                arr[uint(prevI + 1)] = arr[uint(prevI)];
                arr[uint(prevI)] = tmp;
                prevI--;
            }
        }

        emit show(arr);
    }
}
