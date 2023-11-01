<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사장님 로그인 폼</title>

    <!-- <link rel="stylesheet" type="text/css" href="../login_css/insert.css"> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    

    
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   
   <script type="text/javascript">

function send(f){
        
        //입력항목 체크(이름/비번/우편번호/주소)
        var o_name 		= f.o_name.value.trim();
        var o_email 	= f.o_email.value.trim();

        var o_id        = f.o_id.value.trim();
        var o_pwd		= f.o_pwd.value.trim();

        var reg_id = /^[A-Za-z]{4,10}$/;
	      var reg_pwd = /^[A-Za-z0-9]{6,12}$/;

        var o_addr 		= f.o_addr.value.trim();
        var o_add_addr 		= f.o_addr.value.trim();
        var o_tel 	    = f.o_tel.value.trim();
       
      
        
        if(o_name==''){
            alert('이름을 입력하세요!!');
            f.o_name.value='';
            f.o_name.focus();
            return false;
        }

        if(o_email==''){
            alert('이메일을 입력하세요!!');
            f.o_email.value='';
            f.o_email.focus();
            return false;
        }


        if(o_id==''){
            alert('아이디를 입력하세요!!');
            f.o_id.value='';
            f.o_id.focus();
            return false;
        }
        if(!reg_id.test(o_id.value)){
          alert('아이디는 영문(소문자) 4~10자리로 입력해주세요.');
          f.o_id.value='';
          f.o_id.focus();
          return;
        }

        
        if(o_pwd==''){
            alert('비밀번호를 입력하세요!!');
            f.o_pwd.value='';
            f.o_pwd.focus();
            return false;
        }
        if(!reg_pwd.test(o_pwd.vlaue)){
          alert('비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.');
          f.o_pwd.value='';
          f.o_pwd.focus();
          return;
        }
        
        if(o_addr==''){
            alert('주소를 입력하세요!!');
            f.o_addr.value='';
            f.o_addr.focus();
            return false;
        }	 
         
        if(o_add_addr==''){
            alert('나머지 주소를 입력하세요!!');
            f.o_add_addr.value='';
            f.o_add_addr.focus();
            return false;
        }	 
        if(o_tel==''){
            alert('번호를 입력하세요!!');
            f.o_tel.value='';
            f.o_tel.focus();
            return false;
        }	 
        if(o_storee==''){
            alert('가게를 입력하세요!!');
            f.o_storee.value='';
            f.o_storee.focus();
            return false;
        }	 
        f.action = "insert.do";//MemberInsertAction
        f.submit(); //전송(제출)
        
    }

      function check_o_id(){

      var o_id = $("#o_id").val();
      var regExp = /^[A-Za-z]{4,10}$/;


      if(regExp.test(mem_id)==false){
        
        $("#id_message").html("*영문(소문자) 4~10자리로 입력해주세요.")
                        .css("color","red");
        
        //회원가입버튼 비활성화
        $("#btn_register").attr("disabled",true);//비활성화
        
        return;
      }


      //서버 : 아이디 중복체크
      $.ajax({
        
        url		:	"check_o_id.do",  		
        data		:	{"o_id" : o_id },	
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

      function check_o_pwd(){

        var o_pwd = $("#o_pwd").val();
        // var regExp = /^[A-Za-z]{4,10}$/;
        // var regExp = /^[A-Za-z0-9]{6,12}$/;

        // var regExp1 = /[^a-z0-9]+|^([a-z]+|[0-9]+){6,12}$/i;
        var regExp1 =/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{6,12}$/i;
        // var regExp1 = /^([a-z][0-9][a-z0-9]*|[0-9][a-z][a-z0-9]*){6,12}$/i;



        if(regExp1.test(o_pwd)==false){
          
          $("#pwd_message").html("*비밀번호는 영문, 숫자를 혼용하여 6~12자리로 입력해주세요.")
                  .css("color","red");
          
          //회원가입버튼 비활성화
          $("#btn_register").attr("disabled",true);//비활성화
          
          return;
        }


        //서버 : pwd 중복체크
        $.ajax({
          
          url		:	"check_pwd.do",  		
          data		:	{"o_pwd" : o_pwd },	
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
    
  
    <button class="form_btn" id="btn_register" disabled="disabled" type="button" onclick="send(this.form)"return false;>회원가입</button>
</form>
    <!-- <script src="../js/login.js"></script> -->
</body>
</html>



