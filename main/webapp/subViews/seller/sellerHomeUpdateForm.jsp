<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 홈 수정</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerHomeForm.css">

<script>
    $(document).ready(function() {
        let categories = [];

        $('#add-categoryBtn').click(function() {
            let category = $('#enroll-category').val().trim();
            if (category) {
                categories.push(category);
                $('#categoryList').append('<div data-category="' + category + '"><li>' + category + '</li><button class="removeBtn">x</button></div>');
                $('#enroll-category').val('');
                console.log(categories);
            } else {
                alert('카테고리를 입력하세요.');
            }
        });

        $(document).on('click', '.removeBtn', function() {
            let categoryDiv = $(this).parent();
            let category = categoryDiv.data('category');
            let index = categories.indexOf(category);
            if (index > -1) {
                categories.splice(index, 1);
                categoryDiv.remove();
                console.log(categories);
            }
        });
    });
</script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>스토어 관리</h1>
            <form action="${pageContext.request.contextPath}/insertSeller" method="post" enctype="multipart/form-data">
                <div>
                    <h4>스토어 소개</h4>
                    <input id="store-introduce" type="text" name="storeDescription" placeholder="스토어 소개 입력" style="width: 300px; padding: 5px;">
                </div>
                <div>
                    <h4>대표 이미지</h4>
                    <input type="file" name="storeHomeImage" id="storeHomeImage">
                </div>
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" alt="대표 이미지">
                </div>

                <div id="div-enroll-category">
                    <div>
                        <h4>카테고리 등록</h4>
                        <input id="enroll-category" type="text" id="categoryInput" placeholder="카테고리 입력">
                        <button type="button" id="add-categoryBtn">추가</button>
                    </div>
                    <div>
                        <ul id="categoryList"></ul>
                    </div>
                </div>                
                
                <div class="form-actions">
                    <button type="submit">등록하기</button>
                    <button type="reset">초기화</button>
                </div>
            </form>
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
