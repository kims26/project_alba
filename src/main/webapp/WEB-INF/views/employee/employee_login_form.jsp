<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원 로그인 폼</title>
    <link rel="stylesheet" type="text/css" href="../login_css/login.css">
</head>
<body>
    <div class="wrapper">
        <div class="container">
          <div class="sign-up-container">
            <form>
              <h1>직원 회원가입</h1>
              <div class="social-links">
                <div>
                  <a href="../main/main.do"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
                </div>
              </div>
              <span>회원가입</span>
              <input type="text" placeholder="Name">
              <input type="email" placeholder="Email">
              <input type="password" placeholder="Password">
              <button class="form_btn">회원가입</button>
            </form>
          </div>
          <div class="sign-in-container">
            <form>
              <h1>직원 로그인</h1>
              <div class="social-links">
                <div>
                    <a href="../main/main.do"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
                </div>
                <div>
                    <a href="../employee/insert_form.do"><i class="fa fa-plus" aria-hidden="true"></i></a>
                </div>
              </div>
              <span>회원가입</span>
              <input type="email" placeholder="Email">
              <input type="password" placeholder="Password">
              <button class="form_btn">Log-In</button>
            </form>
          </div>
          <div class="overlay-container">
            <div class="overlay-left">
              <h1>직원 로그인</h1>
              <p>회원가입후 다시 로그인 해주세요</p>
              <button id="signIn" class="overlay_btn">Log-In</button>
            </div>
            <div class="overlay-right">
              <h1>Hello, 사장님</h1>
              <p>가게 로그인이시면 여기를 클릭해주세요</p>
              <button id="ownerLoginBtn" onclick="location.href='../owner/login_form.do'" class="overlay_btn">사장</button>
            </div>
          </div>
        </div>
      </div>
    <script src="../js/login.js"></script>
</body>
</html>
