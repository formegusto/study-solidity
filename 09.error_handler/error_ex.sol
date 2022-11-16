// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.8.0;

contract error_ex {
    /*
    0.4.22 ~ 0.7.x
    에러 핸들러

    assert : gas를 다 소비한 후, 특정한 조건에 부합하지 않으면 에러 바생
    assert(조건문)

    revert : 조건없이 에러를 발생시키고, gas를 환불 시켜준다.
    revert("에러 메시지")

    reqiure : 특정한 조건에 부합하지 않으면 에러를 발생시키고, gas를 환불
    require(조건문, "에러메세지")
    assert + revert
    */

    function assertNow(uint256 _a) public pure {
        assert(_a > 5);
    }

    function revertNow(uint256 _a) public pure {
        if (_a < 5) revert("Must be more than 5");
    }

    function requireNow(uint256 _a) public pure {
        require(_a > 5, "Must be more than 5");
    }
}
