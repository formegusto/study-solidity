// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
    생성자 (constructor)
        - smart contract가 **배포될 때 **제일 먼저 작동하는 함수
        - smart contract를 **배포할 때마다 특정한 값을 세팅
        contract ex_15 {
            constructor() {

            }
        }
    
    상속 (inheritance)
        - 특정 smart contract의 모든 기능을 상속 받음
        - 상속을 주는 쪽은 부모 smart contract
        - 상속을 받는 쪽은 자식 smart contract
        contract ex_15_child is ex_15 {}

    overriding
        - 상속 받은 함수를 변경
        - virtual : parent smart contract에 있는 overriding 함수에 지정
        - override : child smart contract를 인스턴스화하여 여러개 사용가능

    인스턴스화
        - 특정 smart contract를 인스턴스화하여 여러개 사용가능
*/
contract ex_15 {
    uint256 public money;

    constructor(uint256 _money) {
        money = _money;
    }

    function addMoney(uint256 _money) public {
        money += _money;
    }

    function changeMoney(uint256 _money) public virtual {
        money = _money;
    }
}

contract ex_15_child is ex_15 {
    constructor(uint256 _money) ex_15(_money + 500) {}
}

contract ex_15_child_2 is ex_15(500) {
    function changeMoney(uint256 _money) public override {
        money = _money * 2;
    }
}

contract exs {
    ex_15[] exArr;

    function addExAll(uint256 length) public {
        for (uint256 i = 0; i < length; i++) exArr.push(new ex_15(500));
    }

    function chkEx(uint256 idx) private view {
        bool chk = !(exArr.length <= idx);
        require(chk, "Not Found");
    }

    function showEx(uint256 idx) public view returns (uint256) {
        chkEx(idx);
        return exArr[idx].money();
    }

    function addExMoney(uint256 idx, uint256 _money) public {
        chkEx(idx);
        exArr[idx].addMoney(_money);
    }
}
