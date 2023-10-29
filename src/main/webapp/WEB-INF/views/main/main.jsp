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

    <link rel="stylesheet" href="../css/templatemo-breezed.css">

    <link rel="stylesheet" href="../css/owl-carousel.css">

    <link rel="stylesheet" href="../css/lightbox.css">
   
</head>
<body>
    <%@ include file="header.jsp" %>
    <%@ include file="../search/search.jsp" %>

  
    <div class="main-banner header-text" id="top">
        <div class="Modern-Slider">
     
        <div class="item">
            <div class="img-fill">
                <img src="../images/slide-01.jpg" alt="">
                <div class="text-content">
                <h3>Welcome To ALBA-STAR</h3>
                <h5>ALBA - STAR</h5>
                </div>
            </div>
        </div>
        
        <div class="item">
            <div class="img-fill">
                <img src="../images/slide-02.jpg" alt="">
                <div class="text-content">
                <h3>CALENDER</h3>
                <h5>사장님과 일정을 공유 해요</h5>
                <a href="#" class="main-stroked-button">일정 보기</a>
                </div>
            </div>
        </div>

        <div class="item">
            <div class="img-fill">
                <img src="../images/slide-03.jpg" alt="">
                <div class="text-content">
                    <h3>Board-Go</h3>
                    <h5>일상 공유 해요</h5>
                    <a href="../board/board_list.do" class="main-filled-button">게시판 가기</a>
                </div>
            </div>
        </div>
        </div>
    </div> 

<section class="section" id="testimonials">
    <div class="container">
        <div class="row">

            <div class="col-lg-12">
                <div class="section-heading">
                    <h6>가게이름</h6>
                    <h2>members</h2>
                </div>
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 mobile-bottom-fix-big" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
               
                <div class="owl-carousel owl-theme">
                    <div class="item author-item">

                        <div class="member-thumb">
                            <img src="../images/member-item-01.jpg" alt="">
                            <div class="hover-effect">
                                <div class="hover-content">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <h4>이름</h4>
                        <span>포지션</span>
                    </div>
                </div>

            </div>

        </div>
    </div>
</section>

<script src="../js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="../js/popper.js"></script>
<script src="../js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="../js/owl-carousel.js"></script>
<script src="../js/scrollreveal.min.js"></script>
<script src="../js/waypoints.min.js"></script>
<script src="../js/jquery.counterup.min.js"></script>
<script src="../js/imgfix.min.js"></script> 
<script src="../js/slick.js"></script> 
<script src="../js/lightbox.js"></script> 
<script src="../js/isotope.js"></script> 

<!-- Global Init -->
<script src="/js/custom.js"></script>

<script>

    $(function() {
        var selectedClass = "";
        $("p").click(function(){
        selectedClass = $(this).attr("data-rel");
        $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("."+selectedClass).fadeOut();
        setTimeout(function() {
          $("."+selectedClass).fadeIn();
          $("#portfolio").fadeTo(50, 1);
        }, 500);
            
        });
    });

</script>

<%@ include file="footer.jsp" %>
</body>
</html>