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
       table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1100px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
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

<section class="notice">
    <div class="page-title">
          <div class="container">
              <h3>게 시 판</h3>
          </div>
      </div>
  
      <!-- board seach area -->
      <div id="board-search">
          <div class="container">
              <div class="search-window">
                  <form action="">
                      <div class="search-wrap">
                        <!-- <label for="searchType" class="form-label">검색 유형:</label> -->
                        <select id="searchType" name="searchType" class="form-select">
                            <option value="all">전체</option>
                            <option value="e_name">이름</option>
                            <option value="b_title">제목</option>
                            <option value="b_contents">내용</option>
                            <option value="e_name_e_subject_e_content">이름+제목+내용</option>
                        </select>
                          <input id="search_text"  type="search" name="search_text" placeholder="검색어를 입력해주세요." value="${param.search_text}">
                          <button type="submit" class="btn btn-dark" onclick="search_f()">검색</button>
                      </div>
                  </form>
              </div>
          </div>
      </div>
      <div id="board-list">
          <div class="container">
              <table class="board-table">
                  <thead>
                    <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">내용</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일자</th>
                        </tr>
                    </thead>
                  </thead>

                  <p>
                     <a href="../board/insert_form.do" class="btn btn-primary-1">게시물 등록하기</a>
                    </p>
               
                  <tbody>
                    
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
                                        <td>${vo.b_idx}</td>
                                        <td>
                                            <div class="b_title">
                                                <a href="view.do?b_idx=${vo.b_idx}&page=${empty param.page ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}">${vo.b_title}</a>
                                            </div>
                                        </td>
                                        <td>${vo.e_name}</td>
                                        <td>${vo.b_create_date}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </c:otherwise>
                        </c:choose>
                  </tbody>
              </table>
          </div>
      </div>
  
  </section>
  

  <div class="container mt-4">
    <div class="d-flex justify-content-center">
        ${pageMenu}
    </div>
</div> 

</body>
</html>

