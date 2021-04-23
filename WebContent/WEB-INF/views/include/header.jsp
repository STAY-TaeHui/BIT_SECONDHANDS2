<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
        <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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

    <!--j쿼리 cdn-->
    <script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Header Section Begin -->
<script type="text/javascript">
console.log("현재 세션은 : " + '${sessionScope.storename}');
console.log("현재 상태는 : " + '${!sessionScope.isLogined}');

</script>


    <header class="header-section">
        <div class="container">

            <div class="inner-header">
            <div id="rightmenu">
            <ul id="loginmenu">
            	<c:choose>
            	<c:when test="${!sessionScope.isLogined}">
            	<li><a href="login.do">로그인</a></li>
            	</c:when>
            	<c:otherwise>
            	<li><a href="logoutok.do">로그아웃</a></li>
            	</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            	<c:when test="${!sessionScope.isLogined}">
            	<li><a href="register.do">회원가입</a></li>
				</c:when>
				<c:otherwise>
				<li style="display:none;"><a href="register.do">회원가입</a></li>
				</c:otherwise>
				</c:choose>
            </ul>
            </div>
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                       
                        <div class="advanced-search">

                        <form method="post" action="searchproductok.do">
                            <div class="input-group" id="header_search">                         
                                <input type="text" id="keyword" name="keyword" onkeyup="if(window.event.keyCode==13)this.submit()}">
                                <button type="submit"><i class="ti-search"></i></button>
                            </div>
                        </form>

                        <!-- advanced-search end 헤더 검색창-->
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                    <!--  -->
                        <ul class="nav-right">
                            <li class="heart-icon">
                                <c:choose>
                            <c:when test="${!sessionScope.isLogined}">
                            	<a href="login.do">
                                    <img src="img/sell.gif">
                                </a>
                              </c:when>
                             <c:otherwise>
	                             <a href="#?storename=${sessionScope.storename}">
	                             <img src="img/sell.gif">
                                </a>
                             </c:otherwise>
                             </c:choose>
                            </li>
                            
                            <li class="cart-icon">
                            <c:choose>
                            <c:when test="${!sessionScope.isLogined}">
                            <a href="login.do">
                                    <img src="img/myshop.gif">
							</a>
                             </c:when>
                             <c:otherwise>
                             <a href="myshop?storename=${sessionScope.storename}">
                                    <img src="img/myshop.gif">
                                </a>
                             </c:otherwise>
                             </c:choose>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </div>
 
       </div>
    </header>
    <!-- Header End -->
