// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract func {
    /*
        가시성 지정자

        가시성 지정자는 변수, 상수, 함수에 적용 가능
        public : 외부 / 내부 접근 가능 ( 변수 적용시 getter 함수 생성 )
        external : 외부 접근만 가능 ( 변수 적용 불가, this 키워드 사용시 내부 접근 가능 )
        private : 내부 접근만 가능
        internal : 내부 접근만 가능하나, 상속 받은 스마트 컨트랙트는 외부 접근가능

        solidity 함수의 유형
        1. 일반적인 형태 - 가시성 지정자가 뒤에 붙음
        function func1() public {
            // 로직
        }

        2. 매개변수 형태
        function func2(uint num) public {
            a = num;
        }

        3. 반환값 형태 - 반환값 유형도 뒤에 지정
        function func3() public returns(uint) {
            a = 3;
            return a;
        }

        4. 매개변수 반환값 형태
        function func4(uint num) public returns(uint) {
            a = 3 + num;
            return a;
        }
    */

    uint256 public a = 1;

    function func1() public {
        a = 5;
    }

    // 외부에서만 접근 가능
    function func2(uint256 num) external {
        a = num;
    }

    function func2_1(uint256 num) external returns (uint256) {
        // error! func2(num);
        this.func2(num);

        return a;
    }

    function func3() private returns (uint256) {
        a = 3;
        return a;
    }

    function func3_1() public returns (uint256) {
        return func3();
    }

    function func4(uint256 num) internal returns (uint256) {
        a += num;
        return a;
    }

    function func4_1() public returns (uint256) {
        return func4(55);
    }
}
