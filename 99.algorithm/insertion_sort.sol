// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract insertion_sort {
    event show(uint256[] arr);
    event showNumber(uint256 num);

    function sort(uint256[] memory arr) public payable {
        emit show(arr);

        for (uint256 i = 1; i < arr.length; i++) {
            uint256 prevI = i - 1;
            while ((prevI >= 0) && (arr[prevI + 1] < arr[prevI])) {
                if(prevI < 0) {
                    emit showNumber(prevI);
                    break;
                }
                uint256 tmp = arr[prevI + 1];
                arr[prevI + 1] = arr[prevI];
                arr[prevI--] = tmp;
            }
        }

        emit show(arr);
    }
}
