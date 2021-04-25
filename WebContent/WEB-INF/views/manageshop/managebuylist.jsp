<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/manageshop.css" type="text/css">

</head>
<body>
	<div id="fullwrap">
	 <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	  <div id="manageshop_menu">
   		<ul id="ms_menu">
	      <li class="deco">상품등록</li>
	      <li class="deco"><span id="currentpage">상품관리</span></li>
	      <li class="deco">구매내역</li>
	      <li >판매내역</li>
	   </ul>
	   </div>
       <!--  탭 부트스트랩  -->
    <script type='text/javascript'src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<div id="bodywrap">
		 <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cart-table">
                        <table id=buylist>
                            <thead>
                                <tr>
                                	<th>&nbsp;&nbsp;구매번호&nbsp;&nbsp;</th>
                                    <th>사진</th>
                                    <th>상품명 / 판매상점이름</th>
                                    <th>가격</th>
                                    <th>구매날짜</th>
                                    <th><span>&nbsp;&nbsp;Review&nbsp;&nbsp;</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- [이미지], [상품 제목], [가격], [판매자], [날짜], 후기버튼 -->                         
                                <c:forEach var="item" items="${requestScope.buylist}">
                                	<tr>
                                	<td class="buy_num">
                                    	<c:out value="${item.buy_num}"/>
                                    </td>
                                    <td class="cart-pic" onclick="location.href='${pageContext.request.contextPath}/productdetail.do?p_num=${item.p_num}&storename=${itme.storename_buyer}'">
                                    	<img src="${pageContext.request.contextPath}/img/store/${item.pimg_name}">
                                    </td>
                                    <td class="cart-title" onclick="location.href='${pageContext.request.contextPath}/productdetail.do?p_num=${item.p_num}&storename=${itme.storename_buyer}'">
                                        <h5><c:out value="${item.p_subj}"/></h5>
                                        <h5 class="storename">
                                        	<c:out value="${item.storename_seller}"/>
                                        </h5>
                                    </td>
                                    <td class="p_price">
                                    	<c:out value="${item.p_price}"/>원
                                    </td>
                                    <td class="date">
                                    	<c:out value="${item.buy_date}"/>
                                    </td>
                                    <td >
                                    	<c:forEach var="rvitem" items="${requestScope.reviewlist}">
                                    		<c:choose>
                                    			<c:when test="${rvitem.buy_num eq item.buy_num}">
                                    			
                                    				<button class='reviewbtn' onclick="location.href='${pageContext.request.contextPath}/index.do'">후기작성</button>
                                    			</c:when>
                                    			<c:otherwise>
                                    				<span class='reviewspan'>후기작성 완료</span>
                                    			</c:otherwise>	
                                    		</c:choose>
                                    	</c:forEach>
                                    	<!-- <button class='reviewbtn' onclick="location.href='#'">후기작성</button> -->
                                    </td>
                                	</tr>
                                </c:forEach>
                                
                                <!-- <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-2.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5>American lobster</h5>
                                    </td>
                                    <td class="p-price">$60.00</td>
                                    <td class="qua-col">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="total-price">$60.00</td>
                                    <td class="close-td"><i class="ti-close"></i></td>
                                </tr>
                                -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
		</div>
	</div>
    
   
</body>
<script type="text/javascript">

</script>

</html>
