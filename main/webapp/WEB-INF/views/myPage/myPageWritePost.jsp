<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 글</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageWritePost.css">

	
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPageWritePost-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.me?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my?userNo=${loginUser.userNo}">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}">주문내역</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="writePost.my?userNo=${loginUser.userNo}">작성한 글 </a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageWritePost-info-area">
                    <div id="myPageWritePost-status-area">
                        <div id="ps1" class="myPageWritePost-status">
                            <b>일반 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[0]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[0]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div id="ps2" class="myPageWritePost-status">
                            <b>꿀팁 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[1]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[1]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div id="ps3" class="myPageWritePost-status">
                            <b>질문 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[2]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[2]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="myPageWritePost-status">
                            <b>중고거래 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[3]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[3]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div id="myPageWritePost-list-area">
                        <table>
                            <thead>
                                <th width="10%">글 종류</th>
                                <th width="65%">제목</th>
                                <th width="15%">작성일</th>
                                <th width="10%">조회수</th>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty myBoardList}">
                                        <tr>
                                            <td colspan="4" style="text-align: center;"><p>작성한 게시글이 없습니다.</p></td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="b" items="${myBoardList}">
                                            <!-- 호연님한테 cpage는 뺼수 있냐 물어보기(호연님 게시글 페이징이랑 내 마이페이지 작성한글 페이징이랑 다름. 
                                            예를 들어 호연님은 카태고리 일반, 꿀팁, 질문, 거래별로 페이징 처리 해놨는데 나는 작성한글 내가 쓴글이 전부
                                            있기떄문에 페이지 수가 다를수밖에 없음)-->
                                            <tr onclick="location.href = 'detail.co?category=${b.boardLevel}&boardNo=${b.boardNo}'">
                                                <c:choose>
                                                    <c:when test="${b.boardLevel eq 0}">
                                                        <td>일반</td>
                                                    </c:when>
                                                    <c:when test="${b.boardLevel eq 1}">
                                                        <td>꿀팁</td>
                                                    </c:when>
                                                    <c:when test="${b.boardLevel eq 2}">
                                                        <td>질문</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>중고거래</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>${b.boardTitle}</td>
                                                <td>${b.writeDate}</td>
                                                <td>${b.boardCount}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                        <div id="btnList-area">
                            <div class="btnList" align="center">
                                <button id="btn1">&lt;</button>
                                <button id="btn2">1</button>
                                <button id="btn3">&gt;</button>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>