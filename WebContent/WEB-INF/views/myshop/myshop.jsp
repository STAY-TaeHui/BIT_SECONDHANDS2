<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<style>
.fadetb {
  opacity: 0;
  -webkit-transition: opacity .15s linear;
       -o-transition: opacity .15s linear;
          transition: opacity .15s linear;
}
.fade.in {
  opacity: 1 !important;
}
.tab-content > .tab-pane {
  display: none;
}
.tab-content > .active {
  display: block;
}
</style>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/myshop.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/tab.css" type="text/css">
    
 
    <!-- 제이쿼리 문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
    <!--  탭 부트스트랩  -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>
	<div id="fullwrap" >
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<div id="bodywrap">
<div id="productdetailName">
<h4>상점정보</h4>

</div>
<hr>
<div id="ProductTotal">
<div id="ProductPhoto">

<input type="button" value="내 상점 관리" id="myshopeditBtn" name="">


</div>
<div id="Storename">
	
<%
		String storename = request.getParameter("storename");
		//out.print(storename);
        session = request.getSession();
        out.print(""+ session.getAttribute("storename") + "<br>");
        //session = request.getSession();
        //out.print(""+session.getAttribute("isLogined"));	
%>
</div>

	<c:choose>
		<c:when test="${session.storename == storename}">
			<input id="editBtn" type="button" value="수정하기">
			<input type="button" value="내 상점 관리" id="myshopeditBtn" name="">
			<div>외 안되?</div>
		</c:when>
		<c:otherwise>
			<input id="editBtn" type="button" value="수정하기" style="display:none;">
			<input type="button" value="내 상점 관리" id="myshopeditBtn" name="" style="display:none;">
			<div>외 안되?</div>
		</c:otherwise>
	</c:choose>
</div>
	
<div style='width:100%;margin:0 auto;margin-top:50px;'>
	<ul class="nav nav-tabs">
		<li class='active'><a href="#tabmenu_01" onclick="productlist()" data-toggle="tab"> 상 품 </a></li>
		<li><a href="#tabmenu_02" data-toggle="tab"> 찜 </a></li>
		<li><a href="#tabmenu_03" data-toggle="tab"> 거래 후기 </a></li>
	</ul>
	<div class="tab-content" >
		<div class="tab-pane fade in active" id="tabmenu_01">
			<!-- 상품 리스트 뿌려주는곳 -->
			<div class="counttext">
			상품<p class="count"></p>  개
			</div>
			<ul class="myproductlist"></ul>
		</div>
		<div class="tab-pane fade" id="tabmenu_02">
			
			<ul class="mylikelist"> likelist </ul>
		</div>
		<div class="tab-pane fade" id="tabmenu_03">
			<ul class="myreviewlist"> review </ul>
		</div>
	</div>
</div>
<!-- Footer Section Begin -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
<!-- Footer Section End -->
</div>
</div>
</body>
<script type="text/javascript">
	$(function() {    //화면 다 뜨면 시작
		console.log("WHO IS FIRST");
		
		/* $("#categoryorder").css("display","none"); */
			//상품 이미지 리스트 불러오기
		
		$.ajax(
				{	
					url:"MyShopProductList.ajax",
					data:{storename : '${requestScope.storename}'},
					type:"get",
					dataType:"json",
					success:function(responsedata){
						console.log("바로실행 아약스 안");					
						$.each(responsedata, function(index, obj){
								console.log(obj)
								$(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
					    				+"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
					    						"</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
					    						"<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
						});
						let count = responsedata.length
						console.log(count);
						$('.count').html(count);
						
						       					
					},
				
					
					error:function(xhr){
						console.log(xhr);
					}
				}
				
				
			);
		
	    
	});
	
	 function productlist(){
		 
     	$.ajax(
     			{	
     				url:"MyShopProductList.ajax",
     				data:{storename : '${requestScope.storename}'},
     				type:"get",
     				dataType:"json",
     				success:function(responsedata){
     					console.log("펑션 안입니다");
     					$('.myproductlist').empty();
							$.each(responsedata, function(index, obj){
   							
								$(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
   				    				+"<img src='${pageContext.request.contextPath}/img/store/"+obj.pimg_name+"'>"+
   				    						"</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
   				    						"<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
 						});
     					//getlist(responsedata);
     					       					
     				},
     			
     		
     				error:function(xhr){
     					console.log(xhr);
     				}
     			}
     			
     			
     		);
     }



/*
$('#target_img').click(function (e) {
    document.signform.target_url.value = document.getElementById( 'target_img' ).src;
    e.preventDefault();
    $('#file').click();
});    

function changeValue(obj){
	   document.signform.submit();

	}
*/
/*
$('#btnUpload').on('click', function(event) {
    event.preventDefault();
    
    var form = $('#uploadForm')[0]
    var data = new FormData(form);
    
    $('#btnUpload').prop('disabled', true);
	
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "upload",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (data) {
        	$('#btnUpload').prop('disabled', false);
        	alert('success')
        },
        error: function (e) {
            $('#btnUpload').prop('disabled', false);
            alert('fail');
        }
    });
})
*/
</script>


</html>