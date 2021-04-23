<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="zxx">

<!-- 상품 문의 목록 -->
<c:set var="replylist" value="${requestScope.replylist}" />

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
                                                <p id="replytitle">상품문의<span></span></p>
                                                

											          <textarea placeholder="상품문의입력" id="replytext" name="replytext" style="width:100%; height:100px;"></textarea>
											          <input type="button" value="댓글달기" class="replybtn" onclick="reply_check()"> 

                                                <div id="relist">
                                                <c:if test="${not empty replylist}">
                                                
													<c:forEach var="reply" items="${replylist}">
														<table id="reply${reply.rp_num}"><!-- 이거 넘버링 안됨 -->
															<tr >
																<th class="replywriter" id="writer${reply.rp_num}">${reply.storename}</th>
															</tr>
															<tr class="replaycontent">
																
																<td>
																${reply.rp_content}<br>
																</td>
															</tr>
															<tr class="replaybtnarea">
																<td>
														<input type="button" value="댓글달기" class="replybtn" id="re${reply.rp_num}" onclick="rewrite(${reply.rp_num})">
														<input type="button" value="삭제하기" class="replybtn" id="del${reply.rp_num}" onclick="deleteReply(${reply.p_num},${reply.rp_num})">
														<input type="button" value="수정하기" class="replybtn" id="edit${reply.rp_num}" onclick="editReply(${reply.p_num},${reply.rp_num})">
																</td>
															</tr>
														</table>
													</c:forEach>
												</c:if>
                                                </div>	
                                                
                                                </div>
                                            </div>
                                            <div class="col-lg-4" id="shopcontainer">
                                            <!--  
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                                -->
                                                <h5>상점 정보</h5>
                                                <div id="shopinfo">
	                                                <div id="title">
	                                               <!--  ${jsonobj.m_profile}  -->
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
	                                                	
	                                                </div>
	                                                
	                                                </c:forEach>
	                                                
	                                                </c:otherwise>
	                                                </c:choose>
	                                                
	                                                <div id="more">
	                                                	<input type="button" value="더보기" id="moreinfo">
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
        </div>
    </section>
    
 
    
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
  		
    		//카테고리 유지시키기(미완)
    		setCategory();
    		
    		//이 페이지의 상품이 찜한 상품인지 확인
    		checkLike();
    		init();
  		
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
    	
    	
    	
    	//찜한 상품인지 구하기
    	function checkLike(){
    		
    		var currentuser = '<%=(String)session.getAttribute("storename")%>';
    		let check;
    		
    		$.ajax(
    				
    				{
    					
    					url:"cheklike.ajax",
    					dataType:"json",
    					data:{
    						currentuser:currentuser,
    						p_num:${jsonobj.p_num}
    						},
    					success:function(responsedata){
    						console.log(responsedata);
    						
    						check = responsedata;
    						
    						if(check == "true"){
    							console.log("찜한 상품");
    						}else{
    							console.log("찜한 상품이 아님");
    						}
    						
    						init(check, currentuser);
    						
    						
    					},
    					error:function(xhr){
    						console.log(xhr);
    					}
    					
    						
    				}
    				
    				);
    		
    		
    	}
    	
   	
    	//찜 버튼 색깔 바꾸기 위해 선언
	    const like = document.querySelector("#like");	    
	    const BASE_COLOR = "darkgray";
	    const OTHER_COLOR = "#f70000";
	    
	     
	    //색 바뀌는 함수
	    function handClick(){
		
	    	const currentColor = like.style.background;
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
	    	
	    	if(currentuser == "null"){
	    		swal("로그인이 필요합니다");
	    	} else{
	    		
	    		if(currentColor === BASE_COLOR){
		        	
		        	like.style.background = OTHER_COLOR;
		        		        	
		        }else{
		        	
		        	like.style.background = BASE_COLOR;
		        }
		        
		        likeup(currentColor);
	    		
	    	}
	        
    	
	    }
	     
	    //찜버튼 초기화
	    function init(check, currentuser){
	
		    	console.log(check);
		    	
		    	if(check == false){
		    		
		    		like.style.background = BASE_COLOR;
			    	like.addEventListener("click",handClick);
			    	
		    	} else{
		    		like.style.background = OTHER_COLOR;
			    	like.addEventListener("click",handClick);
		    	}
	    	
	    }
	    
	    
	    //찜하는 함수
	    function likeup(currentColor){
	    	
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
	    	
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
	    
	    //댓글 유효성 검사
	    function reply_check() {
			
						if ($("#replytext").val() == "") {
							
							swal("내용을 입력해주세요");
							return false;
							
						}
						
						writeReply();
					
					}	
	   
	    
	    //비동기 상점문의(댓글) 목록 가져오기
	    function getReplyList(){
	    	
	    	console.log("상점문의를 가져옵니다");
	    	
	    	$.ajax(
	    		{	    			
	    			url:"getreplylistok.ajax",
	    			dataType:"json",
	    			data:{ p_number:${jsonobj.p_num} },
	    			success:function(responsedata){
	    				
	    				console.log("목록 부르기 성공");
	    				console.log(responsedata);
	    				
	    				$("#relist").empty();
	    				
	    				$.each(responsedata,function(index,obj){
	    					
	    					$("#relist").append(
	    							"<table id='reply"+obj.rp_num+"'><tr ><th class='replywriter' id='writer"+obj.rp_num+"'>"+obj.storename+"</th></tr>"
									+"<tr class='replaycontent'><td>"+obj.rp_content+"<br></td></tr><tr class='replaybtnarea'><td>"
								+"<input type='button' value='댓글달기' class='replybtn' id='re"+obj.rp_num+"' onclick='rewrite("+obj.rp_num+")'>"
								+"<input type='button' value='삭제하기' class='replybtn' id='del"+obj.rp_num+"'"
								+" onclick='deleteReply("+obj.p_num+","+obj.rp_num+")'><input type='button' value='수정하기' class='replybtn'"
								+" id='edit"+obj.rp_num+"' onclick='editReply("+obj.p_num+","+obj.rp_num+")'></td></tr></table>");
	    					
	    				});
		
	    			},
	    			error:function(xhr){
	    				
	    				console.log(xhr);		
	    			}
	    			
	    		}		
	    	);
	    }
	    
	    //비동기 상점문의(댓글) 달기
	    function writeReply(){
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
	    	
	    	let adddata = {
	    			storename : currentuser,
	    			rp_content : $("#replytext").val(),
	    			p_num : ${jsonobj.p_num}
	    	}
	    	
	    	console.log("등록함수 실행");

	    	$.ajax(
	    		{	
	    			url : "writereplyok.ajax",
	    			data : adddata,
	    			type:"post",
	    			dataType : "text",
	    				success : function(responsedata) {
	    				console.log(responsedata);
	    				
	    				if(responsedata == "true"){
	    					
							swal("댓글 입력 성공");
	    					
	    					$("#replytext").val("");
	    					
	    					console.log("상점문의를 남깁니다");
	    			    	getReplyList();
	    					
	    				} else{
	    					swal("댓글 입력 실패");
	    				}
	    					
	    			},
	    			error:function(xhr){
	    				console.log(xhr);
	    			}
	    			
	    			
	    		}
	    	);
    	
	    }
	    
	    //비동기 상점문의(댓글) 삭제
	    function deleteReply(p_num,rp_num){
	    	
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
   	
	    	console.log("상점문의를 삭제합니다");
	    	
	    	let params = {
	    			storename:currentuser,
	    			p_num:p_num,
	    			rp_num:rp_num
	    	}	
	    	

	    	$.ajax(
	    	 {
	    		url:"deletereplyok.ajax",
	    		data:params,
	    		dataType:"text",
	    		success:function(responsedata){						
	    			
	    			console.log(responsedata);
  			
	    			let check = responsedata.trim();
	    			
	    			 if(check == "true"){
	    				  swal("삭제 성공");
	    				  let el = document.getElementById('reply'+params.rp_num);
	    				  el.remove();
	    			      getReplyList();
	    				   
	    			 }else{
	    				 swal("삭제 실패");
	    			 }					 
	    			 
	    		},
	    		error:function(error){
	    			console.log(error);
	    		}
	    	 }
	      );

	    }
	    
	  //비동기 상점문의(댓글) 수정
	    function editReply(p_num,rp_num){
	    	
	    	var currentuser = '<%=(String)session.getAttribute("storename")%>';
   	
	    	console.log("상점문의를 수정합니다");
	    	
	    	let params = {
	    			storename:currentuser,
	    			rp_content:$("#replaytext").val();
	    			p_num:p_num,
	    			rp_num:rp_num
	    	}	
	    	

	    	$.ajax(
	    	 {
	    		url:"editreplyok.ajax",
	    		data:params,
	    		dataType:"text",
	    		success:function(responsedata){						
	    			
	    			console.log(responsedata);
  			
	    			let check = responsedata.trim();
	    			
	    			 if(check == "true"){
	    				  swal("수정 성공");
	    				  let el = document.getElementById('reply'+params.rp_num);
	    				  el.remove();
	    			      getReplyList();
	    				   
	    			 }else{
	    				 swal("수정 실패");
	    			 }					 
	    			 
	    		},
	    		error:function(error){
	    			console.log(error);
	    		}
	    	 }
	      );

	    }
	    
	    
	    //대댓글
	    function rewrite(rp_num){
	    	
	    	console.log(rp_num);
	    	
	    	console.log("선택이 될까?");
	    	
	    	//댓글달기 버튼이 소속된 댓글을 작성한 상점이름
	    	let store = $("#writer"+rp_num).text();
	    	console.log(store);
	    	
	    	$("#replytext").empty();
	    	$("#replytext").focus();
	    	$("#replytext").val("@"+store);
	    	
	    	
	    }
    
    </script>
</body>

</html>