<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- 상품 문의 목록 -->
<c:set var="replyList" value="${requestScope.replylist}" />

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
    <!-- 내가 커스텀한 css -->
    <link rel="stylesheet" href="css/productdetail.css" type="text/css">
</head>

<body>

<div id="fullwrap">
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	
	<div id="bodywrap">

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
            <div class="row">
              
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="${pageContext.request.contextPath}/img/store/${jsonobj.pimg_name}" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                <ul>
                                	<li>${jsonobj.storename}</li>
                                	<li><h4>${jsonobj.p_subj}</h4></li>
                                	<li><h3>${jsonobj.p_price}원</h3></li>
                                </ul>
                                <!--  

                                <div class="pd-desc">-->
                                
                                </div>
                                <hr>
                                <div id="pd-time">

                                	${jsonobj.p_wr_time}

                                </div>
                                <div id="contactseller">
                                	<input type="button" value="찜♥" id="like">
                                     <input type="button" value="연락하기" id="call" onclick="contact()">
                                    <input type="button" value="바로구매" id="buynow">
                                </div>
						<!--  
                            </div>-->
                        </div>
                    </div>
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">상품정보</a>
                                </li>
                                <!--  
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">SPECIFICATIONS</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">Customer Reviews (02)</a>
                                </li>
                                -->
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-8" id="p_content">
                                            <div>
                                                <h5>상품 소개</h5>
                                                <p>${jsonobj.p_content}</p>
                                                </div>
                                                
                                                <!-- 상품 문의 댓글 영역 -->
                                                <div id="replyarea">
                                                <c:if test="${not empty replyList}">
                                                
													<c:forEach var="reply" items="${replyList}" varStatus="index">
														<table id="replay${reply.index}"><!-- 이거 넘버링 안됨 -->
															<tr >
																<th class="replywriter">${jsonobj.storename}</th>
															</tr>
															<tr class="replaycontent">
																
																<td>
																${reply.rp_content}
																</td>
															</tr>
															<tr class="replaybtn">
																<td>
																	<input type="button" value="댓글달기">
																	<input type="button" value="삭제하기">
																	<input type="button" value="수정하기">
																</td>
															</tr>
														</table>
													</c:forEach>
												</c:if>
                                                	
                                                
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="shopcontainer">
                                            <!--  
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                                -->
                                                <h5>상점 정보</h5>
                                                <div id="shopinfo">
	                                                <div id="title">
	                                                ${jsonobj.m_profile}
	                                                ${jsonobj.storename}
	                                                </div>
	                                                
	                                                <c:choose>
	                                                <c:when test="${ empty jsonarr}">
	                                                 <p>더 이상 등록된 상품이 없습니다</p>
	                                                
	                                                </c:when>
	                                                
	                                                <c:otherwise>
	                                                
	                                               <c:forEach var="arr" items="${jsonarr}">
	                                               
	                                                <div class ="recently_p" >
	                                                <img src="${pageContext.request.contextPath}/img/store/${arr.pimg_name}">
	                                                	<div class="pricearea">
	                                                	<p>${arr.p_price}원</p>
	                                                	</div>
	                                                </div>
	                                                
	                                                </c:forEach>
	                                                
	                                                </c:otherwise>
	                                                </c:choose>
	                                               
                                                </div>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    
    <!-- Related Products Section End 
    <div class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Related Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/products/women-1.jpg" alt="">
                            <div class="sale">Sale</div>
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Coat</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $14.00
                                <span>$35.00</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/products/women-2.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Shoes</div>
                            <a href="#">
                                <h5>Guangzhou sweater</h5>
                            </a>
                            <div class="product-price">
                                $13.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/products/women-3.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Pure Pineapple</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="product-item">
                        <div class="pi-pic">
                            <img src="img/products/women-4.jpg" alt="">
                            <div class="icon">
                                <i class="icon_heart_alt"></i>
                            </div>
                            <ul>
                                <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                <li class="quick-view"><a href="#">+ Quick View</a></li>
                                <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                            </ul>
                        </div>
                        <div class="pi-text">
                            <div class="catagory-name">Towel</div>
                            <a href="#">
                                <h5>Converse Shoes</h5>
                            </a>
                            <div class="product-price">
                                $34.00
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    Related Products Section End -->

    <!-- Partner Logo Section Begin -->

    <!-- Partner Logo Section End -->


   
    
    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
     <!-- bodywrap end -->
    </div>
</div>
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
    
    <script>
    	window.onload=function(){
    		
    		init();
   		
    		//카테고리 유지시키기(미완)
    		setCategory();
    		
    		
    		
    		
    	}
    	
    	//카테고리 유지 함수
    	
    	function setCategory(){
    		
    		
    		let t = ${categoryarr.t_num};
    		let m = ${categoryarr.m_num};
    		let b = ${categoryarr.b_num};
    		/*
    		t.attr("selected","selected");
    		m.attr("selected","selected");
    		b.attr("selected","selected");
    		
    		
    		//$("#top").val(${categoryarr.t_num}).attr("selected");
    		
    		$("#top").val(t).prop("selected", true);
    		$("#middle").val(m).prop("selected", true);
    		$("#bottom").val(b).prop("selected", true);
    		*/
    		console.log("카테고리는?");
    		console.log(${categoryarr.t_num});
    	}
 	
    	///////////////////////////////////////////////
    	
    	// 현재 접속한 아이디가 이걸 찜했는지 확인
    	/* 
    	1. 접속한 아이디가 해당 상품의 아이디와 다른지
    	2. 찜했는지
    	3. 댓글 썼는지
    	
    	를 확인해야 한다
    	
    	*/
    	
    	//접속 아이디의 위 세 정보를 가져오는 함수
    	function getCurrentUser(){
    		
    		/*
    		$.ajax(
    				
    				{
    					
    					url:"chekcurrentuser.ajax",
    					dataType:"json",
    					
    						
    				}
    				
    				);
    		*/
    	}
    		  
	    	/*
	    	if(currentuser === "null"){
	    		swal("로그인이 필요합니다.")
	    		
	    	} 
    	*/
    	
    	
    	//찜 버튼 색깔 바꾸기 위해 선언
	    const like = document.querySelector("#like");	    
	    const BASE_COLOR = "darkgray";
	    const OTHER_COLOR = "#f70000";
	    
	     
	    //색 바뀌는 함수
	    function handClick(){
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
			
		
	    	const currentColor = like.style.background;
	    	
	        if(currentColor === BASE_COLOR){
	        	
	        	like.style.background = OTHER_COLOR;
	        	
	        	
	        }else{
	        	
	        	like.style.background = BASE_COLOR;
	        }
	        
	        likeup(currentColor, currentuser);
	        
	    	
	    }
	     
	    //찜버튼 초기화값
	    function init(){
	    	like.style.background = BASE_COLOR;
	    	like.addEventListener("click",handClick);
	    	
	    }
	    
	    
	    //찜하는 함수
	    function likeup(currentColor, currentuser){
	    	
	    	  	
	    	
	    	console.log("현재 유저");
	    	console.log(currentuser);

	    	
	    	if(currentColor === BASE_COLOR){
	    		console.log("이 상품을 찜합니다");
	    		
	    		$.ajax(
	    	    		{
	    	    			
	    	    			url:"setlike.ajax",
	    	    			dataType:"text",
	    	    			data:{
	    	    				islike:"true",
	    	    				liker:currentuser,
	    	    				p_num:${jsonobj.p_num}
	    	    			},
	    	    			success:function(responsedata){
	    	    				
	    	    				let check = responsedata.trim();
	    	    				console.log(check);
	    	    				
	    	    				if(check == "true"){
	    	    					
	    	    					swal("이 상품을 찜했습니다");
	    	    					
	    	    					
	    	    				} else{
	    	    					
	    	    					swal("이런, 찜하기 실패했네요");
	    	    					like.style.background = BASE_COLOR;
	    	    				}
	    	    				
	    	    				
	    	    			},
	    	    			error:function(xhr){
	    	    				
	    	    				console.log(xhr);
	    	    			}
	    	    			
	    	    		}		
	    	    	);

	    		
	    	} else {
	    		console.log("이 상품의 찜을 해제합니다");
	    		
	    		$.ajax(
	    	    		{
	    	    			
	    	    			url:"setlike.ajax",
	    	    			dataType:"text",
	    	    			data:{
	    	    				islike:"false",
	    	    				liker:currentuser,
	    	    				p_num:${jsonobj.p_num}
	    	    			},
	    	    			success:function(responsedata){
	    	    				
	    	    				let check = responsedata.trim();
	    	    				console.log(check);
	    	    				
	    	    				if(check == "false"){
	    	    					
	    	    					swal("찜하기 취소되었습니다");
	    	    					
	    	    				} else{
	    	    					
	    	    					swal("이런, 찜 취소에 실패했네요");
	    	    					like.style.background = OTHER_COLOR;
	    	    				}
	    	    				
	    	    				
	    	    			},
	    	    			error:function(xhr){
	    	    				
	    	    				console.log(xhr);
	    	    			}
	    	    			
	    	    		}		
	    	    	);

	    	}
	    	
  	
	    }	    
	    
	    //////////////////////////////////////////////////////
	    
	    //연락하기 번호 띄워주기
	    function contact(){
	    	
	    	swal("m_phone을 가져와야하는데 numberformatException...ㅠㅠ");
	    	
	    }
	    //////////////////////////////////////////////////////
	    
	   
	    
	    //비동기 상점문의(댓글) 목록 가져오기
	    function getReplyList(){
	    	
	    	console.log("상점문의를 가져옵니다");
	    	
	    	$.ajax(
	    		{
	    			
	    			url:"getreplylistok.ajax",
	    			dataType:"json",
	    			data:{ currentstore:${jsonobj.storename} },
	    			success:function(responsedata){
	    				
	    				console.log("목록 부르기 성공");
	    				console.log(responsedata);
	    			},
	    			error:function(xhr){
	    				
	    				console.log(xhr);
	    				
	    			}
	    			
	    		}		
	    	);
	    }
	    
	    //비동기 상점문의(댓글) 달기
	    function writeReply(){
	    	
	    	console.log("상점문의를 남깁니다");
	    	getReplyList();
	    }
	    
	    //비동기 상점문의(댓글) 삭제
	    function deleteReply(){
	    	
	    	console.log("상점문의를 삭제합니다");
	    	getReplyList();
	    }
	    
    
    </script>
</body>

</html>