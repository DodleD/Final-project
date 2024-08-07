# Final-project

## 1. 프로젝트 개요
  #### 프로젝트 명 : AquAqu

  #### 물살이 생물에 대한 정보제공, 이커머스 사이트

  #### 개발 기간
    1차 개발 : 2024-04-29 ~ 2024-05-29
    2차 개발 : 2024-05-31 ~ 2024-06-21

  #### 팀원 소개 및 GitHub 주소
  1. [DB관리자](https://github.com/DodleD) : 김도* <- 현재 보고계신 gitHub 입니다.
  2. [조장](https://github.com/Hyun7en) : 고병*
  3. [이슈관리자](https://github.com/lhy9496) : 이호*
  4. [일정관리자](https://github.com/rudwn9014) : 이경*
  5. [형상관리자](https://github.com/hornheart) : 박은*
    
## 2. 프로젝트 개발 목표 !
    프로젝트 AquAqu는 아쿠아리스트들을 위한 홈페이지 입니다.
    우리가 작은 어항 수족관에 키우는 생물들도 작은 아쿠아리움이라 생각해서 아쿠아리스트라고 부르게 되었습니다.
    또 나만의 작은 아쿠아리움의 물살이 생물을 쉽게 관리하기 위한 정보 제공과 필요한 용품들을 구매하고 게시판을
    통한 아쿠아리스트들끼리의 커뮤니케이션 제공이 목표입니다.


## 3. 개발 환경
  ### OS
    Window 10

  ### Programming Language
    1. Java
    2. HTML, CSS
    3. JavaScript

  ### FrameWork / Library
    1. Spring
    2. mybatis
    3. lombok
    4. maven
    5. Spring Security
    ...
  ### DB
    PostgreSQL

  ### Tools
    1. STS 3
    2. pgAdmin4
    3. VSCode
    4. AWS, RDS
  ### WAS
    TomCat

  ### Collaborations
    1. gitHub
    2. Tstory


## 4. 프로젝트 설명
  ### AquAqu의 소개
    사용자(User) : 사용자는 물살이 생물에 대한 정보를 얻거나 물고기 추천을 받을 수 있고 회원가입을 통하여
    게시판과 마이페이지에 CRUD가 가능합니다.
    또한 판매자가 올린 상품을 구매하거나 찜, 장바구니, 판매자 구독, 알람 받기, 판매자 전환신청 등을 제공합니다.

    판매자(User) : 사용자가 판매자 전환신청을 하고 관리자에게 승인을 받으면 판매자로 활동할 수 있습니다.
    판매자가 되면 판매자 홈페이지를 스마트 스토어 형태로 제공합니다.
    판매자는 자기 판매 페이지에서 CURD가 가능하고 판매자 정보를 확인할 수 있으며 자신을 구독한 유저를 볼 수 있고
    구독한 유저에게 알람을 보낼 수 있습니다, 또 고객 문의에서는 유저가 판매자에게 보낸 문의를 확인하고 답변할 수 있습니다.

    관리자(Master) : 관리자 계정으로 접속하면 관리자 페이지에 접근이 가능합니다. 관리자 페이지에서는 회원 관리,
    판매자 관리를 할 수 있습니다. 그리고 고객지원에서 1대1 문의를 통해 들어온 것을 처리 가능하며, 회원 탈퇴 내역을 볼 수 있습니다.

  ### 저의 역할은!
    ● 기능 구현 외에 DB관리자로써 프로젝트 요구사항을 분석하여 AWS RDS와 ERD-Cloud를 사용하여 DB 구조를
      설계하고 구축하였습니다.
    ● 전체적인 DB의 수정, 최적화를 진행하였고 전체적인 쿼리문이나 빽업본을 만들어 데이터 손실 시 빠르게
      복구할 수 있는 절차를 마련했습니다.
    ● AWS의 RDS를 이용하여 클라우드 환경에서 DB를 효과적으로 관리하였고 팀원들이 어디서든 DB에 접근할
      수 있도록 하였습니다.

  ### 상세한 구현 기능들
    ※본인 구현기능 ● 표시
    1. 메인 홈페이지 ●
    2. 물고기 정보제공, 물고기 디테일 정보제공 ●
    3. 큐레이션 ●
    4. 회원Lv에 따른 헤더 변경, 푸터 ●
    5. DB설계 ●
    6. 헤더의 상품 검색기능 ●
    7. 카테고리별 물고기 검색기능 ●
    8. 사업자 진위확인 API ●
    9. 시작할 때 홈페이지의 전체적인 세팅을 담당하는 메서드 ●
    10. SSE를 통한 실시간 알람기능 ●
    11. 판매자(물품등록, 수정, 삭제, 조회), 판매자 홈(등록, 수정 삭제)
    12. 상품 무한스크롤 조회, 인기상품 slick 조회
    13. 회원가입, 로그인기능 (카카오, 네이버), 아이디 비밀번호 찾기
    14. 커뮤니티 게시판(수정 등록 삭제), 댓글, 추천
    15. 마이페이지(회원 정보 수정, 작성한 글, 1대1 문의, 장바구니, 구매목록, 판매자 전환신청 등)
    16. 판매자 관리 페이지(고객문의, 퇴점)
    17. 관리자 페이지(회원 관리, 판매자 관리, 판매자 승인 관리, 신고 상품 관리)
    18. 고객센터

  ### ERD-Cloud
  <p align="center">
    <img src="https://github.com/DodleD/Final-project/assets/156145780/ea28deb2-5c69-4244-afef-a63e61a06451">
  </p>

    
## 5. 후기
  ### 추가 개발 예정
    1. 고객센터의 완성 (현재 게시판의 형태만 가져온 상태)
    2. 회원 등급 = 구매 내역이나 커뮤니티 활동 내역에 포인트를 매겨서 회원 레벨의 변화,
    레벨이 올라가면 물고기 캐릭터 사진도 등업
    ex) 송사리 -> 멸치 -> 구피 -> 거북이 -> 상어 -> 고래 등
    3. 큐레이션(물고기추천)에서 일치하는 DB값이 없으면 500에러 발생 -> 에러처리
       DB 채워넣기
    4. 큐레이션의 서비스 로직을 좀 더 효율적인 방법으로 구현
     
  ### 소감
    프로젝트를 통해 Java, Spring, MyBatis, HTML, CSS, JavaScript, JSP, 공공 API, 실시간 통신 등
    다양한 기술을 프로젝트에 적용할 수 있었고 문제 능력 (에러 수정)의 능력이 크게 향상되었습니다.
    또한 팀원들과 협업하며 서로의 강점을 살리고 함께 문제를 해결해 나가는 과정에서 협업의 중요성과 팀워크의
    가치를 깊이 깨달았습니다.
