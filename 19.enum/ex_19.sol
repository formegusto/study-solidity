// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
enum
    - 사람이 읽을 수 있게 정의한 상수 세트, 숫자에 이름을 붙인 것
    - uint8 이기 때문에 0 ~ 255개 까지의 이름을 붙일 수 있다.
    - 원래 타입이 uint8이기 때문에 형변환이 가능하다.

    enum enum_name {
        using_name_1, // 0
        using_name_2, // 1
        using_name_3 // 2
    }
*/

contract ex_19 {
    enum Light {
        TurnOn,
        TurnOff,
        Repair
    }

    Light public lightStatus;

    constructor() {
        lightStatus = Light.TurnOff;
    }

    event currentStatus(Light _lightStatus, uint8 _lightStatusInInt);

    function turnOn() public {
        require(lightStatus == Light.TurnOff, "Light Must Be Turned Off!");
        lightStatus = Light.TurnOn;
        emit currentStatus(lightStatus, uint8(lightStatus));
    }

    function turnOff() public {
        require(lightStatus == Light.TurnOn, "Light Must Be Turned On!");
        lightStatus = Light.TurnOff;
        emit currentStatus(lightStatus, uint8(lightStatus));
    }

    function repair() public {
        require(lightStatus == Light.TurnOff, "Light Must Be Turned Off!");
        lightStatus = Light.Repair;
        emit currentStatus(lightStatus, uint8(lightStatus));
    }

    function repairDone() public {
        require(lightStatus == Light.Repair, "Light Must Be Repair!");
        lightStatus = Light.TurnOff;
        emit currentStatus(lightStatus, uint8(lightStatus));
    }
}
