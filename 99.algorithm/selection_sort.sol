// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract selection_sort {
    event show(int256[] arr);
    event showNumber(int256 number);

    function swap(
        int256[] memory arr,
        uint256 idx1,
        uint256 idx2
    ) external pure returns (int256[] memory) {
        int256 tmp = arr[idx1];
        arr[idx1] = arr[idx2];
        arr[idx2] = tmp;

        return arr;
    }

    function sort(int256[] memory arr) public {
        emit show(arr);

        for (uint256 i = 0; i < arr.length - 1; i++) {
            // 최솟값 탐색
            uint256 j = i + 1;
            uint256 minIdx = i;
            for (; j < arr.length; j++) {
                if (arr[minIdx] > arr[j]) minIdx = j;
            }
            // swap
            if (minIdx != i) arr = this.swap(arr, minIdx, i);
        }

        emit show(arr);
    }
}
