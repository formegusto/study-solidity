// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
call detail
가변적인 gas (gas 값 지정 가능), 성공여부를 true 또는 false로 리턴
재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천
이게 역사가 붙는데, 이스탄불 하드포크로 인해 오퍼레이션 코드 가격이 올랐기 때문에 이를 사용하라고 권장 
// 가변적인 가스로 인해 재진입 공격 위험성이 존재하는 것
( + ) 외부 Smart Contract의 함수로 호출이 가능하다.
    호출을 위해서는 Smart Contract의 주소와 호출하려는 함수명이 필요하다.

call
A ---- 5 ether ----> B
send 처럼 bool 타입의 결과를 주기 때문에 require 처러가 필요하다.
*/
contract ex_12_detail {
    function addNumber(uint256 _num1, uint256 _num2)
        public
        pure
        returns (uint256)
    {
        return _num1 + _num2;
    }

    function whoIsMsgSender() public view returns (address) {
        return msg.sender;
    }
}

contract ex_12 {
    event howMuch(uint256 _value);

    // 1. 송금
    function callNow(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }

    // 2. 외부 Smart Contract 함수 부르기
    function callAddNumber(
        address addr,
        uint256 _num1,
        uint256 _num2
    ) public returns (bool, bytes memory) {
        // 여기 매개변수 파트 띄어쓰기하면 안됨
        (bool sent, bytes memory outputFromCalledFunction) = addr.call(
            abi.encodeWithSignature("addNumber(uint256,uint256)", _num1, _num2)
        );
        require(sent, "failed");
        return (sent, outputFromCalledFunction);
    }

    function callWhoIsMsgSender(address addr)
        public
        returns (bool, bytes memory)
    {
        (bool sent, bytes memory outputFromCalledFunction) = addr.call(
            abi.encodeWithSignature("whoIsMsgSender()")
        );
        require(sent, "failed");
        return (sent, outputFromCalledFunction);
    }
    /*
    1. callWhoIsMsgSender를 호출한 것은 ACCOUNT
    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

    2. 하지만 detail addr을 호출한 것은 ex_12 라는 smart contract
    0x8059B0AE35c113137694Ba15b2C3585aE77Bb8E9

    3. 그래서 ex_12_detail의 msg.sender는 ex_12 라는 smart contract
    ex_12를 호출한 것은 ACCOUNT 이지만,
    ex_12_detail을 호출한 것은 ex_12 smart contract
     */
}
