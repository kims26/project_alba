<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Header</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap">
    <style>
        /* 헤더 스타일링 */
        header {
            background-color: white;
            color: #000;
            padding: 10px;
            text-align: center;
            max-width: 100%;
            margin: 0 auto;
        }

        #nav {
            color: black;
            text-align: center;
            max-width: 100%;
            margin: 0 auto;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            display: inline;
            margin-right: 20px;
        }

        a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            margin-right: 30px;
            line-height: 4.0; /* 링크 텍스트를 세로로 조금 아래로 이동합니다. */
        }
    </style>
</head>

<body>

    <header style="background-color: rgb(41, 164, 205); color: white; padding: 10px; text-align: center; max-width: 100%; margin: 0 auto;">
       
        <div class="inner">

            <!-- <h1 style="display: flex; align-items: center;">
                <a href="../main/main.do">
                    <img src="../../../images/kim.png" alt="피씨로고" class="pc_ver" style="height: 100px; margin-top: 20px;">
                </a>
            </h1> -->

            <nav id="nav">
                
                <a href="../main/main.do" style="float: left;">
                    <img src="../../../images/bbb.png" alt="피씨로고" class="pc_ver" style="height: 100px; margin-top: -10px; margin-left: -100;">

                </a>

                <ul>

                    <strong><li><a href="../main/main.do">Home</a></li></strong>
                    <strong> <li><a href="../board/board_list.do">게시판</a></li></strong>
                        <strong><li><a href="../calender/list.do">일정</a></li></strong>
                            <strong><li><a href="left-sidebar.html">소통방</a></li></strong>

                                <strong><li>
                        <c:if test="${not empty sessionScope.owner}">
                            <a href="../owner/list.do">사장님</a>
                        </c:if>

                        <c:if test="${not empty sessionScope.member}">
                            <a href="../employee/list.do">알바생</a>
                        </c:if>
                    </li>
                    </strong>

                    <strong>

                   
                    <li>
                        <c:if test="${empty sessionScope.member && empty sessionScope.owner}">
                            <a href="../employee/login_form.do">로그인</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.owner}">
                            <a href="../owner/logout.do">로그아웃</a>
                        </c:if>
                        <c:if test="${not empty sessionScope.member}">
                            <a href="../employee/logout.do">로그아웃</a>
                        </c:if>
                    </li>
                </strong>
                    <li>
                        <c:if test="${not empty sessionScope.member}">
                            <span>
                                <a onclick="location.href='../employee/modify_form.do?e_idx=${member.e_idx}'">
                                    ${sessionScope.member.e_name} 님 환영합니다
                                </a>
                            </span>
                        </c:if>
                        <c:if test="${not empty sessionScope.owner}">
                            <span>
                                <a onclick="location.href='../owner/modify_form.do?o_idx=${owner.o_idx}'">
                                    ${sessionScope.owner.o_name} 님 환영합니다
                                </a>
                            </span>
                        </c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    
</body>
</html>
