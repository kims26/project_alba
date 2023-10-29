<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>직원 로그인 폼</title>

    <!-- <link rel="stylesheet" type="text/css" href="../login_css/insert.css"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    

    
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">

function send(f){
        
        //입력항목 체크(이름/비번/우편번호/주소)
        var e_name 		= f.e_name.value.trim();
        var e_email 	= f.e_email.value.trim();

        var e_id        = f.e_id.value.trim();
        var e_pwd		= f.e_pwd.value.trim();

        var reg_id = /^[A-Za-z]{4,10}$/;
	      var reg_pwd = /^[A-Za-z0-9]{6,12}$/;

        var e_addr 		= f.e_addr.value.trim();
        var e_add_addr 		= f.e_add_addr.value.trim();
        var e_tel 	    = f.e_tel.value.trim();
       
      
        
        if(e_name==''){
            alert('이름을 입력하세요!!');
            f.e_name.value='';
            f.e_name.focus();
            return false;
        }

        if(e_email==''){
            alert('이메일을 입력하세요!!');
            f.e_email.value='';
            f.e_email.focus();
            return false;
        }


        if(e_id==''){
            alert('아이디를 입력하세요!!');
            f.e_id.value='';
            f.e_id.focus();
            return false;
        }
        if(!reg_id.test(e_id.value)){
          alert('아이디는 영문(소문자) 4~10자리로 입력해주세요.');
          f.e_id.value='';
          f.e_id.focus();
          return;
        }

        
        if(e_pwd==''){
            alert('비밀번호를 입력하세요!!');
            f.e_pwd.value='';
            f.e_pwd.focus();
            return false;
        }
        if(!reg_pwd.test(e_pwd.vlaue)){
          alert('비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.');
          f.e_pwd.value='';
          f.e_pwd.focus();
          return;
        }
        
        if(e_addr==''){
            alert('주소를 입력하세요!!');
            f.e_addr.value='';
            f.e_addr.focus();
            return false;
        }	 
         
        if(e_add_addr==''){
            alert('나머지 주소를 입력하세요!!');
            f.e_add_addr.value='';
            f.e_add_addr.focus();
            return false;
        }	 
        if(e_tel==''){
            alert('번호를 입력하세요!!');
            f.e_tel.value='';
            f.e_tel.focus();
            return false;
        }	 
        if(e_storee==''){
            alert('가게를 입력하세요!!');
            f.e_storee.value='';
            f.e_storee.focus();
            return false;
        }	 
        f.action = "insert.do";//MemberInsertAction
        f.submit(); //전송(제출)
        
    }

      function check_e_id(){

      var e_id = $("#e_id").val();
      var regExp = /^[A-Za-z]{4,10}$/;


      if(regExp.test(e_id)==false){
        
        $("#id_message").html("*영문(소문자) 4~10자리로 입력해주세요.")
                        .css("color","red");
        
        //회원가입버튼 비활성화
        $("#btn_register").attr("disabled",true);//비활성화
        
        return;
      }


      //서버 : 아이디 중복체크
      $.ajax({
        
        url		:	"check_e_id.do",  		
        data		:	{"e_id" : e_id },	
        dataType	:	"json",
        success	:	function(res_data){
          if(res_data.result==true){
          
            $("#id_message").html("사용가능한 아이디 입니다.")
                                    .css("color","blue");
            
            //회원가입버튼 활성화
            $("#btn_register").attr("disabled",false);//활성화
            
          }else{
            
            $("#id_message").html("이미 사용중인 아이디 입니다.")
                                    .css("color","red");
            //회원가입버튼 비활성화
            $("#btn_register").attr("disabled",true);//비활성화
          }
          
          
        },
        error		:	function(err){
          
          alert(err.responseText);
          
        }
      });

      }//end:check_id()

      function check_e_pwd(){

        var e_pwd = $("#e_pwd").val();
        // var regExp = /^[A-Za-z]{4,10}$/;
        // var regExp = /^[A-Za-z0-9]{6,12}$/;

        // var regExp1 = /[^a-z0-9]+|^([a-z]+|[0-9]+){6,12}$/i;
        var regExp1 =/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/i;
        // var regExp1 = /^([a-z][0-9][a-z0-9]*|[0-9][a-z][a-z0-9]*){6,12}$/i;



        if(regExp1.test(e_pwd)==false){
          
          $("#pwd_message").html("*비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.")
                  .css("color","red");
          
          //회원가입버튼 비활성화
          $("#btn_register").attr("disabled",true);//비활성화
          
          return;
        }


        //서버 : pwd 중복체크
        $.ajax({
          
          url		:	"check_pwd.do",  		
          data		:	{"e_pwd" : e_pwd },	
          dataType	:	"json",
          success	:	function(res_data){
            if(res_data.result==true){
              
              $("#pwd_message").html("사용가능한 비밀번호 입니다.")
                      .css("color","blue");
              
              //회원가입버튼 활성화
              $("#btn_register").attr("disabled",false);//활성화
              
            }else{
              
              $("#pwd_message").html("이미 사용중인 비밀번호 입니다.")
                      .css("color","red");
              //회원가입버튼 비활성화
              $("#btn_register").attr("disabled",true);//비활성화
            }
            
            
          },
          error		:	function(err){
            
            alert(err.responseText);
            
          }
        });

        }//end:check_id()
      
      
       </script>
    
</head>

<body>

  <form class="form-inline" id="createform" name="form1" method="POST">
    <h1>회원가입</h1>
    
    <!-- 입력 필드 예시 (사용자의 필요에 따라 추가/수정) -->
    <input type="text" name="e_name" id="e_name" placeholder="이름">
    <input type="text" name="e_email" id="e_email" placeholder="이메일">
    <input type="text" name="e_id" id="e_id" placeholder="아이디">
    <input type="password" name="e_pwd" id="e_pwd" placeholder="비밀번호">
    <input type="text" name="e_addr" id="e_addr" placeholder="주소">
    <input type="text" name="e_add_addr" id="e_add_addr" placeholder="나머지 주소">
    <input type="text" name="e_tel" id="e_tel" placeholder="전화번호">
    <!-- <input type="text" name="e_storee" id="o_storee" placeholder="가게이름"> -->
    
    <!-- 회원가입 버튼 -->
    <button class="form_btn" id="btn_register" disabled="disabled" type="button" onclick="send(this.form)"return false;>회원가입</button>
</form>
    <!-- <script src="../js/login.js"></script> -->
</body>
</html>



