<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>

    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">


    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">

    <!-- <link rel="stylesheet" href="../css/templatemo-breezed.css"> -->

    <!-- <link rel="stylesheet" href="../css/owl-carousel.css"> -->

    <!-- <link rel="stylesheet" href="../css/lightbox.css"> -->

    <link rel="stylesheet" href="../headercss/header.css">


</head>

<body>
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="../main/main.do" class="logo">
                            .alba_star
                        </a>
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="../main/main.do" class="active">Home</a></li>
                            <li class="submenu">
                                <a href="javascript:;">알바생</a>
                                <ul>
                                    <li><a href="">급여</a></li>
                                    <li><a href="">출퇴근기록</a></li>
                                    <li><a href="">My-Page</a></li>
                                </ul>
                            </li>
                            <li class="scroll-to-section"><a href="../board/board_list.do">게시판</a></li>
                            <li class="scroll-to-section"><a href="#projects">일정</a></li>

                            <li class="scroll-to-section">
                                 <c:if
                                    test="${ empty sessionScope.member && empty sessionScope.owner }">
                                        <a href="../employee/login_form.do">Log-in</a>
                                </c:if>
                            </li>

                            <li class="scroll-to-section"> 
                                <c:if test="${ not empty sessionScope.owner }">                               
                                    <a href="../owner/logout.do">로그아웃</a>
                                </c:if>
                             </li>

                             <li>
                             <c:if test="${ not empty sessionScope.owner }">
                                <span class="scroll-to-section">
                                    <a>
                                        ${sessionScope.owner.o_name}
                                        사장님 환영합니다
                                    </a>
                                </span>
                                </c:if>  
                             </li>
                             <li class="scroll-to-section"> 
                                <c:if test="${ not empty sessionScope.member }">                               
                                    <a href="../employee/logout.do">로그아웃</a>
                                </c:if>
                             </li>

                             <li>
                             <c:if test="${ not empty sessionScope.member }">
                                <span class="scroll-to-section">
                                    <a>
                                        ${sessionScope.member.e_name}
                                        직원님 환영합니다
                                    </a>
                                </span>
                                </c:if>  
                             </li>

                             <!-- <li>
                             <c:if test="${ not empty sessionScope.member }">
                                <span class="scroll-to-section"><b>${ sessionScope.member.e_name }</b>직원님 환영합니다</span>
                                <div class="scroll-to-section">
                                    <a href="../employee/logout.do" class="login_btn">로그아웃</a>
                                </div>
                                </c:if>
                            </li> -->
                        </ul>       
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>