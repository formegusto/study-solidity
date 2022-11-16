// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract mapping_ex {
    /*
    매핑
    - 키와 값으로 구성
    - length가 없음
    - mapping(키 자료형 => 값 자료형) 가시성지정자 변수명;
      mapping(uint => uint) public a;
    */

    mapping(address => uint256) public a;

    function addMapping(address _key, uint256 _value) public {
        a[_key] = _value;
    }

    function getMapping(address _key) public view returns (uint256) {
        return a[_key];
    }

    function deleteMapping(address _key) public {
        delete (a[_key]);
        // => a[_key] = 0; 과 같음
    }

    function ChangeMapping(address _key, uint256 _value) public {
        a[_key] = _value;
    }
}
