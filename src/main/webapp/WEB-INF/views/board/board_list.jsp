<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            text-align: center; /* 페이지 내용을 가운데 정렬합니다. */
        }

        table {
            width: 90%; /* 테이블 너비를 90%로 설정합니다. */
            margin: 0 auto; /* 테이블을 페이지 가운데로 정렬합니다. */
        }

        th, td {
            font-size: 20px; /* 헤더와 셀의 텍스트 크기를 크게 조절합니다. */
        }

        .centered-icon {
            text-align: center;
        }
    </style>
    <script>
        function insert_form() {
            // 로그인 체크(안된 경우)
            if ("${ empty sessionScope.member }" == "true") {
                if (confirm("글쓰기는 로그인 후 가능합니다. 로그인 하시겠습니까?") == false) return;
                location.href = "../employee/login_form.do"; // 현재 경로: /board/
                return;
            }
            // 글쓰기 폼으로 이동
            location.href = "insert_form.do";
        }
    </script>
    <script>
        // 언제 호출?: HTML 브라우저 배치 완료되면
        $(document).ready(function () {
            if ("${not empty param.search_board}" == "true") {
                $("#search_board").val("${param.search_board}");
            }
        });
        function search_f() {
            let search = $("#search_board").val();
            let search_text = $("#search_text").val().trim();
            if (search != 'all') { // 전체 검색이 아니면
                if (search_text == '') {
                    alert('검색어를 입력하세요~~');
                    $("#search_text").val(""); // 값 지우기
                    $("#search_text").focus();
                    return;
                }
            }
            // 전체 검색이면 검색어 지우기
            if (search == "all") {
                $("#search_text").val("");
                search_text = "";
            }
            location.href = "board_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
        }
    </script>
</head>

<body>
    
<%@ include file="../main/header.jsp" %>
    <h1>게시물</h1>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12">
                <label for="searchType" class="form-label">검색 유형:</label>
                <select id="searchType" name="searchType" class="form-select">
                    <option value="all">전체</option>
                    <option value="e_name">이름</option>
                    <option value="b_title">제목</option>
                    <option value="b_contents">내용</option>
                    <option value="e_name_e_subject_e_content">이름+제목+내용</option>
                </select>
            </div>
            
            <div class="col-lg-6 col-md-6 col-sm-12">
                <input type="text" class="form-control" id="search_text" value="${param.search_text}">
            </div>
            <div class="col-lg-1 col-md-3 col-sm-12">
                <button type="button" class="btn btn-primary" onclick="search_f()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </button>
            </div>
            <div class="container mt-4">
                <div class="d-flex justify-content-end">
                    <a href="../board/insert_form.do" class="btn btn-primary">게시물 등록하기</a>
                </div>
            </div>
        </div>


    </div>
    <div class="container mt-4">
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일자</th>
                        <th scope="col">제목</th>
                        <th scope="col">내용</th>
                    </tr>
                </thead>
                <c:choose>
                    <c:when test="${empty list}">
                        <tbody>
                            <tr>
                                <td colspan="4" class="text-center text-danger">등록된 게시물이 없습니다.</td>
                            </tr>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <tbody>
                            <c:forEach var="vo" items="${list}">
                                <tr>
                                    <td>${vo.e_name}</td>
                                    <td>${vo.b_create_date}</td>
                                    <td>
                                        <div class="b_title">
                                            <a href="view.do?b_idx=${vo.b_idx}&page=${empty param.page ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}">${vo.b_title}</a>
                                        </div>
                                        <td>${vo.b_contents}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </div>

   

    <div class="container mt-4">
        <div class="d-flex justify-content-center">
            ${pageMenu}
        </div>
    </div>
</body>
</html>

