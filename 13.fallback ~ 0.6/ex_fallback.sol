// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.6.0;

/*
    fallback, 대비책
    - 대비책 함수를 뜻함
    - smart contract이 ether를 받을 수 있도록 해줌.
    - ether를 받고 난 후 어떠한 행동을 취하게 할 수 있다.
    - call 함수로 없는 함수가 불려질 때, 어떠한 행동을 취할 수 있다.

    0.6 이전
    function() external payable {}
*/

contract safe {
    event received(address _from, uint256 _amount);

    function() external payable {
        // 2,300으로 제한된 가스로 로직을 실행시킨다.
        // 그래서 call 사용을 권장하는 것 이다.
        // 하드포크에 의해 계속해서 가스값이 올라갈 수 있기 때문

        ex_fallback _ex = new ex_fallback();
        emit received(msg.sender, msg.value);
    }

    function checkMybalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract ex_fallback {
    event howMuch(uint256 _value);

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow(address payable _to) public payable {
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent, "Failed to send ether");
    }

    function callWrong(address _safeAddr) public returns (bool, bytes memory) {
        (bool sent, bytes memory outputFromCalledFunction) = _safeAddr.call(
            abi.encodeWithSignature("wrong()")
        );
        require(sent, "failed");
        return (sent, outputFromCalledFunction);
    }

    function callWrong2(address _safeAddr)
        public
        payable
        returns (bool, bytes memory)
    {
        (bool sent, bytes memory outputFromCalledFunction) = _safeAddr
            .call
            .value(msg.value)(abi.encodeWithSignature("wrong()"));
        require(sent, "failed");
        return (sent, outputFromCalledFunction);
    }
}
