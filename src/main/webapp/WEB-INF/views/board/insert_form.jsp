<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



<script>
    function send(f){

        let b_title = f.b_title.value.trim();
        let b_contents = f.b_contents.value.trim();

        if(b_title==''){
            alert("제목을 입력하세요!!");
            f.b_title.value='';
            f.b_title.focus();    
            return;
        }

        if(b_contents==''){
            alert("내용을 입력하세요!!");
            f.b_contents.value='';
            f.b_contents.focus();    
            return;
        }
        f.action = "insert.do";
        f.submit();
    }

</script>

</head>

<body>
    <%@ include file="../main/header.jsp" %>

    <h1>게시판</h1>

    <!-- 게시글 목록 -->
    <c:forEach items="${boardList}" var="vo">
        <div>
            <h3>${board.b_title}</h3>
            <p>${board.b_contents}</p>
            <p>작성일: ${board.b_create_date}</p>
            <p>조회수: ${board.b_view_cnt}</p>
        </div>
    </c:forEach>

    <!-- 게시글 작성 양식 -->
    <h2>게시글 작성</h2>
    <form method="post">
        <label>제목:</label>
        <input type="text" id="b_title" name="b_title" ><br>

        <label>내용</label>      
        <div id="content">
            <textarea class="form-control" name="b_contents"></textarea>
        </div>
        <br>

        <input class="btn btn-primary" type="button" value="새글쓰기" 
        onclick="send(this.form);">

    </form>

   
</body>
</html>

