<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
     
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageSellerConversion.css">
     
    <!-- javaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/myPageJS/myPageSellerConversion.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- alert 메세지 -->
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
    <c:if test="${ not empty successMessage}">

		<c:remove var="successMessage" scope="session"/>
	</c:if>

	<div class="wrap">
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
		    <div id="myPageSellerConversion-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="${ma.changeName}" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.my?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my?userNo=${loginUser.userNo}&cpage=1">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}"> 장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="mypageSellerConversion-info-area">
                    <c:choose>
                        <c:when test="${authority eq 1}">
                            <div id="myPage-category-select-title">
                                <h3>판매자 전환 신청 현황</h3>
                            </div>
                            <div align="center">
                                <p>승인됨</p>
                            </div>
                        </c:when>

                        <c:when test="${authority eq 0 and status eq 'Y'}">
                            <div id="myPage-category-select-title">
                                <h3>판매자 전환 신청 현황</h3>
                            </div>
                            <div align="center">
                                <p>승인 대기중</p>
                                <span style="color: red;">관리자로 인해 신청이 취소될 수 있습니다.</span>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <div id="myPage-category-select-title">
                                <span>판매자 전환 신청</span>
                                <span id="reference-text" style="color: red;">* 모든값은 필수로 입력하셔야 됩니다.</span>
                            </div>
        
                            <form action="sellerConversion.my" method="POST">
                                <div id="mypageSellerConversion-input-area">
                                    <div id="mypageSellerConversion-input">
                                        <input type="hidden" name="userNo" value="${loginUser.userNo}">
        
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>사업자등록번호</b></div>
                                            <div><input type="text" name="businessNo" id="businessNo"></div>
                                            <div><button type="button" id="businessMan-certify" onclick="businessNumber()">사업자 인증</button></div>
                                            <div><span id="check-message"></span></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>대표자 성명</b></div>
                                            <div><input type="text" name="businessName" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>대표자 성명2</b></div>
                                            <div><input type="text" name="subBusinessName" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>개업일자</b></div>
                                            <div><input type="date" name="openBusinessDate" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>상호</b></div>
                                            <div><input type="text" name="storeName" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>법인등록번호</b></div>
                                            <div><input type="text" name="crn" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>주 업태명</b></div>
                                            <div><input type="text" name="mainBusinessName" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>주 종목명</b></div>
                                            <div><input type="text" name="mainItemName" required></div>
                                        </div>
                                        <div class="info-input-area">
                                            <div class="info-input-title"><b>사업장 주소</b></div>
                                            <div><input type="text" name="businessAddress" required></div>
                                        </div>
                                        <div class="info-input-area" id="deposit-account-area">
                                            <div class="info-input-title" ><b>정산대금 <br> 입금계좌</b></div>
                                            <div>
                                                <!-- <div id="bank-select-area">
                                                    <select name="" id="">
                                                        <option value="">국민</option>
                                                        <option value="">신한</option>
                                                        <option value="">농협</option>
                                                        <option value="">기업</option>
                                                    </select>
                                                </div> -->
                                                <div>
                                                    <!-- <input type="text" name="" placeholder="예금주명"> -->
                                                    <input type="text" name="businessAccount" placeholder="계좌번호(-없이 입력)" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="btn-area">
                                    <button type="reset">초기화</button>
                                    <button type="submit">신청하기</button>
                                </div>                             
                            </form>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>


</body>
</html>