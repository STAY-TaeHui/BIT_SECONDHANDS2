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

</head>

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

<body>
	<div id="fullwrap">
		<jsp:include page="WEB-INF/views/include/header_without_c.jsp"></jsp:include>
		
		<div id="bodywrap">
		<form action="productupload.do" method="get" enctype="multipart/form-data">
			<div class="content" name="p_image">
				상품이미지 <input type="button" id="btnSubmit" value="업로드" />
				<div id="drop" style="width: 1000px; height: 300px; padding: 3px; overflow:auto;">
					이미지 등록
					<div id="thumbnails"></div>
				</div>

			</div>
			<hr>
			<div class="form-group row" name="tittle">
				<label class="col-sm-1">제목</label>
				<div class="col-sm-2">
					<form action="#">
						<textarea rows="1" cols="110" style="resize: none"
							placeholder="제목을 입력하세요"></textarea>
					</form>
				</div>
			</div>
			<hr>
			<div name="categorie">카테고리
			<select id="top_t" style="width: 200px;" onchange="setcategorymiddle">
			</select> 
			<select id="middle_m" style="width: 200px;"
				onchange="setcategorybottom">
			</select> 
			<select id="bottom_b" style="width: 200px;">
			</select>
			</div>
			<hr>
			<div name="location">거래지역</div>
			<hr>
			<div class="form-group row">
				<label class="col-sm-1" name="status">상태</label>
				<div class="col-sm-2">
					<input type="radio" name="condition" value="New "> 새 제품 <input
						type="radio" name="condition" value="Old "> 중고 제품
				</div>
			</div>
			<hr>
			<div class="form-group row">
				<label class="col-sm-1" name="price">가격</label>
				<div class="col-sm-2">
					<form action="#">
						<textarea rows="1" cols="40" style="resize: none"
							placeholder="숫자를 입력하세요"></textarea>
					</form>
					
				</div>
			</div>
			<hr>
			<div class="form-group row">
				<label class="col-sm-1" name="content">설명</label>
				<div class="col-sm-2">
					<form action="#">
						<textarea rows="8" cols="140" style="resize: none"
							placeholder="내용을 입력하세요"></textarea>
					</form>
				</div>
			</div>
			<hr>
				<input type="button" value="등록하기" id="submit">
			</form>
		</div>
		<jsp:include page="WEB-INF/views/include/footer.jsp"></jsp:include>
	</div>
	<script>
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
				var size = uploadFiles.push(file); //업로드 목록에 추가
				preview(file, size - 1); //미리보기 만들기
			}
		});
		function preview(file, idx) {
			var reader = new FileReader();
			reader.onload = (function(f, idx) {
				return function(e) {
					var div = '<div class="thumb"> \
<div class="close" data-idx="' + idx + '">X</div> \
<img src="'
							+ e.target.result
							+ '" title="'
							+ escape(f.name)
							+ '" width="150px" height="150px"/> \
</div>';
					if(count<=12){
					$("#thumbnails").append(div);
					count++;
					
					}else{
						swal({
							title : "사진은 최대 12장까지 가능합니다",
							icon : "error"
						});
					}
					
				};
			})(file, idx);
			reader.readAsDataURL(file);
		}
		$("#btnSubmit").on("click", function() {
			var formData = new FormData();
			$.each(uploadFiles, function(i, file) {
				if (file.upload != 'disable') //삭제하지 않은 이미지만 업로드 항목으로 추가
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
		});
		$("#thumbnails").on("click", ".close", function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			uploadFiles[idx].upload = 'disable'; //삭제된 항목은 업로드하지 않기 위해 플래그 생성
			$target.parent().remove(); //프리뷰 삭제
		});
	</script>
</body>
</html>