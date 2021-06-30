/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2021. 5. 26.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26.      정이삭       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */ 



	$('#exampleModal').on('show.bs.modal', function() {
			

		
			var video = document.createElement("video");

			var canvasElement = document.getElementById("canvas");

			var canvas = canvasElement.getContext("2d");

			var loadingMessage = document.getElementById("loadingMessage");

			var outputContainer = document.getElementById("output");

			var outputMessage = document.getElementById("outputMessage");

			var outputData = document.getElementById("outputData");

			function drawLine(begin, end, color) {

				canvas.beginPath();

				canvas.moveTo(begin.x, begin.y);

				canvas.lineTo(end.x, end.y);

				canvas.lineWidth = 4;

				canvas.strokeStyle = color;

				canvas.stroke();

			}

			// 카메라 사용시

			navigator.mediaDevices.getUserMedia({
				video : {
					facingMode : "environment"
				}
			}).then(function(stream) {

				video.srcObject = stream;

				video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달

				video.play();

				requestAnimationFrame(tick);

			});

			function tick() {

				loadingMessage.innerText = "스캔 기능을 활성화"
					//스캐너 비활성화
				if(scannerToggle==false){return}
				if (video.readyState === video.HAVE_ENOUGH_DATA) {

					loadingMessage.hidden = true;

					canvasElement.hidden = false;

					outputContainer.hidden = false;

					// 읽어들이는 비디오 화면의 크기

					canvasElement.height = video.videoHeight;

					canvasElement.width = video.videoWidth;

					canvas.drawImage(video, 0, 0, canvasElement.width,
							canvasElement.height);

					var imageData = canvas.getImageData(0, 0,
							canvasElement.width, canvasElement.height);

					var code = jsQR(imageData.data, imageData.width,
							imageData.height, {

								inversionAttempts : "dontInvert",

							});

					// QR코드 인식에 성공한 경우

					if (code) {

						// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

						drawLine(code.location.topLeftCorner,
								code.location.topRightCorner, "#FF0000");

						drawLine(code.location.topRightCorner,
								code.location.bottomRightCorner, "#FF0000");

						drawLine(code.location.bottomRightCorner,
								code.location.bottomLeftCorner, "#FF0000");

						drawLine(code.location.bottomLeftCorner,
								code.location.topLeftCorner, "#FF0000");
//						소제목 숨기기
//						outputMessage.hidden = true;

						outputData.parentElement.hidden = false;
						console.log(code.data)
						// QR코드 메시지 출력
						pocketdata = {};
//						json파싱
						try{
							pocketdata = JSON.parse(code.data);							
						}catch(e){
							Swal.fire(
									"유효하지 않은 qr코드입니다"
							)
						}
//						조회인지 결제인지 확인
						var headline = $("#outputMessage").text();
						if(scannerToggle){
							if(headline == "포켓코인 정보"){
								payedMent(pocketdata.coin_code);
								scannerToggle = false;
							}else if(headline == "결제내역"){
								
//		=============================================================================================								
								//현재 카트에 올라간 상품의 갯수 구하기
								let pcount = $("#prodCart").find("tr").length;
								//list<map>만들기
								let listMap = new Array();
								let coin_code =  pocketdata.coin_code;
								for(let i = 0; i < pcount;i++){
									let prod_name = $("#prodCart").find("h6:eq("+i+")").text();
									let lprod_code = $("#prodCart").find("tr:eq("+i+")").attr("id");
									let qty = $("#prodCart").find(".number:eq("+i+")").text();
									let prod_price = $("#prodCart").find(".hprice:eq("+i+")").text();

									let cartMap = { 
														"lprod_code" : lprod_code,
														"qty" : qty,
														"prod_price" : prod_price,
														"coin_code" : coin_code,
														"total" : total
													}
									listMap.push(cartMap);
								}
								buyprod(listMap);
								console.log(listMap);
//		=============================================================================================
								scannerToggle = false;
	//							지금 판매되는 내역들을 json으로 파싱하고 ajax로 결제내역으로 보내기
							}else if(headline == "구매내역"){
								useList(pocketdata.coin_code);
								scannerToggle = false;
							}else{
								location.reload();
							}
						// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
						}
					}

					// QR코드 인식에 실패한 경우 

					else {

						outputMessage.hidden = false;
						
//						outputData.parentElement.hidden = true;

					}

				}

				
				requestAnimationFrame(tick);

			}

		});

