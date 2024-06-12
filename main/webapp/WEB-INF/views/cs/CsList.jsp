<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<title>Aquaqu목록</title>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- alertify -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csCSS/CsList.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJS/CsList.js"></script>

</head>
<body onload="categorySelected();">
    <c:if test="${ not empty successMessage}">
		<script>
            var successMessage = '${successMessage}';
            if (successMessage) {
                Swal.fire({
                    icon: 'success',
                    title: 'success!',
                    html: successMessage
                });
            }
		</script>
		<c:remove var="successMessage" scope="session"/>
	</c:if>
    <c:if test="${ not empty infoMessage}">
		<script>
            var infoMessage = '${infoMessage}';
            if (infoMessage) {
                Swal.fire({
                    icon: 'info',
                    title: 'Notice',
                    html: infoMessage
                });
            }
		</script>
		<c:remove var="infoMessage" scope="session"/>
	</c:if>

    <c:if test="${ not empty infoMessage}">
		<script>
            var infoMessage = '${infoMessage}';
            if (infoMessage) {
                Swal.fire({
                    icon: 'info',
                    title: 'Notice',
                    html: infoMessage
                });
            }
		</script>
		<c:remove var="infoMessage" scope="session"/>
	</c:if>

    <div class="wrap" >
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>

        <main id="community-normal" >
            
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
                        </button></li>
                        <!-- icon_onetoone.png 사용 -->
                        <li><button class="com-nav-20" onclick="boCategory(2)" value="2"style="border-radius: 20px;">
                            <img src="${pageContext.request.contextPath}/resources/image/icon_report.png" style="width: 40px; height: 40px; position: relative; right: 12px; top: -3px;" alt="신고센터">
                            <div style="width: 150px;">
                                신고센터
                            </div>
                            </button>
                        </li>
                       <!-- icon_report.png 사용 -->
                    </ul>
            </div>

            <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                <c:choose>
                    <c:when test="${empty list}">
                        <tbody id="com-list-bottom">
                            <td colspan="5" style="border-radius: 0 0 10px 10px;">게시글이 존재하지 않습니다.</td>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="b" items="${list}" varStatus="order">
                            <c:choose>
                                <c:when test="${order.last}">
                                    <tbody id="com-list-bottom">
                                        <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                        <td><a href="javascript:show(${b.boardLevel}, ${pi.currentPage}, ${b.boardNo})" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                        <td>${b.nickname}</td>
                                        <td>${b.writeDate}</td>
                                        <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                                    </tbody>
                                </c:when>
                                <c:otherwise>
                                    <tbody id="com-list-body">
                                        <td>${b.boardNo}</td>
                                        <td><a href="javascript:show(${b.boardLevel}, ${pi.currentPage}, ${b.boardNo})" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                        <td>${b.nickname}</td>
                                        <td>${b.writeDate}</td>
                                        <td>${b.boardCount}</td>
                                    </tbody>
                                </c:otherwise>
                            </c:choose> 
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </table>
            
            <!-- <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                
                <tbody id="com-list-body">
                    <td>공지</td>
                    <td><b>신고 작성 시 주의사항</b></td>
                    <td>관리자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>9</td>
                    <td><a href="">드립 칠 제목도 생각이 안 난다</a></td>
                    <td>할렐루야</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>8</td>
                    <td><a href="">액퍼 커뮤니티 사이트인 줄 알았는데</a></td>
                    <td>비바</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>7</td>
                    <td><a href="">낚시 관련 커뮤니티 사이트가 아니라고?</a></td>
                    <td>오예</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>6</td>
                    <td><a href="">제목 뭐 하지</a></td>
                    <td>지저스</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>5</td>
                    <td><a href="communityDetail.jsp">첫 관상어 소개</a></td>
                    <td>왓더</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>4</td>
                    <td><a href="">가즈아</a></td>
                    <td>호눌룰루</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>3</td>
                    <td><a href="">몰?루</a></td>
                    <td>요시</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>2</td>
                    <td><a href="">첫 뻘글</a></td>
                    <td>아자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td style="border-radius: 0 0 0 10px;">1</td>
                    <td><a href="">첫 게시글</a></td>
                    <td>관리자</td>
                    <td>0000.00.00</td>
                    <td style="border-radius: 0 0 10px 0;">0</td>
                </tbody>
            </table> -->

            <div class="com-bottom1">
                <div class="com-bottom-left">
                    <form action="searchlist.cs" method="get">
                        <input type="hidden" name="category" value="${boardLevel}">
                        <input type="hidden" name="cpage" value="1">
                        <select name="condition" id="com-condition">
                            <option value="title">제목</option>
                            <option value="writer">글쓴이</option>
                        </select>
                        <input type="text" name="keyword" value="${keyword}" placeholder="검색어 입력(대소문자 구분)">
                        <button id="com-search-button" type="submit">검색</button>
                    </form>
                </div>
                <div id="com-bottom-right">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <!-- 로그인 전 -->
                            <button id="com-grey-button" disabled>글쓰기</button>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인 후 -->
                            <button onclick="location.href='enrollForm.cs'" id="com-blue-button">글쓰기</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="com-bottom2">
                
                <div id="pagination-div">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="list.cs?category=${boardLevel}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                            </c:otherwise>
                    </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:set var="b" value="${boardLevel}"/>
                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="list.cs?category=${b}&cpage=${p}">${p}</a></li>
                </c:forEach>
                    
                  <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.cs?category=${boardLevel}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                     </ul>
                </div>
            </div>

            <!-- <div class="com-bottom1">
                
                <div class="com-bottom2">
                    이전 &nbsp; 1 &nbsp; 2 &nbsp; 3 &nbsp; 4 &nbsp; 5 &nbsp; 6 &nbsp; 7 &nbsp; 8 &nbsp; 9 &nbsp; 10 &nbsp; 다음
                </div>
                <div id="com-bottom-right">
                    <button id="com-blue-button">글쓰기</button>
                </div>
                
            </div> -->
      
        </main>
        
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>

    </div>
</body>
</html>