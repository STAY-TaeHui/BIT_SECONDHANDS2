<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mysell.css" type="text/css">
<!-- sweat alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 주소 검색 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		setcategorytop();
	}

	//상품 등록 영역에 카테고리 넣어줄 함수
	function setcategorytop() {

		console.log("카테고리 대를 등록페이지에 뿌리기");

		$.ajax({

			url : "GetCategoryOk.ajax",
			type : "get",
			dataType : "json",

			success : function(responsedata) {

				console.log("이제 대분류카테고리를 등록 부분에 뿌려준다");
				console.log(responsedata);

				$("#top_t").append("<option id='defualt'>대분류</option>");

				$.each(responsedata, function(index, obj) {

					$("#top_t").append(
							"<option id='category_t"+obj.t_num+"' value="+obj.t_num+">"
									+ obj.t_name + "</option>");

				});

			},
			error : function(xhr) {
				console.log(xhr);
			}

		});

	}

	function setcategorymiddle() {

		console.log("카테고리 중");

		let index = $("#top_t option:selected").val();
		console.log(index);

		$.ajax({

			url : "GetCategoryMBOk.ajax",
			type : "get",
			dataType : "json",
			data : {
				c_number : index
			},
			success : function(responsedata) {

				console.log("이제 중분류카테고리를 뿌려준다");
				console.log(responsedata);

				$("#middle_m").empty();
				$("#middle_m").append("<option id='defualt'>중분류</option>");

				$.each(responsedata, function(index, obj) {

					$("#middle_m").append(
							"<option id='category_n"+obj.n_num+"' value="+obj.m_num+">"
									+ obj.m_name + "</option>");

				});

			},
			error : function(xhr) {
				console.log(xhr);
			}

		});

	}

	function setcategorybottom() {

		console.log("카테고리 소");

		let index = $("#middle_m option:selected").val();
		console.log(index);

		$.ajax({

			url : "GetCategoryMBOk.ajax",
			type : "get",
			dataType : "json",
			data : {
				c_number : index
			},
			success : function(responsedata) {

				console.log("이제 소분류카테고리를 뿌려준다");
				console.log(responsedata);

				$("#bottom_b").empty();
				$("#bottom_b").append("<option id='defualt'>소분류</option>");

				$.each(responsedata, function(index, obj) {

					$("#bottom_b").append(
							"<option id='category_n"+obj.b_num+"' value="+obj.b_num+">"
									+ obj.b_name + "</option>");

				});

			},
			error : function(xhr) {
				console.log(xhr);
			}

		});

	}
</script>
</head>
<body>
	<div id="fullwrap">

		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		<div id="bodywrap">
			<form action="productupload.do" id="frm" method="post">

				<div class="content">
					상품이미지 ( 최대 12 장 , 이미지 등록 구간에 드래그 & 드롭해주세요! )
					<div id="drop"
						style="border:1px solid black; min-width: 400px; height: 300px; padding: 3px; overflow: auto;">
						이미지 등록
						<div id="thumbnails"></div>
						<input type="hidden" id="imgs_name" name="imgs_name">
					</div>
				</div>
				<hr>
				<div class="form-group row">
					<label class="col-sm-1">제목</label>
					<div class="col-sm-2">
						<input type="text" name="subj" id="subj" placeholder="제목을 입력하세요">
					</div>
				</div>
				<hr>
				<div>
					카테고리 <select id="top_t" style="width: 200px;"
						onchange="setcategorymiddle()">
					</select> <select id="middle_m" style="width: 200px;"
						onchange="setcategorybottom()">
					</select> <select name="bottom_b" id="bottom_b" style="width: 200px;">
					</select> <input name="bottom" type="hidden" id="bottom">
				</div>
				<hr>
				<div>
					거래지역<br> <input type="text" id="sample4_postcode"
						placeholder="우편번호" readOnly> <input type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input name="addr" type="text" id="sample4_roadAddress"
						placeholder="도로명주소" readOnly style="width: 325px">
					<script>
						//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
						function sample4_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 참고 항목 변수

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample4_postcode').value = data.zonecode;
											document
													.getElementById("sample4_roadAddress").value = roadAddr;
											// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
											if (data.autoRoadAddress) {
												var expRoadAddr = data.autoRoadAddress
														+ extraRoadAddr;
												guideTextBox.innerHTML = '(예상 도로명 주소 : '
														+ expRoadAddr + ')';
												guideTextBox.style.display = 'block';

											} else if (data.autoJibunAddress) {
												var expJibunAddr = data.autoJibunAddress;
												guideTextBox.innerHTML = '(예상 지번 주소 : '
														+ expJibunAddr + ')';
												guideTextBox.style.display = 'block';
											}
										}
									}).open();
						}
					</script>
				</div>
				<hr>
				<div class="form-group row">
					<label class="col-sm-1">가격</label> <input type="text" id="price"
						name="price" placeholder="가격"> 원
				</div>
				<hr>
				<div class="form-group row">
					<label class="col-sm-1" name="content">설명</label>
					<div class="col-sm-2">
						<textarea rows="8" cols="100" style="resize: none"
							placeholder="내용을 입력하세요" id="content" name="content"></textarea>
						<div id="test_cnt"></div>
					</div>
				</div>
				<hr>
				<input type="button" value="등록하기" id="validation"> <input
					type="submit" id="submit" style="display: none"> <input
					type="hidden" id="storename" name="storename"
					value="${sessionScope.storename}">
			</form>
		</div>

		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>

	</div>
	<script>
		$(function() {
			console.log($('#storename').val());
			var uploadFiles = [];
			let count = 0;
			var $drop = $("#drop");
			$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
				$(this).addClass('drag-over');
			}).on("dragleave", function(e) { //드래그 요소가 나갔을때
				$(this).removeClass('drag-over');
			}).on("dragover", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}).on('drop', function(e) { //드래그한 항목을 떨어뜨렸을때
				e.preventDefault();
				$(this).removeClass('drag-over');
				var files = e.originalEvent.dataTransfer.files; //드래그&드랍 항목
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					var size = uploadFiles.push(file.name); //업로드 목록에 추가
					preview(file, size - 1); //미리보기 만들기
				}
			});

			function preview(file, idx) {
				var reader = new FileReader();
				reader.onload = (function(f, idx) {
					return function(e) {
						var div = '<div class="thumb"> \ <div class="close" data-idx="' + idx + '">X</div> \ <img src="'
								+ e.target.result
								+ '" title="'
								+ escape(f.name)
								+ '" width="150px" height="150px"/> \ </div>';
						if (count <= 12) {
							$('#thumbnails').append(div);
							count++;

						} else {
							swal({
								title : "사진은 최대 12장까지 가능합니다",
								icon : "error"
							});
						}

					};
				})(file, idx);
				reader.readAsDataURL(file);
			}

			//전체파일 한번에 업로드
			function groupUpload() {
				var formData = new FormData();
				$.each(uploadFiles, function(i, file) {
					if (file.upload != 'disable')
						formData.append('upload-file', file, file.name);
				});
				$.ajax({
					url : '/api/etc/file/upload',
					data : formData,
					type : 'post',
					contentType : false,
					processData : false,
					success : function(ret) {
						alert("완료");
					}
				});
			}

			$("#btnSubmit").click(groupUpload());


			$("#thumbnails").on("click", ".close", function(e) {
				var $target = $(e.target);
				var idx = $target.attr('data-idx');
				uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
				$target.parent().remove(); //프리뷰 삭제
			});

			$('#bottom_b').change(function() {
				//$('#bottom').val($('select[name=bottom_b] option:selected').text());
				$('#bottom').val($('#bottom_b').val());
				console.log($('#bottom').val());
			});

			//글자수 제한
			$('#content').on('keyup', function() {
				$('#test_cnt').html("(" + $(this).val().length + " / 200)");

				if ($(this).val().length > 200) {
					$(this).val($(this).val().substring(0, 200));
					$('#test_cnt').html("(200 / 200)");
				}
			});

			//유효성검사
			$('#validation').click(function() {

				//function check(){
				if ($('#subj').val() == '') {
					swal({
						title : "제목을 입력해주세요",
						icon : "error"
					});
					return;
				}

				if ($('#thumbnails').html() == '') {
					swal({
						title : "최소 이미지 하나를 넣어주세요",
						icon : "error"
					});
					return;
				}

				if ($('#bottom').val() == '') {
					swal({
						title : "카테고리를 선택해주세요",
						icon : "error"
					});
					return;
				}

				if ($('#sample4_postcode').val() == '') {
					swal({
						title : "거래지역을 선택해주세요",
						icon : "error"
					});
					return;
				}

				if ($('#price').val() == '') {
					swal({
						title : "가격을 입력해주세요",
						icon : "error"
					});
					return;
				}

				if ($('#content').val() == '') {
					swal({
						title : "내용을 입력해주세요",
						icon : "error"
					});
					return;
				}

				$('#imgs_name').val(uploadFiles);
				console.log(uploadFiles);

				$('#submit').click();

			});
		});
	</script>
</body>
</html>