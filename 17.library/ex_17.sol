// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
    library : 기존에 만들던 smart contract과 다른 종류의 smart contract

    advances
        - 가스 소비 줄임 : 라이브러리는 재사용가능 한 코드 (배포를 진행하지 않음)
        - 재사용 : 다른 smart contract에 적용가능
        - 데이터 타입 적용 : 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에, 좀 더 쉽게 사용
    disadvances
        - fallback 함수 불가
        - 상속 불가
        - payable 함수 정의 불가
    
    ex )
    0.8 이전 overflow revert
    overflow: 0~255 -> 256 == 0
*/

library SafeMath {
    function add(uint8 a, uint8 b) internal pure returns (uint8) {
        // require은 false에 걸림
        require(a + b >= a, "SafeMath: addition overflow");
        return a + b;
    }
}

contract ex_17 {
    // 1. 이게 uint8이라는 자료형에 해당 라이브러리를 붙인거임
    using SafeMath for uint8;
    uint8 public num;

    function becomeOverflow(uint8 a, uint8 b) public {
        // 2. 그래서 당연히 이렇게 사용하는게 직관적이지만,
        // num = SafeMath.add(a, b);
        // 3. 이렇게도 사용할 수 있다는 의미임. a라는 친구는 uint8이기 때문에 SafeMath가 붙어있음
        num = a.add(b);
    }
}
