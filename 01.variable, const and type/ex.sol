// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ex {
    /*
        변수 : 값을 지속적으로 변경 가능
        상수 : 한번 넣은 값은 변경 불가
    */
    /*
        변수의 유형
        자료형 가시성 지정자 변수명 = 값
        solidity is typesafe
        uint public a = 3;

        상수의 유형
        자료형 가시성 constant 변수명 = 값
        uint public constant b = 3;

        자료형 타입
        value / reference
        value type : uint, int, bool, address (고정 길이), bytes1...bytes32 (고정 길이)
        reference type : bytes (동적길이), string (동적 길이), array (배열), mapping (매핑), struct (구조체)

        int type
        int, int8, int16, int32, int64, int128, int258

        uint type : 기호없는 integer

        산술연산자 : + - * / **
        논리연산자 : && ||
        비교연산자 : < > != == >= <=
    */

    uint256 public a = 1;
    int256 public b = -1;
    bool public c = true;
    bytes1 public d = hex"11"; // 16진수의 문자
    string public e = "abcd";

    // operation
    uint256 public f = 1 + 2;
    uint256 public g = 3 - 2;
    uint256 public h = 4 * 2;
    uint256 public i = 4 / 2;
    uint256 public j = 4**2;

    bool public k = true && true;
    bool public m = true && false;
    bool public n = false && false;

    bool public l = true || true;
    bool public o = true || false;
    bool public p = false || false;

    bool public q = 3 > 5;
    bool public r = 3 <= 4;
    bool public s = 3 == 3;
    bool public t = 3 != 3;

    uint256 public constant z = 3;
}
