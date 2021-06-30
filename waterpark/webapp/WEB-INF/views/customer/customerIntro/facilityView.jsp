<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<style>
.img-fluid{
margin-top: 20px;
    margin-left: 30px;
    border: 1px solid gray;
}
.img-head{
display: flex;
}
blockquote{
    margin-right: 50px !important;
}
.infor{
    margin: 30px;
}
.pageView .pageContainer .pageWrap .contBox {
    position: relative;
    z-index: 0;
    margin-top: 6px;
    padding-left: 70px;
}
ul{
	list-style: none;
	display: flex;
}
li {
	margin-left:25px;
	margin-bottom: 0px;
    display: list-item;
    text-align: -webkit-match-parent;
}
.clfix{

}
</style>

<link href="${WCP }/resources/common/css/facil-css.css" rel="stylesheet">
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>시설 소개</h2>
          <ol>
            <li><a href="${WCP }/customer/info/facilities">Home</a></li>
            <li><a href="blog.html">Blog</a></li>
            <li>Blog Single</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
<c:if test="${not empty attraction }">
	<section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-12 entries">

            <article class="entry entry-single">


			  <div class="infor">
              <h2 class="entry-title">
                <a href="blog-single.html">${attraction.fc_name }</a>
              </h2>
				
              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="#">관리자</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="#"><time datetime="2021-06-28">6월 29일, 2021년</time></a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="#">0 Comments</a></li>
                </ul>
              </div>

              <div class="entry-content">
              <div class="img-head">
			              
                <blockquote>
                  <p>
                    ${attraction.att_sdesc }
                  </p>
                </blockquote>
                <div class="entry-img">
                <img src="${WCP }${attraction.fc_photo}" alt="이미지자리" class="img-fluid" style="width: 420px;height: 280px;'">
                

              </div>
                </div>
				<p>
                ${attraction.att_desc }
                </p>
				<div class="contBox">
								<strong>이용제한</strong>
								<ul class="limit clfix">
								
									<li><img src="${WCP }/resources/emp-img/attraction/women.gif" alt=""><br>임산부</li>
								
									<li><img src="${WCP }/resources/emp-img/attraction/noin.gif" alt=""><br>노약자</li>
								
									<li><img src="${WCP }/resources/emp-img/attraction/drunker.gif" alt=""><br>음주자</li>
								
								</ul>
							</div>
              </div>
				<br>
              <div class="entry-footer">
                <i class="bi bi-folder"></i>
                <ul class="cats">
                  <li><a href="#">Attraction</a></li>
                </ul>

                <i class="bi bi-tags"></i>
                <ul class="tags">
                  <li><a href="#">Creative</a></li>
                  <li><a href="#">Fun</a></li>
                  <li><a href="#">Thrilling</a></li>
                </ul>
              </div>
			</div>
            </article><!-- End blog entry -->
			

            </div><!-- End sidebar -->

          </div><!-- End blog sidebar -->

        </div>

      </div>
    </section><!-- End Blog Single Section -->
</c:if>
