// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract array_ex {
    /*
    배열
    - length (길이) 있음
    - 자료형[] 가시성지정자 변수명
      uint256[] public a;

      uint256[10] public ageFixedSizeArray;
      string[] public nameArray = ["kal", "Jhon], "Kerri"];
    */

    uint256[] public b;

    function addArray(uint256 _value) public {
        b.push(_value);
    }

    function getArray(uint256 _index) public view returns (uint256) {
        return b[_index];
    }

    function ChangeArray(uint256 _index, uint256 _value) public {
        b[_index] = _value;
    }

    function deleteArray() public {
        // Last In First Out
        b.pop();
    }

    function deleteArray2(uint256 _index) public {
        delete (b[_index]);
        // 이거슨 배열에서 빼는 작업이 아니다.
        // mapping과 같이 0으로 바꾸는 작업임
    }

    function getArraySize() public view returns (uint256) {
        return b.length;
    }
}
