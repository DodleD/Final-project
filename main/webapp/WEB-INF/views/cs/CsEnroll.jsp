<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작성</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csCSS/CsEnroll.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJS/CsEnroll.js"></script>
    
</head>
<body>
    <c:if test="${ not empty errorMessage}">
        <script>
            var errorMessage = '${errorMessage}';
            if (errorMessage) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    html: errorMessage
                });
            }
        </script>
		<c:remove var="errorMessage" scope="session"/>
	</c:if>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            
            <div id="com-head">
                <!-- 글쓰기 -->
            </div>

            <div id="com-nav">
                <li>
                    <!-- <button class="com-nav-0" onclick="boCategory(0)"  style="border-radius: 20px;">
                        <img src="${pageContext.request.contextPath}/resources/image/iconQnA.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="물음표 아이콘"> 
                            <div style="width: 150px;">
                            자주묻는 질문
                            </div>                        
                    </button> -->
                </li>
                        
                <li>
                    <!-- <button class="com-nav-10" onclick="boCategory(1)" value="1" style="border-radius: 20px;">
                        <img src="${pageContext.request.contextPath}/resources/image/icon_onetoone.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="1:1">
                        <div style="width: 150px;">
                            1:1 문의
                        </div>
                    </button> -->
                </li>
                    <!-- icon_onetoone.png 사용 -->
                <li>
                    <!-- <button class="com-nav-20" onclick="boCategory(2)" value="2"style="border-radius: 20px;">
                        <img src="${pageContext.request.contextPath}/resources/image/icon_report.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="신고센터">
                        <div style="width: 150px;">
                            신고센터
                        </div>
                    </button> -->
                </li>
            </div>

            <form method="post" action="insert.cs">
                <div id="com-enroll-top">
                    <div>
                        게시판
                    </div>
                    <select name="boardLevel">
                        <option class="com-category" value="0">자주묻는 질문</option>
                        <option class="com-category" value="1">1:1 문의</option>
                        <option class="com-category" value="2">신고센터</option>
                    </select>
                </div>
                <div id="com-enroll-middle">
                    <div>
                        제목
                    </div>
                    <input type="hidden" name="userNo" value="${loginUser.userNo}">
                    <input type="text" name="boardTitle" maxlength="33" required>
                </div>
                <div id="com-enroll-content">
                    <textarea name="boardContents" id="com-enroll-content-p"></textarea>
                </div>
                <div id="com-enroll-bottom">
                    <button id="com-grey-button">취소</button>
                    <button type="submit" id="com-blue-button">등록</button>
                </div>
            </form>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>