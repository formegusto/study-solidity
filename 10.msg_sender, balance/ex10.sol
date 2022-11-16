// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ex10 {
    /*
    msg.sender
    - msg.sender : 트랜잭션을 주는 존재

    balance
    - 현재 이더의 잔액
    - 주소.balance
    */

    function getMsgSender() public view returns (address) {
        return msg.sender;
    }

    function balance1(address _a) public view returns (uint256) {
        return _a.balance;
    }

    function balance2() public view returns (uint256) {
        return (msg.sender).balance;
    }

    /*
    이더의 단위
    wei, gwei, ether
    1 ether = 10^18 wei => 99 * 10^18
    1 gwei = 10^9 wei : 주로 가스비를 계산할 때 사용
    // 가스는 트랜잭션을 이용할 때마다 내야한다.
    1 wei = 10^-18 ether ( 0.000000000000000001 ether )
    */
}
