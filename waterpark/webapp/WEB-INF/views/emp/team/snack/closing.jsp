<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- purple x moss 2020 -->

<head>
<meta charset="UTF-8">
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600;900&display=swap" rel="stylesheet">
  <script src="https://kit.fontawesome.com/4b9ba14b0f.js" crossorigin="anonymous"></script>
<style type="text/css">
body {

  background-color: #3C4858;
}

.mainbox {
  background-color: #3C4858;
  margin: auto;
  height: 600px;
  width: 1200px;
  position: relative;
}

  .err {
    color: #ffffff;
    font-family: 'Jua', sans-serif;
    font-size: 11rem;
    position:absolute;
    left: 22%;
    top: 25%;
  }

.far {
  position: absolute;
  font-size: 8.5rem;
  left: 42%;
  top: 15%;
  color: #ffffff;
}

 .err2 {
    color: #ffffff;
    font-family: 'Jua', sans-serif;
    font-size: 11rem;
    position:absolute;
    left: 68%;
    top: 8%;
  }

.msg {
    text-align: center;
    font-family: 'Jua', sans-serif;
    font-size: 1.6rem;
    position:absolute;
    left: 16%;
        top: 98%;
    width: 75%;
  }

a {
  text-decoration: none;
  color: white;
}

a:hover {
  text-decoration: underline;
}

</style>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gugi&family=Jua&display=swap"
	rel="stylesheet">
</head>

<body>
  <div class="mainbox">
    <div class="err">&nbsp;업무마감 <br>되었습니다.</div>


    <div class="msg"><p>홈으로 돌아가려면 <a href="${WCP }/emp">home</a> 를 누르십시오.</p></div>
      </div>
</html>