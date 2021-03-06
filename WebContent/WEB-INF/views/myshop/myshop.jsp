<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String currentStorename = (String) session.getAttribute("storename");
String storename = (String) request.getAttribute("storename");
String profile = (String) request.getAttribute("profile");
String realPath = application.getRealPath("fileUpload");

if (profile == null) {
	profile = "default.png";
}

System.out.println("-------------------------------");
System.out.println("(Session)storename : " + currentStorename);
System.out.println("storename : " + storename);
System.out.println("profile : " + profile);
System.out.println("realPath : " + realPath);
System.out.println("-------------------------------");
%>
<!DOCTYPE html>
<html>
<head>
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

.tab-content>.tab-pane {
	display: none;
}

.tab-content>.active {
	display: block;
}

.countp {
	margin-bottom: 0;
}
</style>
<meta charset="UTF-8">

<title>Insert title here</title> 
 <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css' rel='stylesheet'>
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
     <link rel="stylesheet" href="css/reviews.css" type="text/css">
     
     

    


<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
</head>
<body>

   <div id="fullwrap" >
   <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
       <!--  ??? ???????????????  -->
   <script type='text/javascript'src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
       <!-- summernote js -->
   <script src="${pageContext.request.contextPath}/js/summernote/summernote-lite.js"></script>
   <script src="${pageContext.request.contextPath}/js/summernote/lang/summernote-ko-KR.js"></script>
	
<div id="bodywrap">
<div id="productdetailName">
				<h4>????????????</h4>
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
								type="hidden"> <input name="originalPath"
								value="<%=profile%>" type="hidden">
								<div id="shopbtn">
							<c:choose>
								<c:when test="${sessionScope.storename eq storename}">
									<input id="leftbtn" type="button" value="???????????? ??????"
										onclick="location.href='manageshop.manage?storename=${sessionScope.storename}'">
									<input type="button" value="????????????" id="editBtn" name="">
								</c:when>
								<c:otherwise>
									<input type="button" value="???????????? ??????"
										onclick="location.href='manageshop.manage?storename=${sessionScope.storename}'">
								</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					<div id="Storename">
						<%
						out.print("" + storename + "<br>");
						%>
					</div>
					<br>
				</div>
			</form>


   
<div style='width:100%;margin:0 auto;margin-top:100px;'>
   <ul class="nav nav-tabs">
      <li class='active'><a href="#tabmenu_01" onclick="productlist()" data-toggle="tab"> ??? ??? </a></li>
      <li><a href="#tabmenu_02" onclick="likelist()" data-toggle="tab"> ??? </a></li>
      <li><a href="#tabmenu_03" onclick="reviewlist()" data-toggle="tab"> ?????? ?????? </a></li>
   </ul>
   <div class="tab-content" >
      <div class="tab-pane fade in active" id="tabmenu_01">
         <!-- ?????? ????????? ??????????????? -->
         <div class="counttext">
         <p class=countp>
         ??????  <span class="productcount"></span> ???
         </p>
         </div>
         <ul class="myproductlist"></ul>
      </div>
      <div class="tab-pane fade" id="tabmenu_02">
         <!-- ??? ????????? ??????????????? -->
         <div class="counttext">
         <p class=countp>
         ???  <span class="likecount"></span> ???
         </p>
         </div>
         <ul class="myproductlist"></ul>
      </div>
      <div class="tab-pane fade" id="tabmenu_03">
         <!-- ??? ????????? ??????????????? -->
         <div class="counttext">
         <p class=countp>
         ????????????  <span class="reviewcount"></span> ???
         </p>
         </div>
         <!-- //////////////// REVIEW CARD START////////////////// -->
         <!-- ????????? -->
         <div class="modal fade" role="dialog" id="imgmodal">
                     <div class="modal-dialog">
                    <div class="modal-content"></div>          
                       <img class="img-responsive" src="" id="show-img">         
                    </div>
                </div>
         <ul class="myreviewlist">
         
         </ul>
            <!-- //////////////// REVIEW CARD EMD////////////////// -->
         <!-- <ul class="productlist"></ul> -->
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
   $(function() {    //?????? ??? ?????? ??????
      console.log("WHO IS FIRST");
       
      
      $.ajax(
            {   
               url:"MyShopProductList.ajax",
               data:{storename : '${requestScope.storename}'},
               type:"get",
               dataType:"json",
               success:function(responsedata){
                  console.log("???????????? ????????? ???");               
                  $.each(responsedata, function(index, obj){
                        console.log(obj)
                        $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                               +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                     "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                     "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                  });
                  let count = responsedata.length
                  console.log(count);
                  $('.productcount').html(count);
                  
                                        
               },
               error:function(xhr){
                  console.log(xhr);
               }
            }
            
            
         );
      
      /* summernote initialize */
      $('#summernote').summernote({
		  height: 300,                 // ????????? ??????
		  minHeight: null,             // ?????? ??????
		  maxHeight: null,             // ?????? ??????
		  focus: true,                  // ????????? ????????? ???????????? ????????? ??????
		  lang: "ko-KR",					// ?????? ??????
		  placeholder: '?????? 2048????????? ??? ??? ????????????',	//placeholder ??????
		  callbacks: { // ????????? ??????
              // ???????????? ???????????? ?????? ???????????? ??????
			    onImageUpload: function(files, editor, welEditable) {
				    sendFile(files[0], this);
				}
          }
        	 
	
	});
      
     
   });
   
   
    function productlist(){
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = "${requestScope.storename}";
       let reqscopestorename = '${requestScope.storename}';
       
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
       console.log("reqscopestorename : " + reqscopestorename);
        $.ajax(
              {   
                 url:"MyShopProductList.ajax",
                 data:{storename : '${requestScope.storename}'},
                 type:"get",
                 dataType:"json",
                 success:function(responsedata){
                    console.log("?????? ????????????");
                    $('.myproductlist').empty();
                     $.each(responsedata, function(index, obj){
                        
                        $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                               +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                     "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                     "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                   });
                     let count = responsedata.length
                     console.log(count);
                     $('.productcount').html(count);
                                          
                 },
              
           
                 error:function(xhr){
                    console.log(xhr);
                 }
              }
              
              
           );
     }
    function likelist(){
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = '${requestScope.storename}';
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
           $.ajax(
                 {   
                    url:"MyShopLikeList.ajax",
                    data:{storename : '${requestScope.storename}'},
                    type:"get",
                    dataType:"json",
                    success:function(responsedata){
                       console.log("MyLikeList ????????????");
                       $('.myproductlist').empty();
                        $.each(responsedata, function(index, obj){
                           
                           $(".myproductlist").append("<li><a href='productdetail.do?p_num="+obj.p_num+"&storename="+obj.storename+"'><div class='thumnail'>"
                                  +"<img src='${pageContext.request.contextPath}/fileUpload/"+obj.pimg_name+"'>"+
                                        "</div><div class=title>"+obj.p_subj+"</div><div class='imginfo'><p calss='price'>"+obj.p_price+"</p>"+
                                        "<p class='wrtime'>"+obj.p_wr_time+"</p></div></a></li>");
                      });
                        let count = responsedata.length
                        console.log(count);
                        $('.likecount').html(count);
                                             
                    },
                 
              
                    error:function(xhr){
                       console.log(xhr);
                    }
                 }
                 
                 
              );
        }
     function reviewlist(){
       //[rv_num], [p_num], [p_sugj], [writer], [m_profile], [rv_star], [rv_content], [rimg_name][rv_date] 
       
       let sessionstorename = '${sessionScope.storename}';
       let reqstorename = '${requestScope.storename}';
       console.log("sessionstorename : " + sessionstorename);
       console.log("reqstorename : " + reqstorename);
           $.ajax(
                 {   
                    url:"MyShopReviewList.ajax",
                    data:{storename : reqstorename},
                    type:"get",
                    dataType:"json",
                    async:false,
                    success:function(responsedata){
                       console.log("MyShopReviewList");
                       $('.productlist').empty();
                       
                      
                       
                        $.each(responsedata, function(index, obj){
                        	console.log("INDEX : " + index)
                           let starstring="";
                           let display="none";
                           for(let i=2; i<=5; i++){
                              if(obj.rv_star>=i){
                                 starstring+="<span class='fa fa-star star-active'></span>";
                              }
                              else{
                                 starstring+="<span class='fa fa-star star-inactive'></span>";
                              }
                           }

                           if(sessionstorename === obj.writer){
                        	   display="";

                           }
                           
                           $(".myreviewlist").append(
                                 "<li>"
                                 +"<div class='rv_card'>"
                                 +"<div class='row d-flex'>"
                                 +"<div class=''>"
                                 +"<img class='profile-pic' src='${pageContext.request.contextPath}/fileUpload/"+obj.m_profile+"'>"
                                 +"</div>"
                                 +"<div class='d-flex flex-column'>"
                                 +"<h3 id='subj' class='mt-2 mb-0' >"+obj.writer+"</h3>"
                                 +"<div id='star_link'>"
                                 +"<p id='star' class='text-left'>"
                                 +"<span class='fa fa-star star-active ml-3' style='margin-left:0!important;'></span>"
                                 +starstring
                                 +"</p>"
                                 +"<button id='link' onclick='location.href=\"productdetail.do?p_num="+obj.p_num+"&storename="+obj.seller+"\"'>???? "+obj.p_subj+"</button>"
                                 +"</div>"
                                 +"</div>"
                                 +"<div class='ml-auto'>"
                                 +"<p class='text-muted pt-5 pt-sm-3'>"+obj.rv_date+"</p>"
                                 +"</div>"
                                 +"</div>"

                                 +"<div class='row text-left' id=summernote>"
                                 +obj.rv_content
                                
                                 +"</div>"
                                 +"<div class='row text-left mt-4'>"
                                 +"<div class='like mr-3 vote' style='display:"+display+";'>"
                                 +"<span id='trashicon'>????</span><span id='"+obj.rv_num+"' name='delete'>????????????</span>"
                                 +"</div>"
                                 +"</div>"
                                 +"</div>"
                                 +"</li>"
                              ); 
                           $('img').click(function(){
                                  console.log("img function");
                                  var img=$(this).attr('src');
                                    $("#show-img").attr('src',img);
                                    $("#imgmodal").modal('show');
                               });
                           $('span[name=delete]').click(function(){
                              console.log("DELETE CLICK??????????????????");
                              console.log($(this).attr('id'));
                               $.ajax(
                                       {   
                                          url:"MyShopReviewDelete.ajax",
                                          data:{rv_num : $(this).attr('id')},
                                          type:"post",
                                          async:false,
                                          dataType:"text",
                                          success:function(responsedata){
                                             console.log("??????????????? ??????");
                                             if(responsedata>0){
                                                console.log("DELTE ??????");
                                             }
                                             else{
                                                console.log("DELTE ??????");
                                             }
                                          },
                                          error:function(){
                                             console.log("????????? ?????? ??????");
                                          }
                                       }); 
                              
                           })
                      });
                        let count = responsedata.length
                        console.log(count);
                        $('.reviewcount').html(count);
                        
                                             
                    },
                 
              
                    error:function(xhr){
                       console.log(xhr);
                    }
                 }
                 
                 
              );
       
        }

     /* summernote  */
     function sendFile(file, editor) {
    	    // ?????? ????????? ?????? ?????????
    			data = new FormData();
    		    data.append("uploadFile", file);
    		    $.ajax({ // ajax??? ?????? ?????? ????????? ??????
    		        data : data,
    		        type : "POST",
    		        url : "imgupload.manage",
    		        cache : false,
    		        contentType : false,
    		        processData : false,
    		        success : function(data) { // ????????? ????????? ??????
    	            // ???????????? ????????? ??????
    	            	console.log("????????? ????????????");
    		        	$(editor).summernote('editor.insertImage', data.url);
    		        	$('#rimg_name').val(data.rimg_name);
    		        	$('#rimg_size').val(data.rimg_size);
    		        	
    		        }
    		    });
    		}

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
			if ($('#file').val() == '') {
				swal({
					title : "????????? ????????? ???????????????",
					icon : "error"
				});
				return;
			}

			$('#submit').submit();
		});
</script>


</html>