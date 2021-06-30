<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- Modal -->
	<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">재고확인</h5>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--       <div class="modal-body"> -->
				<!--        <table id="proboard1" class="stripe row-border order-column" style="width:100%"> -->
				<div class="card-body table-responsive p-0" style="height: 300px;">
					<table id="proboard1" class="table table-head-fixed text-nowrap">
						<thead>
							<!-- 테이블머리 -->
						</thead>
						<tbody>
							<!-- 리스트만들기 -->
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
			<!-- 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header" style="background-color: black;">
						<h1 style="color: white;">Scanner</h1>
					</div>

					<div class="modal-dialog container">
						<div class="row row-cols-2">
							<div class="modal-body col-6">
								<div id="scanner">
									<div id="test"></div>
									<div id="reload"></div>
									<div>
										<div id="frame">
											<div id="loadingMessage">스캔준비중</div>
											<canvas id="canvas"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="col-6">
								<div id="output">
									<div id="outputMessage">회원정보</div>
								</div>
								<div id="outputLayer" hidden>
									<span id="outputData"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" id="foots">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" id="closemodal">닫기</button>

					</div>

				</div>
			</div>
		</div>
		<!-- 모달창끝 -->
		
		<!-- 마감ㄴ 성공시 모달 -->
<div class="modal fade" id="exit-success-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">대덕 워터 파크 퇴장</h3>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
<%--       	<img alt="" src="${WCP }/resources/assets/images/icons/water_dolphin__kdy_1.png"> --%>
      	<h1>즐거운 시간 보내셨나요?</h1>
      	<p class="lead">이용하시는 동안 재밌는 시간을 보내셨길 바라며,</p>
      	<p class="lead">잊은 물품이 없는지 다시 한 번 확인 부탁드립니다.</p>
      	<p class="lead">저희 대덕 워터 파크는 항상 최고의 서비스로 보답할 수 있도록 노력하겠습니다.</p>
      	<h2>방문해 주셔서 감사합니다.</h2>
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>