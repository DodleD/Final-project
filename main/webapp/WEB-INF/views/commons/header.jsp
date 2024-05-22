<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">
	
</head>
<body>
	 <header>
            <div id="Header" style="background-color: white">
                <div id="logo">
                    <p>Aquaqu</p>
                </div>
                <div id="searchBar">
                    <form action="">
                        
                        <input type="text" id="inputArea">
                        <input type="submit" id="inputSubmit" value="">
                    </form>
                    
                </div>
                <div id="loginArea">
                <c:choose>
	            	<c:when test="${empty loginUser}">
		                <!-- 로그인 전 -->
			            <a href="loginForm.me">로그인</a>
	                    <a href="signUpForm.me">회원가입</a>
	            	</c:when>
	                <c:otherwise>
		                <!-- 로그인 후 -->
		                <label>${loginUser.userName}님 환영합니다</label> &nbsp;&nbsp;
		                <a href="myPage.me">마이페이지</a>
		                <a href="logout.me">로그아웃</a>
	                </c:otherwise>
	            </c:choose>
                
                
                

                </div>
            </div>

            <nav>
                <a href="home.ma">홈</a>
                <a href="fishInfo.ma">물고기 정보</a>
                <a href="quration.ma">물고기 큐레이터</a>
                <a href="community.ma">커뮤니티</a>
                <a href="storeMain.ma">스토어</a>
            </nav>
        </header>
</body>
</html>