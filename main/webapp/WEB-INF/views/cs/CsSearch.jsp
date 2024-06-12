<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검색</title>

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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csCSS/CsList.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJS/CsSearchList.js"></script>
    <!-- success -->

</head>
<body onload="categorySelected(`${boardLevel}`); conditionSelected(`${condition}`);">
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
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <div id="com-nav">
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
                                        <form id="show-${b.boardNo}" action="detail.cs" method="get">
                                            <input type="hidden" name="category" value="${boardLevel}">
                                            <input type="hidden" name="cpage" value="${pi.currentPage}">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardNo" value="${b.boardNo}">
                                            <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                            <td><a href="#" onclick="showsearch('${b.boardNo}')" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                            <td>${b.nickname}</td>
                                            <td>${b.writeDate}</td>
                                            <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                                        </form>
                                    </tbody>
                                </c:when>
                                <c:otherwise>
                                    <tbody id="com-list-body">
                                        <form id="show-${b.boardNo}" action="detail.cs" method="get">
                                            <input type="hidden" name="category" value="${boardLevel}">
                                            <input type="hidden" name="cpage" value="${pi.currentPage}">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardNo" value="${b.boardNo}">
                                            <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                            <td><a href="#" onclick="showsearch('${b.boardNo}')" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                            <td>${b.nickname}</td>
                                            <td>${b.writeDate}</td>
                                            <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                                        </form>
                                    </tbody>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </table>
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
                                <form id="prevpage-link" action="searchlist.cs" method="get">
                                    <input type="hidden" name="category" value="${boardLevel}">
                                    <input type="hidden" name="cpage" value="${pi.currentPage - 1}">
                                    <input type="hidden" name="condition" value="${condition}">
                                    <input type="hidden" name="keyword" value="${keyword}">
                                </form>
                                <li class="page-item"><a class="page-link" href="javascript:prevpage()">&laquo;</a></li>
                            </c:otherwise>
                        </c:choose>
            
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <c:set var="b" value="${boardLevel}"/>
                            <form id="numpage-link-${p}" action="searchlist.cs" method="get">
                                <input type="hidden" name="category" value="${b}">
                                <input type="hidden" name="cpage" value="${p}">
                                <input type="hidden" name="condition" value="${condition}">
                                <input type="hidden" name="keyword" value="${keyword}">
                            </form>
                            <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:numpage(`${p}`)">${p}</a></li>
                        </c:forEach>
                
                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <form id="nextpage-link" action="searchlist.cs" method="get">
                                    <input type="hidden" name="category" value="${boardLevel}">
                                    <input type="hidden" name="cpage" value="${pi.currentPage + 1}">
                                    <input type="hidden" name="condition" value="${condition}">
                                    <input type="hidden" name="keyword" value="${keyword}">
                                </form>
                                <li class="page-item"><a class="page-link" href="javascript:nextpage()">&raquo;</a></li>
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