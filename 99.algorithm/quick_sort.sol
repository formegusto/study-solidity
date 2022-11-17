// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract quick_sort {
    event show(int256[] arr);

    function swap(
        int256[] memory arr,
        uint256 idx1,
        uint256 idx2
    ) private pure returns (int256[] memory) {
        int256 tmp = arr[idx1];
        arr[idx1] = arr[idx2];
        arr[idx2] = tmp;

        return arr;
    }

    function partition(
        int256[] memory arr,
        uint256 left,
        uint256 right
    ) private pure returns (int256[] memory, uint256) {
        int256 pivot = arr[left];
        uint256 low = left + 1;
        uint256 high = right;

        while (low <= high) {
            while (low <= right && arr[low] <= pivot) low++;
            while ((left + 1) <= high && arr[high] >= pivot) high--;

            if (low <= high) arr = swap(arr, low, high);
        }

        arr = swap(arr, left, high);

        return (arr, high);
    }

    function quickSort(
        int256[] memory arr,
        uint256 left,
        uint256 right
    ) private returns (int256[] memory) {
        if (left < right) {
            (int256[] memory _arr, uint256 pivot) = partition(arr, left, right);
            _arr = quickSort(_arr, left, pivot);
            _arr = quickSort(_arr, pivot + 1, right);

            arr = _arr;
        }

        return arr;
    }

    function sort(int256[] memory arr) public {
        emit show(arr);

        uint256 left = 0;
        uint256 right = arr.length - 1;
        arr = quickSort(arr, left, right);

        emit show(arr);
    }
}
