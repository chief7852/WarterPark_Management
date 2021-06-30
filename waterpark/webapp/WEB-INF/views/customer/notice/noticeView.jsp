<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.table-responsive{
		width: 60%;
		margin: auto;
		
	}
	#noticeTitle{
		font-weight : bold;
	}
	#buttonDiv{
		float:right;
	}
	.page-header {
	margin-left: 370px;
	font-weight: bold;
	}
	span{
		margin-right:1px;
	}
	.sub_content{
		width:70%;
		margin-left: 15%;
		background-color: white;
	}
	th{
		text-align: center;
	}
	.freeboard{
		font-size: xx-large;
	}
	#customer-cover-section{

 	background-image: url("${WCP}/resources/customer/common/img/notice.jpg");
	}
</style>
<link href="${WCP }/resources/customer/common/css/viewform.css" rel="stylesheet">
<%-- <link href="${WCP }/resources/customer/common/css/commonview.css" rel="stylesheet"> --%>
<link href="${WCP }/resources/customer/common/css/viewcomunity.css" rel="stylesheet">
<br><br>
<section>
<div class="row" style="margin-bottom:20px; margin-left:1px;">
<div class="sub_content">
                        <div class="postscript_area">
                            <ul class="post_con">
                                <li class="post_title">고객님들의 편의를 알려주기위한 공지 게시판입니다.</li>
                                <li class="post_font">문의사항은 문의글을 작성해주시면 감사하겠습니다. 여러분의 소중한 의견을 기다립니다.<br>
                                   
                                </li>
                            </ul>

                        </div>

                        <!-- 게시판 검색폼 -->
                        
<!-- board s -->
<div class="tbl_view">
    <table summary="제목, 작성자, 작성일, 조회수, 첨부파일, 내용 정보 제공">
        <caption>문의게시판 상세내용</caption>
        <colgroup>
            <col width="74">
            <col width="386">
            <col width="74">
            <col width="*">
            <col width="74">
            <col width="71">
        </colgroup>
        <thead>
            <tr>
                <td colspan="6" class="title freeboard">
                    <p style="
    margin-bottom: 0;
    font-size: larger;
    padding: 30px;
">
                        ${noticeDetail.uboard_title }
                    </p>
                </td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td class="tl">
                    관리자</td>
                <th scope="row">작성일</th>
                <td>
                    ${noticeDetail.uboard_date }</td>
                <th scope="row">조회수</th>
                <td>
                    ${noticeDetail.uboard_hit }</td>
            </tr>
            <tr>
                <th scope="row">첨부파일</th>
                <td colspan="5" class="tl">
                    <iframe name="_downframe" id="_downframe" frameborder="0" scrolling="no" width="0" height="0" title="첨부파일"></iframe></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6">
                    <div>
                        <p style="color: rgb(24, 24, 24); font-family: 나눔고딕, NanumGothic, 돋움, dotum, AppleGothic; font-size: 11px;">${noticeDetail.uboard_cont }</p>
                    </div>
                </td>
            </tr>
        </tbody>
        <tfoot>


        </tfoot>
    </table>
</div>
<div id="buttonDiv">
<a href="/waterpark/customer/use-info/notice?luboardCode=NT" class="btn btn-primary">돌아가기</a>
<c:if test="${not empty EmpVO }">
		<button type="button" id="deleteBtn" class="btn btn-danger"
		data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button>
</c:if>
</div>
</div>

</div>
</section>
<script>
	$("#deleteBtn").on("click",function(){
		Swal.fire({
			  title: 'Are you sure?',
			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    Swal.fire(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    )
			  }
			})
	})
</script>
