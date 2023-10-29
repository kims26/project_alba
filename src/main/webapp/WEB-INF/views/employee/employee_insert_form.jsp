<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사장님 로그인 폼</title>
   
    <link rel="stylesheet" type="text/css" href="../login_css/insert.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link href="../css/login_page.css?after" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>



 <script type="text/javascript">

function send(f){

var e_id = document.getElementById('e_id');
var e_pwd = document.getElementById('e_pwd');

//정규식
// var reg_id = /^[A-Za-z]{4,10}$/;
// var reg_pwd = /^[A-Za-z0-9]{6,12}$/;

 
//입력항목 체크(이름/비번/우편번호/주소)
 var e_name 	  = f.e_name.value.trim();
 var e_email      = f.e_email.value.trim();
 var e_addr 	  = f.o_addr.value.trim();
 var e_add_addr   = f.o_add_addr.value.trim();
 var e_tel        = f.o_tel.value.trim();

 
 if(e_name==''){
     alert('이름을 입력하세요.');
     f.e_name.value='';
     f.e_name.focus();
     return;
 }

 if(e_email==''){
    alert('이메일를 입력하세요.');
    f.e_email.value='';
    f.e_email.focus();
    return;
 } 

 if(e_addr==''){
    alert('아이디 입력하세요.');
    f.e_addr.value='';
    f.e_addr.focus();
    return;
 } 
 

 if(e_add_addr==''){
     alert('비밀번호를 입력하세요.');
     f.e_add_addr.value='';
     f.e_add_addr.focus();
     return;
 } 
 if(e_tel==''){
     alert('번호를 입력하세요.');
     f.e_tel.value='';
     f.e_tel.focus();
     return;
 }
 

 
 f.action = "insert.do";//MemberInsertAction
 f.submit(); //전송(제출)
 
}


 </script>
</head>
<body>
  <div class="wrapper">
    <div class="container">
      <!-- <div class="sign-up-container">
      </div> -->
      <div class="sign-in-container">

        <form>
          <h1>가게 회원가입</h1>
          <div class="social-links">
            <div>
              <a href="../main/main.do"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
            </div>
          </div>
          <span>Alba-Star-회원가입</span>

          <input type="name" name="e_name" id="e_name" placeholder="이름">

          <input type="email" name="e_email" id="e_email" placeholder="Email"> 

          <input type="id" name="e_id" value="${ param.e_id }" id="e_id" placeholder="아이디 입력">

          <input type="password" name="e_pwd" id="e_pwd" value="${ param.e_pwd }" placeholder="비밀번호 입력">
          <input type="password"  id="e_pwd2" placeholder="비밀번호 다시 입력">

         <input type="addr" name="e_add" id="e_add" placeholder="주소">
          <input type="add_addr" name="e_add_addr" id="e_add_addr" placeholder="나머지주소">
          <input type="tel" name="e_tel" id="e_tel" placeholder="휴대폰번호">

          <button class="form_btn" id="btn_register" disabled="disabled" type="button" onclick="send(this.form);" return false;>회원가입</button>
        </form>
      </div>
    </div>
  </div>
    <script src="../js/login.js"></script>
</body>
</html>
