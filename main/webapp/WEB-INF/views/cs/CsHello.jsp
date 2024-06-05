<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hellow</title>
<link rel="stylesheet" href="../../resources/css/csCSS/CsHello.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/footer.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJS/CsHello.js"></script>
</head>
<body>
    <div id="wrap">

        <!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">

            <div id="com-nav" >
                <ul>
                    <li>
                        <button class="com-nav-0" onclick="boCategory(0)"  style="border-radius: 20px;">
                            <img src="${pageContext.request.contextPath}/resources/image/iconQnA.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="물음표 아이콘"> 
                                <div style="width: 150px;">
                                자주묻는 질문
                                </div>
                            
                        </button>
                    </li>
                            
                    <li><button class="com-nav-10" onclick="boCategory(1)" value="1" style="border-radius: 20px;">
                            <img src="${pageContext.request.contextPath}/resources/image/icon_onetoone.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="1:1">
                            <div style="width: 150px;">
                                1:1 문의
                            </div>
                        </button>
                    </li>
                        <!-- icon_onetoone.png 사용 -->
                    <li><button class="com-nav-20" onclick="boCategory(2)" value="2"style="border-radius: 20px;">
                            <img src="${pageContext.request.contextPath}/resources/image/icon_report.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="신고센터">
                            <div style="width: 150px;">
                                신고센터
                            </div>
                        </button>
                    </li>
                   
                </ul>
            </div>

            <div id="center01">
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디, 비밀번호 잊어버렸습니다.</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(뻐끔뻐끔뻐끔뻐끔)</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(꼬로로록)</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소... 솔직히 디자인 하면서 장난치는 건 선넘는다고 생각해요...</b>
                        <!-- <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;디자이너야 그게 무슨 소리니</a> -->
                    </thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;말말말</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;말말말</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;말말말</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;말말말</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금붕어의 기억력은 정말로 3초 인가요?</b></a></thead>
                </div>
                <div class="center">
                    <thead class="center-list"><a href=""><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;물고기의 피는 무슨 색이냐!</b></a></thead>
                </div> 
            </div>        
        </main>
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>                   
    </div>
</body>
</html>