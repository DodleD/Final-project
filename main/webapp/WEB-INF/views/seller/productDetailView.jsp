<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/productDetailView.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/67d7db2dea.js" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/storeJS/productDetailView.js"></script>
    
</head>
<body>

<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>
    
    <main>
        
        <div id="store-name-container">
            <div id="store-name">
                <h1>수조의 달인</h1>
            </div>
            <button type="button" class="btn btn-danger">상품신고</button>
        </div>

        <!-- 상품 구매 -->
        <section class="product-info">
            <input type="hidden" name="pno" value="">

            <div class="product-img-container">
                <img class="product-img" src="" alt="">
            </div>

            <div class="product-information">
                <div class="product-name-area">
                    <span class="product-name">상품명</span>
                    <span class="dibs">
                        <i class="fa-regular fa-heart"></i>
                    </span>
                </div>
                <div class="product-grade-area">
                    <div>
                        <span class="product-grade">평점</span><span>4.7</span>
                    </div>
                    <div>
                        <span class="product-review-quantity">리뷰</span><span class="review-quantity">100개</span>
                    </div>
                </div>
              
                <div class="product-price-area">
                    <div>
                        <span class="product-price">10000원</span>
                    </div>
                </div>
                <!-- <div class="product-etc">
                    <span>배송</span>
                </div> -->
                <div class="top-product-buy-area">
                    <div class="product-buy-info">
                        <div><span>상품 선택</span></div>
                        <div id="product-opt-form-wrapper">
                            <form action="" id="product-opt-form" method="post">
                                <div class="product-opts">
                                    <div class="product-opt-select">
                                        <div><span>상품을 선택해주세요</span></div>
                                        <ul class="product-opts-list">

                                        </ul>
                                    </div>
                                </div>
                                <div id="product-quantity-area">
                                </div>
                                <div id="price-area">
                                    <div >주문금액</div>
                                    <div >
                                        <span class="product-price"></span>원
                                    </div>
                                </div>
                                <div id="product-price-btn-wrapper">
                                    <div class="product-buy-btn-container">
                                        <button type="button" class="cart-btn" id="product-cart-btn">장바구니</button>
                                        <button type="button" class="buy-btn" id="product-buy-btn" >바로구매</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 상품 디테일 네비 -->
         <div class="sticky-container" id="sticky-container" style="position: sticky; top: 85px; transition: top 0.1s ease 0s;">
                <nav class="navbar navbar-expand-sm bg-light justify-content-center">
                    <ul class="navbar-nav">
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-detail" aria-label="상품정보로 이동">상품정보</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-review" aria-label="리뷰로 이동">리뷰</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-inquiry" aria-label="문의로 이동">문의</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-seller-info" aria-label="판매자 정보로 이동">판매자 정보</a>
                      </li>
                    </ul>
                </nav>
        </div>

        <div class="about-product-container">
            <div class="about-product">

                <div class="go" id="go-product-detail"></div>

                <!-- 상품 정보-->
                 <div>
                    <section class="product-detail" id="product-detail">
                        <div id="area-left">
                            <h1>
                                상품정보
                            </h1>
                            <div id="product-description-area">

                            </div>

                        </div>

                        <div id="area-right">
                        </div>
                    </section>
                </div>   
                
                <div class="go" id="go-product-review"></div>

                <!-- 리뷰 -->
                <div >     
                    <section class="product-review" id="product-review">
                        <div class="product-review-area">
                            <div class="review-top">
                                <h1 class="description-title">
                                    리뷰
                                </h1>
                                <button id="review-btn" class="btn btn-primary" data-toggle="modal" data-target="#review-Modal">
                                    리뷰쓰기
                                </button>
                            </div>

                            <div>
                            <!-- 반복 구문 시작 -->
                                <table>
                                    <tr>
                                        <td>
                                            <img src="" alt="">
                                        </td>
                                        <td>
                                            이름
                                        </td>
                                        <td>
                                            별점
                                        </td>
                                        <td>
                                            날짜
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            상품명
                                        </td>
                                        <td>
                                            옵션명
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="" alt="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            리뷰 내용
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                        </div>

                        <!-- 페이징 처리 들어오는 곳-->
                        <div id="pagination-div">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                    </c:otherwise>
                            </c:choose>

                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="?cpage=${p}">${p}</a></li>
                        </c:forEach>
                            
                        <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            </ul>
                        </div>
                    </section>
                </div>    

                <!-- 리뷰 modal -->
                <div class="modal fade" id="review-Modal">
                    <div class="modal-dialog">
                        <div class="modal-content" >

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 >리뷰쓰기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" >
                                <form id="modal-qna-content" action="" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="writerNo" value=>
                                    <input type="hidden" name="refProductNo" value=>
                                    <div id="product-name-container">
                                        <div id="qna-product-name-header">
                                            상품명
                                        </div>
                                        <select name="refPdoptNo" id="qna-product-name">
                                        </select>
                                    </div>
                                    <div id="product-pic-container">
                                        <div >
                                            사진 첨부(선택)
                                        </div>
                                        <div >
                                            사진을 첨부해주세요.(최대 1장)
                                        </div>
                                        <div id="qna-pic-container">

                                        </div>
                                        <div id="add-qna-product-pic">
                                        
                                            <span >사진 첨부하기</span>
                                            <input type="file" name="qnaPhotoUpfile" id="file-input" accept="image/*">

                                        </div>
                                    </div>

                                    <div id="product-qna-content-container">
                                        <div >
                                            리뷰작성
                                            <div>필수 입력 항목입니다.</div>
                                        </div>
                                        <div id="product-qna-content-textarea">
                                            <textarea name="qnaContent" id="product-qna-content"
                                                placeholder="자세하고 솔직한 리뷰는 다른 고객과 스토어에게 큰 도움이 됩니다."></textarea>
                                        </div>
                                    </div>

                                    <div id="product-qna-enroll-btn-container">
                                        <button type="submit" id="product-qna-enroll-btn">완료</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="go" id="go-product-inquiry"></div>

                <!-- 문의 -->
                <div >     
                    <section class="product-inquiry" id="product-inquiry">
                        <div class="product-inquiry-area">
                            <div class="inquiry-top">
                                <h1 class="description-title">
                                    문의
                                </h1>
                                <button id="inquiry-btn" class="btn btn-primary" data-toggle="modal" data-target="#inquiry-Modal">
                                    문의하기
                                </button>
                            </div>

                            <div>
                                <!--  반복문 시작 -->
                                <table>
                                    <tr>
                                        <td>
                                            문의자명
                                        </td>
                                        <td>
                                            문의날짜
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            문의 내용
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            문의 답변
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <!-- 페이징 처리 들어오는 곳-->
                            <div id="pagination-div">
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${ pi.currentPage eq 1 }">
                                            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                        </c:otherwise>
                                </c:choose>

                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="?cpage=${p}">${p}</a></li>
                            </c:forEach>
                                
                            <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                                </ul>
                            </div>
                        </div>
                    </section>
                </div>    


                <!-- 문의 modal -->
                <div class="modal fade" id="inquiry-Modal">
                    <div class="modal-dialog">
                        <div class="modal-content" >

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 >문의하기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" >
                                <form id="modal-qna-content" action="" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="writerNo" value=>
                                    <input type="hidden" name="refProductNo" value=>
                                    <div id="product-name-container">
                                        <div id="qna-product-name-header">
                                            상품명
                                        </div>
                                        <select name="refPdoptNo" id="qna-product-name">
                                        </select>
                                    </div>

                                    <div id="product-qna-content-container">
                                        <div >
                                            문의내용
                                        </div>
                                        <div id="product-qna-content-textarea">
                                            <textarea name="qnaContent" id="product-qna-content"
                                                placeholder="문의 내용을 입력하세요."></textarea>
                                        </div>
                                    </div>

                                    <div id="product-qna-enroll-btn-container">
                                        <button type="submit" id="product-qna-enroll-btn">완료</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="go" id="go-seller-info"></div>

                <div id="seller-info-container" >
                    <section class="seller-info" id="seller-info">
                        <h1>판매자 정보</h1>

                        <div>
                            <table>
                                <tr>
                                    <th>
                                        상호
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        대표자
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        사업장 소재지
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        전화번호
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        E-mail
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        사업자 번호
                                    </th>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                        </div>

                    </section>
                </div>

            </div>

            <div class="bottom-product-buy-area">

            </div>

        </div>
        
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
