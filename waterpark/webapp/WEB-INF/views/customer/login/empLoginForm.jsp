<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<body>

<script type="text/javascript">
	alert("dd")
</script>


	<div id="container" class="main_container">
		<div style="padding: 20px;"></div>
		<div class="login_container">
			<div class="form_container">
				<form method="post" action="/waterpark/emp/empLogin">
					<div class="form_title_div">
						<p class="form_title_p">
							<a href="customerMain">직원 로그인</a>
						</p>
					</div>
					<div>
						<div>
							<a class="form_item_name">직원 아이디</a>
						</div>
						<div>
							<input type="text" name="user_id" placeholder="Enter UserId"
								class="form_input" value="${sessionScope.idFailCntEmp.user_id}" />
						</div>
					</div>
					<div>
						<div>
							<a class="form_item_name">비밀번호 </a>
						</div>
						<div>
							<input type="password" name="user_pass"
								placeholder="Enter Password" class="form_input" />
						</div>
					</div>
					<div style="height: 10px;"></div>
					<input type="checkbox" id="idSaveCheck" id="saveId" value="saveId">아이디
					기억하기 <input class="form_submit_button" type="submit" value="로그인">
				</form>
				<br>
				<div class="errorBox">
					<c:if test="${not empty sessionScope.idFailCntEmp}">
						${sessionScope.idFailCntEmp.errorMsg}
						<c:remove var="sessionScope.idFailCntEmp" session/>
					</c:if>
				</div>
				<br>
				<div>
					아이디 : EP2020121401<br>
					비밀번호 : java<br>
					- 아이디가 기억나지 않을 시 - <br>
					<br>경영 총무팀 담당자에게 문의해주시기 바랍니다.
				</div>
				<br>
				<div>
					<p class="active">
						담당자 : 김도윤 </a>
					<p class="active">
						전화번호 : 060-700-5454</a>
				</div>
				<form method="post" action="${WCP}/emp/empLogin">
					<input type="submit" value="경영총무"/>
					<input name="user_id" type="hidden" value="EP2021062501"/>
					<input type="hidden" name="user_pass" value="java" />
				</form>
				<form method="post" action="${WCP}/emp/empLogin">
					<input type="submit" value="스낵"/>
					<input name="user_id" type="hidden" value="EP2021062502"/>
					<input type="hidden" name="user_pass" value="java" />
				</form>
				<form method="post" action="/waterpark/emp/empLogin">
					<input type="submit" value="매표소"/>
					<input name="user_id" type="hidden" value="EP2020120402"/>
					<input type="hidden" name="user_pass"value="java" />
				</form>
			</div>
		</div>
	</div>
</body>