<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/communityJS/communityList.js"></script>
    <!-- success -->

</head>
<body>
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
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <div id="com-nav">
                    <ul>
                        <li><button class="com-nav" onclick="boCategory(0)" name="boardLevel" value="0" style="border-radius: 10px 0 0 10px;">일반</button></li>
                        <li><button class="com-nav" onclick="boCategory(1)" name="boardLevel" value="1">꿀팁</button></li>
                        <li><button class="com-nav" onclick="boCategory(2)" name="boardLevel" value="2">질문</button></li>
                        <li><button class="com-nav" onclick="boCategory(3)" name="boardLevel" value="3" style="border-radius: 0 10px 10px 0;">중고거래</button></li>
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
            </table>
            <div class="com-bottom1">
                <div class="com-bottom-left">
                    <select name="condition" id="com-condition">
                        <option value="title">제목</option>
                        <option value="writer">글쓴이</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="keyword" value="" placeholder="검색어 입력">
                    <button id="com-search-button" type="submit">검색</button>
                </div>
                <div id="com-bottom-right">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <!-- 로그인 전 -->
                            <button id="com-grey-button" disabled>글쓰기</button>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인 후 -->
                            <button onclick="location.href='enrollForm.co'" id="com-blue-button">글쓰기</button>
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
                                <li class="page-item"><a class="page-link" href="list.co?category=${b.boardLevel}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                            </c:otherwise>
                    </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:set var="b" value="${list[0].boardLevel}"/>
                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="list.co?category=${b}&cpage=${p}">${p}</a></li>
                </c:forEach>
                    
                  <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.co?category=${b.boardLevel}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                     </ul>
                </div>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>