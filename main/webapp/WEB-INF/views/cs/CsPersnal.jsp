<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>persnal</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/footer.css">
  
<link rel="stylesheet" href="../../resources/css/csCSS/CsPersnal.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJS/CsPersnal.js"></script>
</head>
<body>
    <div class="wrap">
	
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
    
                <div class="center"><br>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 제목1</h2>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 내용 1 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어쩌구 저쩌구
                    <br><br><br><br>
                </div>
                <div class="center"><br>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 제목2</h2>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 내용 2 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어쩌구 저쩌구
                    <br><br><br><br>
                </div>
                <div class="center"><br>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 제목3</h2>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 내용 3 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어쩌구 저쩌구
                    <br><br><br><br>
                </div>
                <div class="center"><br>
                    <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 제목4</h2>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대충 문의 내용 4 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어쩌구 저쩌구<br><br><br><br>
                </div>
            </div>
            
            <div class="com-bottom1">
                <div class="com-bottom2">
                    &lt;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &gt;
                </div>
                <div id="com-bottom-right">
                    <button id="com-blue-button">문의하기</button>
                </div>
            </div>
    
        </main>

         <!-- footer -->
         <%@ include file="../commons/footer.jsp" %>
        
        </div>

     


</body>
</html>