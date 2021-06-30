<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>]
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
 		.mainForm { 
		  display: flex;  
 		  align-items: center; 		  
 		  padding-top: 40px; 
		  padding-bottom: 40px; 
		  background-color: #f5f5f5; 
		} 
		
		.form-signin { 
		  width: 100%; 
		  max-width: 500px; 
		  padding: 15px; 
		  margin: auto; 
		} 
		
 		form-floating{ 
 			margin-bottom: 20px; 
 		} 
		
		.hp input[type="text"]{
			padding: 5px;
			width: 138px;
			display: inline-block;
		}
		.bi-dash-lg{
			vertical-align: super;
		}
			
		.form-signin .name { 
		  margin-bottom: 10px; 
		  border-bottom-right-radius: 0; 
		  border-bottom-left-radius: 0; 
		} 
		
		.form-signin .hp { 
		  margin-bottom: 10px; 
		  border-top-left-radius: 0; 
		  border-top-right-radius: 0; 
		} 
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${not empty message }">
	<script>
		Swal.fire('${message}');
	</script>
</c:if>
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>예매 내역</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">이용 정보</a></li>
            <li>예매 내역</li>
          </ol>
        </div>

      </div>
</section><!-- End Breadcrumbs -->
<section id="mainForm">
	<div class="container">
		<div class="row">
			<main class="form-signin">
				  <form action="${WCP }/customer/use-info/reserveInfo" method="post">
				
				    <h1 class="h4 mb-3 fw-normal">예매 번호 입력</h1>
				    <div class="form-floating">
				      <input type="text" class="form-control name" name="res_code" id="floatingInput" placeholder="예매 번호 입력">
				      <label for="floatingInput">예매 번호 입력</label>
				    </div>
				    <h1 class="h4 mb-3 fw-normal">or</h1>
				    <h1 class="h4 mb-3 fw-normal">주문인 정보 입력</h1>
				    <div class="form-floating">
				      <input type="text" class="form-control name" name="user_name" id="floatingInput" placeholder="주문인 이름 입력">
				      <label for="floatingInput">주문인 이름 입력</label>
				    </div>
				    <div class="form-floating hp">
				      <input type="text" name="user_hp1"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control hp" id="floatingPassword"/>
				      <i class="bi bi-dash"></i>
				      <input type="text" name="user_hp2"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control hp" >
					  <i class="bi bi-dash"></i>
				      <input type="text" name="user_hp3"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control hp"/>
				      <label for="floatingPassword">전화번호 입력</label>
				    </div>
				
				    <button class="w-100 btn btn-lg btn-primary" type="submit">확인</button>
				  </form>
			</main>
		</div>
	</div>
</section>

