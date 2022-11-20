// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
meta mask
- 이더리움 암호화폐 지갑
- Ethereum 블록체인과 상호 작용하는 데 사용되는 SW 암호 화폐 지갑
    https://en.wikipedia.org/wiki/MetaMask
- 블록체인 네트워크에서 무엇인가 하려면 주소가 필요한데, 이는 암호화폐지갑에 있다.
- Chrome에 추가
    https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn?hl=ko
    chrome-extension://nkbihfbeogaeaoehlefnkodbefgpgknn/home.html
    1. 시작하기
    2. 지갑생성
    3. 비밀번호 설정
    4. 비밀 복구 구문
        - 복구 구문은 지갑과 자금의 '마스터 키' 이다.
        - 메타마스크 지갑의 리얼 비밀번호, 유출되면 지갑이 다 털려버린다.
        - 12개의 단어들이 제공된다
    5. 비밀 백업 구문 확인
- 네트워크 추가 (오른쪽 상단)
    - 초기값은 이더리움 메인넷만 잡혀있다. 테스트넷이 필요하다.
    - 보기 / 숨기기 클릭
    - 테스트 네트워크 보기 (localhost 보이죠?)
    - 테스트 네트워크에서는 이더를 무료로 제공받을 수 있다.
    - Goerli 테스트넷으로 진행했다.
        계정 추가 및 보내기 테스트 오케이
*/

/*
smart contract에게 ether를 보내는 것을 나타내는 프로그램
- desktop 버전에서 잘 동작을 안함.
 No injected provider found. Make sure your provider (e.g. MetaMask) is active and running (when recently activated you may have to reload the page)
 확인해보기
- online ide 에서 잘 동작함.
 goerli test network ether scan
 https://goerli.etherscan.io/
*/
contract ex_21 {
    event Transfer(address from, address to, uint256 amount);

    receive() external payable {}

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
        emit Transfer(msg.sender, address(this), msg.value);
    }
}
