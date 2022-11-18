// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
interface
interface : smart contract 내에서 정의되어야 할 필수 요소를 나타냄 (설명서)

1. 함수는 external로 표시
2. enum, structs 가능
3. 변수, 생성자 불가 (constructor X)

*/

interface ItemInfo {
    struct item {
        string name;
        uint256 price;
    }

    // 암묵적으로 virtual이 붙는다.
    function addItemInfo(string memory _name, uint256 _price) external;

    function getItemInfo(uint256 _index) external view returns (item memory);
}

contract ex_20 is ItemInfo {
    item[] public itemList;

    function addItemInfo(string memory _name, uint256 _price) public override {
        itemList.push(item(_name, _price));
    }

    function getItemInfo(uint256 _index) public view returns (item memory) {
        require(itemList.length > _index, "Not Found");
        return itemList[_index];
    }
}
