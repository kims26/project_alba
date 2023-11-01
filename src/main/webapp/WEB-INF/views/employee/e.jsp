<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
  .register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 9%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 100%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 150%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}
</style>

</head>

<body>
  <div class="container register">
    <div class="row">
        <div class="col-md-3 register-left">
            <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
            <h3>Welcome</h3>
            <p>ALBA-STAR 회원가입!</p>
            <input type="submit" name="" value="Login"/><br/>
        </div>
        <div class="col-md-9 register-right">
            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">

                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="../owner/insert_form.do" role="tab" aria-controls="home" aria-selected="true">가게</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="../employee/insert_form.do" role="tab" aria-controls="profile" aria-selected="false">직원</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <h3 class="register-heading">Apply as a Employee</h3>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="First Name *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Last Name *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control"  placeholder="Confirm Password *" value="" />
                            </div>
                            <div class="form-group">
                                <div class="maxl">
                                    <label class="radio inline"> 
                                        <input type="radio" name="gender" value="male" checked>
                                        <span> Male </span> 
                                    </label>
                                    <label class="radio inline"> 
                                        <input type="radio" name="gender" value="female">
                                        <span>Female </span> 
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Your Email *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" minlength="10" maxlength="10" name="txtEmpPhone" class="form-control" placeholder="Your Phone *" value="" />
                            </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                    <option>What is your Birthdate?</option>
                                    <option>What is Your old Phone Number</option>
                                    <option>What is your Pet Name?</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Your Answer *" value="" />
                            </div>
                            <input type="submit" class="btnRegister"  value="Register"/>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <h3  class="register-heading">Apply as a Hirer</h3>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="First Name *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Last Name *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                            </div>


                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password *" value="" />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                            </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                    <option>What is your Birthdate?</option>
                                    <option>What is Your old Phone Number</option>
                                    <option>What is your Pet Name?</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="`Answer *" value="" />
                            </div>
                            <input type="submit" class="btnRegister"  value="Register"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>


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



