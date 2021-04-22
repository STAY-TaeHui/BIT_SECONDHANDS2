<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>


    <!--검색어 자동완성 j쿼리-->
    <!-- CSS , JS -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>

        
        $(function() {    //화면 다 뜨면 시작
			console.log("WHO IS FIRST");
        	
        	$("#categoryorder").css("display","none");
        		//상품 이미지 리스트 불러오기
        	$.ajax(
        			{	
        				url:"MyShopProductList.ajax",
        				data:{storename : '${sessionScope.storename}'},
        				type:"get",
        				dataType:"json",
        				success:function(responsedata){
        					console.log(responsedata);
							$.each(responsedata, function(index, obj){
      							
    							$(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"+obj.pimg_name+
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
        	
            
        });
        
        
        //최신순 정렬
        function orderbytime(){
        	
        	$("#timebtn").addClass("clickedbtn");
        	$("#timebtn").removeClass("unclickedbtn");
        	
        	$("#pricebtn").removeClass("clickedbtn");
        	$("#pricebtn").addClass("unclickedbtn");
        	
			console.log("최신순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"ProductOrderByTime.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword : $("#keyword").val()},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						//getlist(responsedata);
								
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
        	
        }
        
        //가격순 정렬
        function orderbyprice(){
        	
        	$("#pricebtn").addClass("clickedbtn");
        	$("#pricebtn").removeClass("unclickedbtn");
        	
        	$("#timebtn").removeClass("clickedbtn");
        	$("#timebtn").addClass("unclickedbtn"); 
        	
			console.log("가격순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"ProductOrderByPrice.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword : $("#keyword").val()},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						//getlist(responsedata);     						
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
			
        }
        
        
        
        //카테고리별 최신순 정렬
        function c_orderbytime(){
        	
        	$("#timebtn").addClass("clickedbtn");
        	$("#timebtn").removeClass("unclickedbtn");
        	
        	$("#pricebtn").removeClass("clickedbtn");
        	$("#pricebtn").addClass("unclickedbtn");
        	
			console.log("최신순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"C_ProductOrderOk.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword : $("#bottom option:selected").val(),
        						type: "time"},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						//getlist(responsedata);
								
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
        	
        }
        
        //카테고리별 가격순 정렬
        function c_orderbyprice(){
        	
        	$("#pricebtn").addClass("clickedbtn");
        	$("#pricebtn").removeClass("unclickedbtn");
        	
        	$("#timebtn").removeClass("clickedbtn");
        	$("#timebtn").addClass("unclickedbtn"); 
        	
			console.log("가격순정렬");
        	
			$.ajax(
        			
        			{	
        				url:"C_ProductOrderOk.ajax",
        				type:"post",
        				dataType:"json",
        				data: { keyword :$("#bottom option:selected").val(),
        					type:"price"},
        				success:function(responsedata){
        					console.log(responsedata);
        						$(".productlist").empty();
        					       					
        						//getlist(responsedata);       						
        					
        				},
        				error:function(xhr){
        					console.log(xhr);
        				}
        			}
        			
        		);
			
        }
        function productlist(){
        	$
        }
        
		   

    </script>
</head>

<body>


	<div id="fullwrap">
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		
		<div id="bodywrap">
		
	
		<div id="list">
			<span id=""></span>
			<ul class="myproductlist">
			</ul>
		
		</div>
	    <!-- Latest Blog Section End -->
		
	
	
		
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	    <!-- bodywrap end -->
	    </div>
	     
	     
     </div>
	    <!-- fullwrap end -->
	
	    <!-- Js Plugins -->
	    <script src="js/jquery-3.3.1.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/jquery-ui.min.js"></script>
	    <script src="js/jquery.countdown.min.js"></script>
	    <script src="js/jquery.nice-select.min.js"></script>
	    <script src="js/jquery.zoom.min.js"></script>
	    <script src="js/jquery.dd.min.js"></script>
	    <script src="js/jquery.slicknav.js"></script>
	    <script src="js/owl.carousel.min.js"></script>
	    <script src="js/main.js"></script>

</body>

<html>

