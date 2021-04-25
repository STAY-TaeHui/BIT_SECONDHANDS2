<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manageshop.css" type="text/css">
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
                                    <th>사진</th>
                                    <th>상품명 / 판매상점이름</th>
                                    <th>가격</th>
                                    <th>구매날짜</th>
                                    <th><span>&nbsp;&nbsp;Review&nbsp;&nbsp;</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- [이미지], [상품 제목], [가격], [판매자], [날짜], 후기버튼 -->
                                <tr>
                                    <td class="b_img"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p_price">10000원</td>
                                    <td class="date">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
                                <tr>
                                    <td class="cart-pic"><img src="img/cart-page/product-1.jpg" alt=""></td>
                                    <td class="cart-title">
                                        <h5 >지금까지 이런적은 없었다 이게 상품이냐 걸레냐 </h5>
                                        <h5 class="storename">태희상점</h5>
                                    </td>
                                    <td class="p-price">10000원</td>
                                    <td class="total-price">2021-04-25</td>
                                    <td ><button class='reviewbtn' onclick="location.href='#'">후기작성</button></td>
                                </tr>
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
		</div>
	</div>
    
   
</body>

</html>