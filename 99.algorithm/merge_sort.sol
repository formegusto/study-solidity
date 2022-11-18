// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract merge_sort {
    int256[] arr;
    int256[] sortedArr;

    event show(int256[] arr);

    function initSorted(uint256 length) private {
        for (uint256 i = 0; i < length; i++) sortedArr.push(0);
    }

    function merge(
        uint256 left,
        uint256 mid,
        uint256 right
    ) private {
        uint256 i = left;
        uint256 j = mid + 1;
        uint256 k = left;

        while ((i <= mid) && (j <= right)) {
            if (arr[i] <= arr[j]) sortedArr[k++] = arr[i++];
            else sortedArr[k++] = arr[j++];
        }

        if (i <= mid)
            for (uint256 l = i; l <= mid; l++) sortedArr[k++] = arr[l];
        else for (uint256 l = j; l <= right; l++) sortedArr[k++] = arr[l];

        for (uint256 l = left; l <= right; l++) arr[l] = sortedArr[l];
    }

    function mergeSort(uint256 left, uint256 right) private {
        if (left < right) {
            uint256 mid = ((left + right) / 2);
            mergeSort(left, mid);
            mergeSort(mid + 1, right);
            merge(left, mid, right);
        }
    }

    function sort(int256[] memory _arr) public {
        arr = _arr;
        uint256 left = 0;
        uint256 right = arr.length;
        initSorted(right);

        emit show(arr);
        mergeSort(left, right - 1);
        emit show(arr);
    }
}
