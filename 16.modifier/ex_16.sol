// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
    modifier
    - 함수에 적용하여, 함수의 행위를 제한
    1. 매개변수가 있는 modifier
    modifier 모디파이어이름 (자료형 매개변수이름) {
        // ... code
        _; 이 언더바가 해당 모디파이어를 사용중인 함수의 실행을 얘기한다.
    }
    modifier 모디파이어이름 (자료형 매개변수이름) {
        _; 이렇게도 할 수 있다는 이야기
        // ... code
    }

    2. 매개변수가 없는 modifier
    modifier 모디파이어이름 {
        // ... code
        _;
    }
*/
contract ex_16 {
    function BuyCigarette1(uint256 _age) public pure returns (string memory) {
        require(_age > 18, "U are not allowd to pay for the cigarette");
        return "Ur payment is succeeded";
    }

    function BuyCigarette2(uint256 _age) public pure returns (string memory) {
        require(_age > 18, "U are not allowd to pay for the cigarette");
        return "Ur payment is succeeded";
    }

    function BuyCigarette3(uint256 _age) public pure returns (string memory) {
        require(_age > 18, "U are not allowd to pay for the cigarette");
        return "Ur payment is succeeded";
    }

    function BuyCigarette4(uint256 _age) public pure returns (string memory) {
        require(_age > 18, "U are not allowd to pay for the cigarette");
        return "Ur payment is succeeded";
    }

    /*
    1. 매개변수 modifier
    */
    modifier onlyAdults(uint256 _age) {
        require(_age > 18, "U are not allowd to pay for the cigarette");
        _;
    }

    function BuyCigarette5(uint256 _age)
        public
        pure
        onlyAdults(_age)
        returns (string memory)
    {
        return "Ur payment is succeeded";
    }

    /*
    2. 매개변수 없는 modifier
    */
    uint256 public num = 5;
    modifier numChange() {
        num = 10;
        _;
    }

    function numChangeFunction() public numChange {
        num = 15;
    }
}
