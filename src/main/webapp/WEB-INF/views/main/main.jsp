<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>

    <link rel="stylesheet" href="../assets/css/main.css" />

    
   
    <script type="text/javascript">

   
    
    </script>
    

   
</head>

<body class="homepage is-preload">

  
    <div id="page-wrapper">

        <!-- Header -->
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
                            <li>
                                <a href="../board/board_list.do">게시판</a>
                            </li>

                           

                            <li><a href="../calender/list.do">일정</a></li>

                            <li><a href="left-sidebar.html">소통방</a></li>

                           

                            <li > 
                                <c:if test="${ not empty sessionScope.owner }">                               
                                    <a href="../owner/list.do">사장님</a>
                                </c:if>

                                <c:if test="${ not empty sessionScope.member }">                               
                                    <a href="../employee/list.do">알바생</a>
                                </c:if>
                            </li>
                          
                            <li >
                                <c:if
                                test="${ empty sessionScope.member && empty sessionScope.owner }">
                                    <a href="../employee/login_form.do">로그인</a>
                            </c:if>

                            <c:if test="${ not empty sessionScope.owner }">                               
                                <a href="../owner/logout.do">로그아웃</a>

                             
                              
                            </c:if>

                            <c:if test="${ not empty sessionScope.member }">                               
                                <a href="../employee/logout.do">로그아웃</a>
                            </c:if>

                        </li>

                        <!-- <li > 
                            <c:if test="${ not empty sessionScope.owner }">                               
                                <a href="../owner/logout.do">로그아웃</a>
                            </c:if>
                        </li> -->

                        <!-- <li>
                            <c:if test="${ not empty sessionScope.owner }">
                            <span >
                                <a>
                                    ${sessionScope.owner.o_name}
                                    사장님 환영합니다
                                </a>
                            </span>
                            </c:if>  
                            </li> -->

                            <!-- <li > 
                                <c:if test="${ not empty sessionScope.member }">                               
                                    <a href="../employee/logout.do">로그아웃</a>
                                </c:if>
                            </li> -->

                            <li>
                                <c:if test="${ not empty sessionScope.member }">
                                    <span >
                                        <a>
                                            <a onclick="location.href='../employee/modify_form.do?e_idx='+'${member.e_idx}'"> ${sessionScope.member.e_name}
                                                님 환영합니다</a>
                                        </a>
                                    </span>
                                </c:if> 

                                <c:if test="${ not empty sessionScope.owner }">
                                    <span >
                                        <a>
                                            <a onclick="location.href='../owner/modify_form.do?o_idx='+'${owner.o_idx}'"> ${sessionScope.owner.o_name}
                                                님 환영합니다</a>
                                        </a>
                                    </span>
                                    </c:if> 

                                </li>

                                <!-- <li>
                                    <c:if test="${ not empty sessionScope.member }">
                                    <span>
                                        <a>
                                            <a onclick="location.href='../employee/modify_form.do?e_idx='+'${member.e_idx}'">마이페이지</a>
                                        </a>
                                    </span>
                                    </c:if> 
    
                                    <c:if test="${ not empty sessionScope.owner }">
                                        <span >
                                            <a>
                                                <a onclick="location.href='../owner/modify_form.do?o_idx='+'${owner.o_idx}'">마이페이지</a>
                                            </a>
                                        </span>
                                        </c:if> 
    
                                    </li> -->

            
                        </ul>
                    </nav>
            </div>
            

          

              
                    
        <!-- Footer -->
            <div id="footer">
                <div class="container">
                    <hr />
                    <div class="row">
                        <div class="col-12">

                            <!-- Contact -->
                                <section class="contact">
                                    <header>
                                        <h3>Nisl turpis nascetur interdum?</h3>
                                    </header>
                                    <p>Urna nisl non quis interdum mus ornare ridiculus egestas ridiculus lobortis vivamus tempor aliquet.</p>
                                    <ul class="icons">
                                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                                        <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                                        <li><a href="#" class="icon brands fa-pinterest"><span class="label">Pinterest</span></a></li>
                                        <li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
                                        <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">Linkedin</span></a></li>
                                    </ul>
                                </section>

                            <!-- Copyright -->
                                <div class="copyright">
                                    <ul class="menu">
                                        <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                                    </ul>
                                </div>

                        </div>

                    </div>
                </div>
            </div>

    </div>

    <!-- Scripts -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery.dropotron.min.js"></script>
        <script src="../assets/js/jquery.scrolly.min.js"></script>
        <script src="../assets/js/jquery.scrollex.min.js"></script>
        <script src="../assets/js/browser.min.js"></script>
        <script src="../assets/js/breakpoints.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <script src="../assets/js/main.js"></script>

</body>
  

</html>