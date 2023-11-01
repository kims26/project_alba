<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헤더 페이지</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
    <div id="header">
        <div class="inner">
            <header>
                <h1><a href="main.do" id="logo">alba_star</a></h1>
                <hr />
                <p>ALBA-Star-Application</p>
            </header>
            <footer>
                <a href="main.do" class="button circled scrolly">Start</a>
            </footer>
        </div>
        <nav id="nav">
            <ul>
                <li><a href="main.do">Home</a></li>
                <li><a href="../board/board_list.do">게시판</a></li>
                <li><a href="left-sidebar.html">일정</a></li>
                <li><a href="left-sidebar.html">소통방</a></li>
                <li> 
                    <c:if test="${ not empty sessionScope.owner }">                               
                        <a href="../owner/list.do">사장님</a>
                    </c:if>
                </li>
                <li> 
                    <c:if test="${ not empty sessionScope.member }">                               
                        <a href="../employee/list.do">알바생</a>
                    </c:if>
                </li>
                <li>
                    <c:if test="${ empty sessionScope.member && empty sessionScope.owner }">
                        <a href="../employee/login_form.do">Log-in</a>
                    </c:if>
                </li>
                <li> 
                    <c:if test="${ not empty sessionScope.owner }">                               
                        <a href="../owner/logout.do">로그아웃</a>
                    </c:if>
                </li>
                <li>
                    <c:if test="${ not empty sessionScope.owner }">
                        <span>
                            <a>
                                ${sessionScope.owner.o_name}
                                사장님 환영합니다
                            </a>
                        </span>
                    </c:if>  
                </li>
                <li> 
                    <c:if test="${ not empty sessionScope.member }">                               
                        <a href="../employee/logout.do">로그아웃</a>
                    </c:if>
                </li>
                <li>
                    <c:if test="${ not empty sessionScope.member }">
                        <span>
                            <a>
                                ${sessionScope.member.e_name}
                                직원님 환영합니다
                            </a>
                        </span>
                    </c:if>  
                </li>
            </ul>
        </nav>
    </div>
</body>
</html>
