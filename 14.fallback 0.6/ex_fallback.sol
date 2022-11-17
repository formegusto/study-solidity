// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
    fallback
    fallback은 receiver와 fallback으로 2가지 형태로 나뉘어졌다.
    receive: 순수하게 이더만 받을 때 작동한다.
    fallback : 없는 함수를 호출할 때 없는 함수를 호출하면서 이더를 보낼 때 작동한다.

    0.6 이후
    기본형 : 불려진 함수가 특정 smary contract에 없을 때 fallback 함수가 발동한다.
    fallback() external {}

    receive() external payable {}
    payable 적용 시, 이더를 받고 나서도 fallback 함수가 발동한다.
    fallback() external payable {}
*/

contract safe {
    event received(address _from, uint256 _amount);
    event justFallback(string _str);

    fallback() external payable {
        emit justFallback("No Function");
    }

    receive() external payable {
        ex_fallback _ex = new ex_fallback();
        emit received(msg.sender, msg.value);
    }

    function checkMybalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract ex_fallback {
    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callNow(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send ether");
    }

    function callWrong(address _to) public returns (bool, bytes memory) {
        (bool sent, bytes memory outputFromCalledFunction) = _to.call(
            abi.encodeWithSignature("wrong()")
        );
        require(sent, "Failed");
        return (sent, outputFromCalledFunction);
    }

    function callWrong2(address payable _to)
        public
        payable
        returns (bool, bytes memory)
    {
        (bool sent, bytes memory outputFromCalledFunction) = _to.call{
            value: msg.value
        }(abi.encodeWithSignature("wrong()"));
        require(sent, "Failed");
        return (sent, outputFromCalledFunction);
    }
}
