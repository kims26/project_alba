<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        .center-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh; /* 높이를 조정합니다 (예: 80vh) */
        }

        /* 제목 박스의 크기를 줄입니다 */
        #b_title {
            width: 60%; /* 가로 크기를 조정합니다 (예: 60%) */
        }

        /* 내용 박스의 크기를 늘립니다 */
        #b_contents {
            height: 300px; /* 세로 크기를 늘립니다 (예: 300px) */
        }
    </style>

    <script>
        function send(f) {
            let b_title = f.b_title.value.trim();
            let b_contents = f.b_contents.value.trim();

            if (b_title == '') {
                alert("제목을 입력하세요!!");
                f.b_title.value = '';
                f.b_title.focus();
                return;
            }

            if (b_contents == '') {
                alert("내용을 입력하세요!!");
                f.b_contents.value = '';
                f.b_contents.focus();
                return;
            }
            f.action = "modify.do";
            f.submit();
        }
    </script>
</head>

<body>
    <%@ include file="../main/header.jsp" %>

    <h1 class="text-center">게시판</h1>

   
    <div class="center-form">
        <h2>게시글 작성</h2>
        <form method="post" style="width: 80%;"> 
            <input type="hidden" name="b_idx" value="${ vo.b_idx }">
            <input type="hidden" name="page" value="${ param.page }">
            <input type="hidden" name="search" value="${ param.search }">
            <input type="hidden" name="search_text" value="${ param.search_text }">
            <div class="form-group">
                <label for="b_title">제목:</label>
                <input type="text" id="b_title" name="b_title" class="form-control" value="${vo.b_title}" >
            </div>
            <div class="form-group">
                <label for="b_contents">내용:</label>
                <textarea id="b_contents" name="b_contents" class="form-control" rows="5" >${vo.b_contents}</textarea>
            </div>
            <br>
            <button class="btn btn-primary" type="button" onclick="send(this.form)">수정하기</button>

            <input class="btn btn-success" type="button" value="목록보기"
            onclick="location.href='board_list.do?page=${param.page}&search=${param.search}&search_text=${param.search_text}'">
        </form>
    </div>
</body>
</html>
