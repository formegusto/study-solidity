// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract pure_view {
    /*
        저장 공간
        1. storage
            영속적인 읽고/쓰기 가능 저장공간
            가스 비용 비쌈
            함수의 외부나, 함수가 저장
        2. memory
            휘발적인 읽고/쓰기 가능 저장공간
            함수의 내부에 정의된 변수, 매개변수, 반환값 등이 사용
        3. colladata
            읽기 가능한 공간
            external의 매개변수에 적용
        4. stack
            EVM (Ethereum Virtual Machine) 에서 stack data를 관리할 때 쓰는 영역
            1024Mb 제한
        
        함수의 모디파이어 : 함수의 행동을 제한할 수 있다.
        pure, view, payable

        pure : 순수하게 함수안에 있는 변수만 사용할 때
        view : 함수 밖에 있는 변수, 함수를 읽어 올 때
    */

    uint256 public a = 1;

    function fun2() public pure returns (uint256) {
        // a = 3; // Error! pure는 함수안에 변수만 사용 가능함
        uint256 b = 4;
        return b;
    }

    function fun3() public view returns (uint256) {
        return a;
    }

    function fun4() public returns (uint256) {
        // pure나 view는 읽기에만 관여 가능
        // 다음과 같이 수정이 들어가면 pure나 view가 올 수 없음
        a = 3;
        return a;
    }

    // 매개변수를 반환하기 때문에 함수가 끝난 후에 매개변수가 사라진다.
    // 그래서 어디에 저장할 지에 대해서 지정해주어야 한다.
    function fun5(string memory _str) public pure returns (string memory) {
        return _str;
    }
}
