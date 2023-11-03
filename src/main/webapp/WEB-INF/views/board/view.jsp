<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        table {
            border: 2px solid darkgray; /* 테두리 스타일과 색상 설정 */
            border-collapse: collapse; /* 테두리 겹침 방지 */
        }
    
        table td, table th {
            border: 1px solid darkgray; /* 셀 테두리 스타일과 색상 설정 */
            padding: 8px; /* 셀 안의 내용과 테두리 간격 설정 */
        }
    </style>

    <script>
          function del(b_idx){

            if(confirm("정말 삭제하시겠습니까?")==false)return;

            location.href="delete.do?b_idx="+ b_idx +"&page=${param.page}&search=${param.search}&search_text=${param.search_text}" ; 
}
    </script>

    <script>

        let global_comment_page = 1;

      function comment_insert (){
        //로그인여부 체크
        if("${empty member}"=="true"){
          if(confirm("댓글쓰기는 로그인후 가능합니다\n로그인 하시겟습니까?")==false)return;

          //로그인 폼으로 이동
           location.href="../employee/login_form.do?url=" + encodeURIComponent(location.href);
          return;
        }

        let c_comment = $("#c_comment").val();

        if(c_comment==""){
          alert("댓글내용을 작성하세요");
          $("#c_comment").val("");
          $("#c_comment").focus();
          return;
        }

        //댓글쓰기
        $.ajax({
            url : "comment_insert.do",
            data : {
                    "b_idx"             : "${vo.b_idx}",
                    "c_comment"       :  c_comment ,
                    "e_idx"           : "${member.e_idx}",
                    "e_name"           : "${member.e_name}",
                   },
             dataType : "json",
             success : function(res_data){
              //res_data = {"result" :"success"}
              //res_data = {"result" :"fail"}
                if(res_data.result=="success"){

                  //이전 댓글내용 삭제
                  $("#c_comment").val("");
                  //댓글목록 재요청
                  comment_list(global_comment_page);
                }
             },

             error  : function(err){     
                   alert(err.responseText);
             }
        });

      }

      function comment_list(comment_page){
        
        $.ajax({

            url          : "comment_list.do", // comment_list.do?b_idx=5&page=2
            data         : {
                          "b_idx" : "${vo.b_idx}",
                          "page"  : comment_page       
                          },
            success: function(res_data){
              //댓글영역에 출력
              $("#comment_display").html(res_data);

            },
            error  : function(err){
                  alert(err.responseText);
            }
        });
      }
    </script>

<script>
    //현재 html문서 배치가 완료되면 댓글목록 출력
    $(document).ready(function(){
       comment_list(global_comment_page);
    });

  </script>

<script>
    //게시판 조회
    //let list_url = "view.do?b_idx=${ vo.b_idx }&page=${(empty param.page) ? 1 : param.page}&search=${param.search}&search_text=${param.search_text}"
     
      let global_board_page = "${param.page}";
      //let b_idx ="${param.b_idx}"
      function board_list(board_page){
        
        global_board_page = board_page;
        $.ajax({

            url          : "list_comment.do", // board_view.do?b_idx=5&page=2&search=name&search_text=길동
            data         : { 
                          "b_idx" : "${param.b_idx}"  ,                
                          "page"  : board_page ,
                          "search":    "${param.search}",
                          "search_text":"${param.search_text}" 
                          },
            success: function(res_data){
              //게시판영역에 출력
              $("#board_display").html(res_data);

            },
            error  : function(err){
                  alert(err.responseText);
            }
        });
      }

    </script>

<script>
    //현재 html문서 배치가 완료되면 게시판목록 출력
    $(document).ready(function(){
     
       board_list(global_board_page);
    });

  </script>


</head>
<body>
    <%@ include file="../main/header.jsp" %>
    
    <div class="container mt-5">
        <input type="hidden" value="${vo.b_idx}" id="b_idx">
        
       
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <table class="table">
                    <tr>
                        조회수: ${vo.b_view_cnt}
                    <tr>
                        <td>제목: ${vo.b_title}</td>
                        <td>작성자: ${vo.e_name}</td>
                    </tr>
                    <tr>
                        <td>작성일:${vo.b_create_date}</td>
                        <td>수정일:${vo.b_update_date}</td>
                    </tr>
                </table>
                <div class="form-group">
                    <textarea id="b_contents" name="b_contents" class="form-control" rows="5" disabled >${ vo.b_contents }</textarea>
                </div>
                <br>

                <p> 
                    <c:if test="${ member.e_idx eq vo.e_idx }">
                        <input type="button" value="수정" onclick="location.href='modify_form.do?b_idx=${ vo.b_idx }&page=${param.page}&search=${param.search}&search_text=${param.search_text}'">

                       <input type="button" value="삭제" onclick="del('${vo.b_idx}');">
                    </c:if>
                </p>

            </div>
            
            
        </div>
        
        <!-- <textarea id="c_comment" placeholder="댓글은 로그인후에 작성 가능합니다"></textarea> -->
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <section>
                    <div class="row g-3">
                        <div class="col-md-9">

                            <label for="articleComment" hidden>댓글</label>
                            <textarea class="form-control" id="c_comment" placeholder="댓글은 로그인후에 작성 가능합니다" rows="3"
                                required></textarea>
                        </div>

                        <div class="col-md-3">
                            <!-- <label for="comment-submit" hidden>댓글 쓰기</label> -->
                            <!-- <input id="comment_btn" class="btn btn-primary" type="button" value="댓글쓰기"
                                                            onclick="comment_insert();"> -->
                         <input id="comment_btn1" class="btn btn-primary" type="button" value="댓글쓰기" onclick="comment_insert();">


                        </div>

                    </div>

                    <div id="comment_display"  style="margin-top: 1%;"></div>
                    
                </section>
            </div>
        </div>

        <!-- <div class="row">
            <div class="col-md-8 offset-md-2">
                <ul id="article-comments" class="pt-3">
                    <li>

                        <form>
                            <input hidden class="article-id">
                            <div class="row">
                                <div class="row col-md-10">
                                    <strong>Jyc</strong>
                                    <small>
                                        <time>2022-01-01</time>
                                    </small>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>
                                        Lorem ipsum dolor sit amet
                                    </p>
                                </div>
                            </div>
                        </form>

                    </li>
                </ul>
            </div>
        </div> -->

        <div class="container mt-4">
            <div class="d-flex justify-content-center">
                ${pageMenu}
            </div>
            <div  id="board_display" style="margin-top: 20%;"></div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
