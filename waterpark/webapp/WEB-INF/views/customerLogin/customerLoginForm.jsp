<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--
 * author : velog.io/@___
 * path : ./signup.html
-->
<body>
    <div id="container" class="main_container">
        <div style="padding: 20px;"></div>
        <div class="login_container">
            <div class="form_container">
                <form name="login_form" action="/cookie" method="get">
                    <div class="form_title_div">
                        <p class="form_title_p"><a href="customerMain">대덕 워터파크</a></p>
                    </div>
                    <div>
                        <div>
                            <a class="form_item_name">username</a>
                        </div>
                        <div>
                            <input type="text" name="username" placeholder="name" class="form_input"/>
                        </div>
                        <div class="form_text_alert_padding">
                            <div id="alert_username" class="form_text_alert"></div>
                        </div>
                    </div>
                    <div>
                        <div>
                            <a class="form_item_name">Password</a>
                        </div>
                        <div>
                            <input type="password" name="password" placeholder="Enter password" class="form_input" />
                        </div>
                        <div class="form_text_alert_padding">
                            <div id="alert_password" class="form_text_alert"></div>
                        </div>
                    </div>
                    <div style="height: 10px;"></div>
                    <input type="checkbox" id="idSaveCheck">아이디 기억하기
                    <div>
                        <button type="button" class="form_submit_button" onclick="login()">로그인 하기</button>
                    </div>
                    <br>
                    <div>
                 		  혹시 아이디 혹은 비밀번호가 기억이 나질 않는다고요? 
                    </div>
                    <br>
	               <div>
	               		<a href="#" class="active">아이디 찾기</a> / 
	               		<a href="#" class="active">비밀번호 찾기</a>
	               </div>
                </form>
            </div>
        </div>
    </div>
</body>
