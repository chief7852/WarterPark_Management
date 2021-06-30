<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
	.col-lg-4{
		margin-top: 20px; 
	}
</style>
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>시설 소개</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="blog.html">워터파크 소개</a></li>
            <li>시설 소개</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
<div id="mapArea">
	
</div>

<section id="testimonials" class="testimonials">


	<div class="container">
	
<!-- 		<div class="input-group mb-3 att-select"> -->
<!-- 		  <select class="custom-select " id="inputGroupSelect02"> -->
<!-- 		    <option selected>전체</option> -->
<%-- 		    <c:if test="${not empty facList }"> --%>
<%-- 		    	<c:forEach items="${facList }" var="fac"> --%>
<%-- 		    		<option value="${fac['COM_CODE'] }">${fac["COM_CODE_NAME"] }</option> --%>
<%-- 		    	</c:forEach> --%>
<%-- 		    </c:if> --%>
<!-- 		  </select> -->
<!-- 		</div> -->
		<a href="#" class="getstarted">신규 어트랙션 등록</a>
<!-- 	<input type="button" name="attCreate" class="getstarted" value="신규 어트랙션 등록"/> -->
		<div class="row">
		<c:choose>
			<c:when test="${not empty attractionList }">
				<c:forEach items="${attractionList }" var="att">
				<c:url value="/customer/info/facility" var="FViewURL">
					<c:param name="what" value="${att.fc_id }"/>
				</c:url>
		          <div class="col-lg-4">
		          		<a href="${FViewURL }">
				            <div class="testimonial-item">
				              <img src="${WCP }${att.fc_photo}" class="" alt="">
				              <h3>${att.fc_name }</h3>
				              <h4>${att.att_available eq 'Y' ? '운영 중' : '운영 중단' }</h4>
				              <p>
				                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
				                ${att.att_sdesc }
				                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
				              </p>
				            </div>
		         		 </a>
		          </div>
		         </c:forEach>
	          </c:when>
	          <c:otherwise>
	          	현재 이 페이지는 리뉴얼 중 입니다.
	          </c:otherwise>
          </c:choose>
		</div>
	</div>
</section>

