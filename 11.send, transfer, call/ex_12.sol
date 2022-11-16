// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ex_12 {
    /*
    이더를 보내는 3가지 함수
    gas는 소비하는 가스의 양
    1. send : 2,300 gas / 성공여부를 true 또는 false로 리턴, 주소 타입의 내장 함수
    2. transfer : 2,300 gas / 실패시 에러를 발생, 주소 타입의 내장 함수
    3. call : 가변적인 gas (gas 값 지정 가능), 성공여부를 true 또는 false로 리턴
              재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천
              이게 역사가 붙는데, 이스탄불 하드포크로 인해 오퍼레이션 코드 가격이 올랐기 때문에 이를 사용하라고 권장 
              // 가변적인 가스로 인해 재진입 공격 위험성이 존재하는 것

    [A 잔액 1 ether]

    send
    A ---- 5 ether ----> B
    송금을 하되, send로 보낼 수 없으니까 false를 리턴하게 된다.
    여기서 A는 가스를 소비했다. 하지만 아무대처도 하지 않았기 때문에
    조건식에 require를 사용하여 가스를 환불해준다.

    transfer
    A ---- 5 ether ----> B
    에러를 발생시키기 때문에 send처럼 조건문을 걸어줄 필요가 없다.

    call
    A ---- 5 ether ----> B
    send 처럼 bool 타입의 결과를 주기 때문에 require 처러가 필요하다.
    

    payable
    Payable은 이더 송수신에 필요한 키워드이다.
    즉, send / transfer 이더를 보낼 때 주소는 payable이라는 키워드가 필요하다.
    이 payable은 주로 함수, 주소, 생성자에 붙여서 사용한다.

    call은 payable이 필요없다.

    msg.value
    송금보낸 이더의 값
    */

    event howMuch(uint256 _value);

    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send ether");
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow(address payable _to) public payable {
        // ~ 0.7
        // (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        // require(sent, "Failed to send ether");

        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }

    function noPayableCallNow(address _to) public payable {
        // ~ 0.7
        // (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        // require(sent, "Failed to send ether");

        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }
}
