<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<!-- Slick JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeMain.css">

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>

        <section id="descript-quick">

            <div id="descript">
                <p id="page-title">
                    스토어
                </p>
                <p id="page-descript">
                    사랑하는 반려어를 위해 <br>
                    이건 어떠신가요?
                </p>
            </div>

            <div id="askn-quick-move">
                <div id="ask">
                    <img id="ask-img" src="${pageContext.request.contextPath}/resources/image/octopus-303622_1280.png" alt="">
                    <div id="ask-descript">
                        <span id="ad-span1">문의사항이 있으신가요?</span> <br>
                        <span id="ad-span2">
                            <a href="#">
                                관리자에게 문의해보세요.
                            </a>
                        </span>
                    </div>
                </div>

                <div id="quick-move">
                    <ul>
                        <li class="quick-move-li-title">
                            <p>빠른이동</p>
                        </li>

                        <li class="quick-move-li">
                            <a href="interestProduct.my">관심상품</a>
                        </li>

                        <li class="quick-move-li">
                            <a href="orderHistory.my">주문 내역</a>
                        </li>

                        <li class="quick-move-li">
                            <a href="cart.my">장바구니</a>
                        </li>

                        <li class="quick-move-li">
                            <a href="#">최근검색</a>
                        </li>
                    </ul>
                </div>
            </div>

            
        </section>

       
        <section class="sm-procuct-section" id="recommend-product">
            <div class="sm-procuct-section-title" >
                추천 제품
            </div>

            <div class="carousel">

                <c:forEach var="b" items="${list}">

                    <div class="carousel-item">
                            <div class="product-descript">
                                <p id="product-descript-store-name">
                                    가게명
                                </p>
                                <p id="product-descript-product-name">
                                    제품명
                                </p>
                                <p id="product-descript-product-price">
                                    가격
                                </p>
                                <p id="product-descript-rating-review">
                                    <img style="width: 13px;" src="../../resources/image/star.png">
                                    <span>4.7</span>
                                    <span>리뷰</span>
                                    <span>1400</span>
                                </p>
                                
                            </div>
                            <div class="carousel-dimg">
                                <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                            </div>
                    </div>

                </c:forEach>

            </div>
        </section>

        <section class="sm-procuct-section" id="special-discount">
            <div class="sm-procuct-section-title">
                특별 할인
            </div>

            <div class="carousel">

                <c:forEach var="b" items="${list}">

                    <div class="carousel-item" onclick="location.href='detail.spd?pno=${pd.pdNo}'">
                            <div class="product-descript">
                                <p id="product-descript-store-name">
                                    가게명
                                </p>
                                <p id="product-descript-product-name">
                                    제품명
                                </p>
                                <p id="product-descript-product-price">
                                    가격
                                </p>
                                <p id="product-descript-rating-review">
                                    <img style="width: 13px;" src="../../resources/image/star.png">
                                    <span>4.7</span>
                                    <span>리뷰</span>
                                    <span>1400</span>
                                </p>
                                
                            </div>
                            <div class="carousel-dimg">
                                <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                            </div>
                    </div>

                </c:forEach>

            </div>

           
        </section>

        <section class="sm-procuct-section" id="popular-product">
            <div class="sm-procuct-section-title">
                인기 상품
            </div>

            <div class="carousel">

                <c:forEach var="b" items="${list}">

                    <div class="carousel-item">
                            <div class="product-descript">
                                <p id="product-descript-store-name">
                                    가게명
                                </p>
                                <p id="product-descript-product-name">
                                    제품명
                                </p>
                                <p id="product-descript-product-price">
                                    가격
                                </p>
                                <p id="product-descript-rating-review">
                                    <img style="width: 13px;" src="../../resources/image/star.png">
                                    <span>4.7</span>
                                    <span>리뷰</span>
                                    <span>1400</span>
                                </p>
                                
                            </div>
                            <div class="carousel-dimg">
                                <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                            </div>
                    </div>

                </c:forEach>

            </div>

            
        </section>

        <section class="sm-procuct-section" id="brand-new">
            <div class="sm-procuct-section-title">
                최신 제품
            </div>

            <div class="carousel">

                <c:forEach var="spd" items="${list}">

                    <div class="carousel-item" onclick="location.href='detail.spd?pno=${spd.pdNo}'">
                            <div class="product-descript">
                                <a href="storeMain.ma">
                                    <p id="product-descript-store-name">
                                        ${spd.storeName}
                                    </p>
                                </a>
                                <p id="product-descript-product-name">
                                    ${spd.pdTitle}
                                </p>
                                <p id="product-descript-product-price">
                                    ${spd.pdPrice}
                                </p>
                                <p id="product-descript-rating-review">
                                    <img style="width: 13px;" src="../../resources/image/star.png">
                                    <span>4.7</span>
                                    <span>리뷰</span>
                                    <span>1400</span>
                                </p>
                                
                            </div>
                            <div class="carousel-dimg">
                                <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                            </div>
                    </div>

                </c:forEach>

            </div>
        </section>

    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
<!-- Slick carousel initialization -->
<script>
    $(document).ready(function(){
        $('.carousel').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: false,
            arrows: true,
            dots: true
        });

    });

</script>

</body>
</html>
