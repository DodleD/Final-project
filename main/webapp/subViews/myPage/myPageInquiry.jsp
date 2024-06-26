<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInquiry.css">
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPageInquiry-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickName}홍길동</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="">내 정보</a></div>
                        <div class="myPage-category"><a href="">관심상품</a></div>
                        <div class="myPage-category"><a href="">주문내역</a></div>
                        <div class="myPage-category"><a href="">작성한 글</a></div>
                        <div class="myPage-category"><a href="">장바구니</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="">1:1 문의</a></div>
                        <div class="myPage-category"><a href="">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageInquiry-info-area">
                    <div id="myPage-category-select-title">
                        <h3>1:1 문의</h3>
                    </div>
                    <div id="myPageInquiry-list-area">
                        <div id="myPageInquiry-list">
                            <table>
                                <thead>
                                    <th width="15%">글 번호</th>
                                    <th width="10%">구분</th>
                                    <th width="50%">제목</th>
                                    <th width="25%">작성일</th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td width="15%">num</td>
                                        <td width="10%">type</td>
                                        <td width="50%">title</td>
                                        <td width="25%">createDate</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div id="btnList-area">
                        <div class="btnList" align="center">
                            <button id="btn1">&lt;</button>
                            <button id="btn2">1</button>
                            <button id="btn3">&gt;</button>
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