<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String currentStorename = (String) session.getAttribute("storename");
String storename = (String) request.getAttribute("storename");
String profile = (String) request.getAttribute("profile");

if (profile == null) {
	profile = "default.png";
}

System.out.println(currentStorename);
System.out.println(storename);
System.out.println(profile);

String realPath = application.getRealPath("fileUpload");
System.out.println(realPath);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/myshop.css" type="text/css">
<!--  탭 부트스트랩  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<div id="fullwrap">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

		<div id="bodywrap">
			<div id="productdetailName">
				<h4>상품정보</h4>
			</div>
			<hr>
			<form method="post" action="editMember.do" id="submit"
				enctype="multipart/form-data">
				<div id="ProductTotal">
					<div id="ProductPhoto">
						<div class="box">
							<img src="" id="img" width="300px" height="300px"> <input
								type="file" id="file" name="file" style="display: none;">
							<input id="storename" name="storename" value="<%=storename%>"
								type="hidden">
							<c:choose>
								<c:when test="${storename eq param.storename}">
									<input type="button" value="내 상점 관리" id="myshopeditBtn" name="">
									<input type="button" value="수정하기" id="editBtn" name="">
								</c:when>
								<c:otherwise>
									<input type="button" value="내 상점 관리" id="myshopeditBtn" name=""
										style="display: none;">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="Storename">
						<%
						out.print("" + storename + "<br>");
						%>
					</div>
					<br> <input type="button" value="취소하기" id="cancelBtn" name=""
						style="display: none"> <input type="button" value="이름바꾸기"
						id="nameeditBtn" name=""> <input type="text"
						placeholder="바꿀 이름" id="nameText" style="display: none"
						name="nameText"> <input type="button" value="유효성 검사"
						id="nameCheck" style="display: none">
				</div>
			</form>

		</div>
		<div style='width: 100%; margin: 0 auto; margin-top: 50px;'>
			<ul class="nav nav-tabs">
				<li class='active'><a href="#tabmenu_01" data-toggle="tab">상품</a></li>
				<li><a href="#tabmenu_02" data-toggle="tab">찜</a></li>
				<li><a href="#tabmenu_03" data-toggle="tab">상품후기</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane fade in active" id="tabmenu_01">
					<p>상품</p>
					<hr>
				</div>
				<div class="tab-pane fade" id="tabmenu_02">
					<p>찜</p>
					<hr>
				</div>
				<div class="tab-pane fade" id="tabmenu_03">
					<p>상품후기</p>
				</div>
			</div>
		</div>
		<!-- Footer Section Begin -->
		<!-- Footer Section End -->
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function() {
	let currentStorename = '<%=currentStorename%>';
	let storename = '<%=storename%>';
	let profile = '<%=profile%>';
		let nameCan = false;
		let profilePath = "fileUpload/" + profile;
		console.log(currentStorename);
		console.log(storename);
		console.log(profilePath);

		$('#img').attr("src", profilePath);

		$('#img').click(function(e) {
			$('#file').click();
		});

		$('#file').change(
				function(event) {
					var reader = new FileReader();
					reader.onload = function(event) {
						var img = document.createElement("img");
						document.getElementById('img').setAttribute("src",
								event.target.result);
					};
					reader.readAsDataURL(event.target.files[0]);
				});

		$('#editBtn').click(function() {
			if ($('#file').val() == '' && $('#nameText').val() == '') {
				swal({
					title : "내용이 바뀌지 않았습니다",
					icon : "error"
				});
				return;
			}
			$('#submit').submit();
		});

		$('#nameeditBtn').click(function() {
			$(this).attr("style", "display:none");
			$('#cancelBtn').attr("style", "display:block");
			$('#nameText').attr("style", "display:block");
			$('#nameCheck').attr("style", "display:block");
		});

		$('#cancelBtn').click(function() {
			$(this).attr("style", "display:none");
			$('#nameeditBtn').attr("style", "display:block");
			$('#nameText').attr("style", "display:none");
			$('#nameCheck').attr("style", "display:none");

		});

		$('#nameCheck').click(function() {
			let nameText = $('#nameText').val();
			if (nameText == '') {
				swal({
					title : "바꿀 이름을 입력해주세요",
					icon : "error"
				});
				return;
			}

			$.ajax({
				url : "NameCheckOk.ajax",
				data : {
					nameText : nameText,
					originalPath : profile
				},
				type : "get",
				dataType : "html",
				success : function(data) {
					if (data == 'true') {
						swal({
							title : "사용할 수 있는 이름입니다. \n수정하기를 눌러야 적용됩니다.",
							icon : "success"
						});
						nameCan = true;
					} else {
						swal({
							title : "사용할 수 없는 이름입니다.",
							icon : "error"
						});
						nameCan = false;
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	});
</script>
</html>