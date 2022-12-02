<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Collabee</title>
    <%@ include file = "../common/bootstrap.jspf" %>

    <style>
    
        /* 캐러셀 부분*/
        .carousel-item-box {
            margin: 0px;
        }

        .top-img-carousel img {
            width: 100%;
        }
        
        .icon-cart-box-box {
            height: 0px;
        }

        .card .icon-cart-box i {
            color: white;
        }

        .prev-item-btn {
            background-color: white; 
            position: relative; left:-15px; bottom: 400px; 
            width: 50px; height: 50px; 
            border:none; border-radius: 50%;
        }
        .next-item-btn {
            background-color: white; 
            position: relative; left:1130px; bottom: 400px; 
            width: 50px; height: 50px; 
            border:none; border-radius: 50%;
        }

        .prev-item-btn i, .next-item-btn i {
            font-size: 24px;
        } 




		/* 아이템 박스 부분 */

        .item-container{
        display: flex;
        justify-content: space-between;
        }

        .item-container .item-box{
            width: 280px;
            height: 600px;
        }

        .item-container img {
            height: 380px;
        }

        .carousel-inner .card {
            border: none;
        }

        .item-container .card .card-body {
            padding: 20px 0px;
        }

        .item-container .card p {
            margin-bottom: 10px;
        }


        .carousel-item-box button, .carousel-item-box div[data-toggle] {
            z-index: 2;
        }

        
        
    </style>

    <script>
    
    	console.log("아아아변경2 ${pageContext.request.contextPath }");
    	
        let sum = 0;
        let insum = 0;
        $(function(){
            var tott = $("#total").val();

            $(".opt").change(function(){
                insum = 0;
                $(".opt:checked").each(function(){
                    insum += Number($(this).val());
                    console.log($(this).val());
                });
                sum = Number(tott) + insum;
                $("#total").val(sum);
            });
        });



       /*  $(function(){
            $(".category-list").mouseleave(function(){
                console.log("벗어남~");
                console.log(this);
                $("#sub-category").css("display", "none");
            });
            $(".category-list").mouseover(function(){
                console.log("올려짐~");
                console.log(this);
                $("#sub-category").css("display", "block");
            });
        }); */
        
        
        
    </script>
</head>
<body style="width:1800px; margin: auto; margin-top: 50px;">

	<!-- 모달 -->
	<!-- 쇼핑카트 모달 -->
    <%@ include file = "../common/modal/addShoppingCartModal.jspf" %>
    

    <!-- header -->
    <header>
	    <%@ include file = "../common/header.jspf" %>
	</header>
	
    <section id="main-section">

	<section>
	    <div class="row">    
	    
	    <!-- 상단 캐러셀 이미지 -->
	        <div class="col-sm-12">
	            <div id="top-img-carousel" class="carousel slide" data-ride="carousel">
	
	                <!-- Indicators -->
	                <ul class="carousel-indicators" style="z-index: 1;">
	                    <li data-target="#demo" data-slide-to="0" class="active"></li>
	                    <li data-target="#demo" data-slide-to="1"></li>
	                    <li data-target="#demo" data-slide-to="2"></li>
	                    <li data-target="#demo" data-slide-to="3"></li>
	                    <li data-target="#demo" data-slide-to="4"></li>
	                </ul>
	
	                <div class="carousel-inner">
	                    <div class="carousel-item active">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_001.avif" alt="국물요리백서">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_002.avif" alt="얼리크리스마스">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_003.avif" alt="금주의 과일가게">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_004.avif" alt="다채로운 돼지고기">
	                    </div>
	                    <div class="carousel-item">
	                        <img src="${pageContext.request.contextPath}/resources/imgs/carousel/main_title_005.avif" alt="New York">
	                    </div>
	                </div>
	                
	                <a class="carousel-control-prev" href="#top-img-carousel" data-slide="prev">
	                    <span class="carousel-control-prev-icon"></span>
	                </a>
	                <a class="carousel-control-next" href="#top-img-carousel" data-slide="next">
	                    <span class="carousel-control-next-icon"></span>
	                </a>
	            </div>
	        </div>
	    </div>
	
	
	
	    <div class="row">
	        <div class="col-sm-2"></div>
	        <div class="col-sm-8" style="padding: 0px;">
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> 이 상품 어때요? </h4>
	            </div>
	            
	            
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section1" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <div class="carousel-item active">
	                        
	                        <c:forEach var="item" items="${howAboutItemList }" >
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/items/vegetable/collections_item_1.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                        </c:forEach>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/items/vegetable/collections_item_1.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/items/vegetable/collections_item_1.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/items/vegetable/collections_item_1.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="${pageContext.request.contextPath}/resources/imgs/items/vegetable/collections_item_1.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <button class="prev-item-btn" href="#section1" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section1" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
	                </div>
	            </div>
	
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> 냉장고 속 단골 재료! </h4>
	                <h6>어느 요리에나 잘 쓰이는 기본 재료 모음</h6>
	            </div>
	
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section2" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <div class="carousel-item active">
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <button class="prev-item-btn" href="#section2" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section2" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
	                </div>
	            </div>
	            <div style="text-align:center;margin:80px 0px 30px 0px;">
	                <h4 style="font-weight:600;"> 콜라비 추천 상품! </h4>
	                <h6>에디터가 강추합니다~</h6>
	            </div>
	
	            <div class="carousel-item-box" style="padding: 0px; width: 100%;">
	                <div id="section3" class="carousel slide w-100" data-ride="carousel" data-interval="false">
	                    <div class="carousel-inner w-100" role="listbox">
	                        <div class="carousel-item active">
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="carousel-item">
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                    <div class="card">
	                                        <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                        <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                            <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                                <i class="fa-solid fa-cart-shopping"></i>
	                                            </div>
	                                        </div>
	                                        <div class="card-body">
	                                            <p class="card-text --font-large">해남호박고구마</p>
	                                            <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                            <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                            <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                            <a href="#" class="stretched-link"></a>
	                                        </div>
	                                    </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-3 float-left item-box">
	                                <div class="card">
	                                    <img class="card-img-top" src="resources/imgs/채소/해남호박고구마.avif" alt="Card image">
	                                    <div class="icon-cart-box-box" style="position:relative; height:0px;">
	                                        <div type="button" data-toggle="modal" data-target="#cart-modal"class="btn btn-primary icon-cart-box">
	                                            <i class="fa-solid fa-cart-shopping"></i>
	                                        </div>
	                                    </div>
	                                    <div class="card-body">
	                                        <p class="card-text --font-large">해남호박고구마</p>
	                                        <p><span class="--color-red --font-large">10%</span><span class="--font-large --strong" style="margin-left:10px;">4,950원</span></p>
	                                        <p class="--font-mid --color-gray --line-mid">5,500원</p>
	                                        <p class="--font-small --color-gray --strong">고소함 가득. 매력적인 풍미</p>
	                                        <a href="#" class="stretched-link"></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <button class="prev-item-btn" href="#section3" role="button" data-slide="prev">
	                        <i class="fa-solid fa-chevron-left"></i>
	                    </button>
	                    <button class="next-item-btn" href="#section3" role="button" data-slide="next">
	                        <i class="fa-solid fa-chevron-right"></i>
	                    </button>
	                </div>
	            </div>
	
	        </div>
	        <div class="col-sm-2"></div>
	    </div>
	
	</section>
    </section>


    <!-- footer -->
    <footer>
		<%@ include file = "../common/footer.jspf" %>	
	</footer>



</body>
</html>