🌊워터파크 관리 프로그램 제작🌊
# WaterPark ManageMent

http://www.eopueopu.com/

## 목차
  #### 　 1.제작의도  
  ####  　2.목적  
  ####  　3.스택  
  ####  　4.참고자료  
----
<br/>

### 　제작의도
![image](https://user-images.githubusercontent.com/74906815/123916539-bba27f80-d9bc-11eb-9007-a4ec23e2f163.png)
![image](https://user-images.githubusercontent.com/74906815/123916666-e391e300-d9bc-11eb-948e-bcb422ac3651.png)

<br/>

----
<br/>

### 　                  🥅목적🥅
>대덕인재 개발원에서 시작한 5개월간의 공부를 최대한으로 끌어내는
>팀 프로젝트의 마지막을 최대한 많은 것을 한번에 담을 수 있는 주제를
>찾던 중 CRM과 ERP, SCM을 모두 사용해서 운영되는 테마파크를 선택하였다
<br/>

----
<br/>

### 　　　　　　　　　　 ⚒Stack⚒
　　　<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/></a>
<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=JavaScript&logoColor=black"/></a>
<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=Spring&logoColor=white"/></a>
<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/></a>
<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/Amazon-FF9900?style=flat-square&logo=Amazon&logoColor=black"/></a>
<a href="https://velog.io/@colorful-stars" target="_blank"><img src="https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jQuery&logoColor=white"/></a>

<br/>

----

<br/>

### 참고자료

- https://wp.blueone.com/content/01intro/01_01.jsp (블루원 워터파크)
- https://www.lotteworld.com/waterpark/index.asp
<br/>

### 발표 시나리오
1.홈페이지 접속
-> 소개 간단히 보고 회원가입 버튼
-> 회원가입은 하지 않고 입력만 하고 대충 보여줌
-> 입력 하면서 비동기로 입력 여부 처리해주고 확인해주는것 간단히 보여줌
(Valiator, Jquery에서 정규식 적용해서 보여주고, 이상한 값 입력시 Validator에서 검증되도록 설정도 함.)

1. 처음에는 그냥 비회원으로 주문을 해볼것임
-> 여러개 선택하고 삭제하고 돈도 잘 보이는지 확인할 것
-> 그리고 테스트 용으로 구매 진행하고 예매 내역 확인할 것임
여기서 무슨 기술이 쓰였는지 간단히 설명해주면
2. 잘 됏으면 연간 이용권 구매 진행
-> 로그인 안하고 연간 이용권 선택함.
-> 아! 로그인 하라고 하네? 근데 아이디가 있었는데 기억이 안남
-> 그래서 아이디 찾기 할거임
3. 미리 가입한 아이디를 찾아봄.
-> 아이디만 찾고 비밀번호 기억 난다고 하고 이제 그냥 접속
-> 다시 예매 한다. 연간 이용권 이미 우리가 넣어놈
-> 그러면 구매할 필요도 없고 미리 예약권도 뽑아놓을 수 있음
4. 그러면 직원측에서 잘 됏는지 접속해봄. 경영 총무로 넘어감
-> 맨처음 접속하면 일정 관리 보여줌
-> 근무 내역 잇는거 클릭해보고 등록도 함
-> 물품도 신청해봄
5. 경영총무팀 화면 접속
-> 직원들 조회 해보고
-> 찍어봄
-> 매표소 직원 등록해봄
-> 등록 후에는 이제 고객 정보 조회해서 페이징 보여주고 그 고객 찾아봄(ddit302)
-> 그 직원 선택해서 찍어본다. 아! 아까 구매한 정보 조회가 가능하네요!
-> 새로 가입한 직원에게 쪽지도 전송을 해봄
-> 매표소 직원 등록해서 그 직원으로 로그인 해봄
6. 새로 가입한 직원에게 쪽지 보내기
-> 쪽지 전송하고 직원으로 접속함
-> 그러면 그 직원이 쪽지에서 웹소캣 알람이 움직이는것을 확인
-> 클릭하고 읽고 삭제까지 하고 휴지통에 버리기
7. 매표소 직원
-> 포스 화면 설명 : 포스를 쓰는 곳이 매표소, 스낵바라서 구분함
-> 매표소 직원으로 로그인해서 매표소에서 예매권으로 보고 포켓 코인 발급을 해줌
-> 그것으로 발급시 포켓 코인이 생성됨
-> 이것도 미리 뽑아놓음
8. 스낵바
-> 위에 전체화면 버튼 클릭 클릭해서 보여주기
-> 스낵바에서 발급받은 포켓 코인으로 고객에게 물품 구매, 환불, 보류 하는것 보여줌
-> 개시마감 버튼 클릭해서 마감하고 다른거 누르면 마감됏다는 알림 출력
-> 관리자 변경해서 다른 스낵 직원으로 로그인 시 다시 그 전 화면으로 가는거 보여주기
9. 끄으으으읕

---

멘트 : 회원가입시에 Validator 도 적용을 했고
사용자가 입력시 문제가 없도록 설명을 붙이도록 작성
회원가입은 하지 않을 것 -> 원활한 진행을 위해서 회원가입도 미리 하고 예매권도 미리 뽑앗음

아이디 찾기만 간단히 해볼 계획임 -> CoolSMS
그냥 아무것도 누르는거 없이 회원가입 버튼 누르면
validator 에서 검증을 해준다. 근데 하지말것
=> addFlashAttribute으로 하지 않아서 나갓다 오지 않으면 메시지가 계속 남아있음
=> 일일이 다 지워줘야 함

---

예매 오류
오류 => 일일 이용권 클릭하고 지우고 테스트 클릭햇는데 그대로 돈이 남아있음
하나만 남아있음

현재 그냥 넘어감
이거 결제도 그냥 뚫어놓은건가?

마감 하면
전체 화면 CSS를 좀 어둡게 하면 좋을것 같음
