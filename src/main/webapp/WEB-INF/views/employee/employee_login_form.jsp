<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원 로그인 폼</title>

    <link rel="stylesheet" type="text/css" href="../login_css/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">

    <link rel="stylesheet" href="../headercss/header.css">

    <script type="text/javascript">
   
      function send(f){
        
        var e_id	= f.e_id.value.trim();
        var e_pwd	= f.e_pwd.value.trim();
        
        if(e_id==''){
          
          alert('아이디를 입력하세요');
          f.e_id.value='';
          f.e_id.focus();
          return;
        }
        
        if(e_pwd==''){
          
          alert('비밀번호를 입력하세요');
          f.e_pwd.value='';
          f.e_pwd.focus();
          return;
        }
        
        //전송
        f.action = "login.do";//MemberLoginAction
        f.submit();
        
      }
   </script>

<script type="text/javascript">
    
  //jQuery초기화 이벤트
  $(document).ready(function(){
      
      // 0.1초후에 호출 : 로그인폼 show된후에 호출
      setTimeout(show_message,100);
      //show_message();
      
  });
  
  function show_message(){

      
      //login_form.do?reason=fail_id
      if("${ param.reason eq 'fail_id' }" == "true"){
          alert('아이디가 없습니다.'); 
      }
      
      //login_form.do?reason=fail_pwd
      if("${ param.reason eq 'fail_pwd' }" == "true"){
          alert('비밀번호가 틀렸습니다.'); 
      }		   
      
      //login_form.do?reason=fail_session_timeout
      if("${ param.reason eq 'fail_session_timeout' }" == "true"){
              alert('로그아웃되었습니다\n로그인후에 이용하세요.'); 
      }		   
      
  }
  
  
</script>
</head>
<body>
    <div class="wrapper">

        <div class="container1">

          <div class="sign-in-container">

            <form action="login.do">
              <h1>직원 로그인</h1>
              <div class="social-links">
                <div>
                    <a href="../main/main.do"><i class="fa fa-arrow-left" aria-hidden="true"></i></a>
                </div>
                <div>
                    <a href="../employee/insert_form.do"><i class="fa fa-plus" aria-hidden="true"></i></a>
                </div>
              </div>
              <span>LOG-IN</span>
              <input type="text" name="e_id" value="${ param.e_id }" id="e_id" class="input_text" placeholder="아이디를 입력하세요.">
              <input type="password" name="e_pwd" value="${ param.e_pwd }" id="e_pwd" class="input_text enterMaster" placeholder="비밀번호를 입력하세요.">
    

              <button class="form_btn" type="submit" id="login_btn" onclick="send(this.form); return false;">직원로그인</button>

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
