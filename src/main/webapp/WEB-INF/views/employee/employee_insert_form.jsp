<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>직원 회원가입</title>
    <link href="../login_css/insert.css" rel="stylesheet" />
    
</head>
<body>
    <div class="wrapper">
        <h3>직원 회원가입</h3>
        <input class="inputbox" id="email" type="text" placeholder="이메일을 입력해 주세요."/>
        <div class="error" id="error__email"></div>
        <input class="inputbox" id="writer" type="text" placeholder="이름을 입력해 주세요."/>
        <div class="error" id="error__writer"></div>
        <input class="inputbox" id="password1" type="password" placeholder="비밀번호를 입력해 주세요."/>
        <div class="error" id="error__password1"></div>
        <input class="inputbox" id="password2" type="password" placeholder="비밀번호를 다시 입력해 주세요."/>
        <div class="error" id="error__password2"></div>
        <div class="phone__wrapper">
            <input id="phone1" class="phoneNum" type="text" onchange="changePhone1()" onkeyup="onchange()" /> - 
            <input id="phone2" class="phoneNum" onchange="changePhone2()" onkeyup="onchange()" /> -
            <input id="phone3" class="phoneNum" onchange="changePhone3()" onkeyup="onchange()" />
        </div>
        <div class="token__wrapper">
            <div class="token" id="token">000000</div>
            <button id="token__button" onclick="getToken()" disabled>인증번호 전송</button>
        </div>
        <div class="token__wrapper">
            <div class="token__timer" id="token__timer">3:00</div>
            <button id="token__timer__confirm__button" onclick="getTokenTimerConfirm()" disabled>인증 완료</button>
        </div>
        <div class="location__wrapper">
            <select class="location" id="location">
                <option disabled selected>지역을 선택하세요.</option>
                <option>서울</option>
                <option>경기</option>
                <option>인천</option>
            </select>
        </div>
        <div class="error" id="error__location"></div>
        <div class="gender__wrapper">
            <div class="gender">
                <input type="radio" name="gender" id="gender__woman" class="gender__radio"> 여성
            </div>
            <div class="gender">
                <input type="radio" name="gender" id="gender__man" class="gender__radio"/> 남성
            </div>
        </div>
        <div class="error" id="error__gender"></div>
        <hr />
        <div class="footer">
            <button id="signup__button" onclick="signup()" disabled>가입하기</button>
        </div>
    </div>
    <script src="../js/insert.js"></script>
</body>
</html>