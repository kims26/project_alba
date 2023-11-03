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
    
    <script>
        function comment_del(c_b_idx){
           //여기서 삭제처리
           if(confirm("정말 삭제하시겠습니까?")==false)return;
           
           $.ajax({

            url          : "comment_delete.do", // comment_list.do?b_idx=5&page=2
            data         : { "c_b_idx" : c_b_idx},
            dataType     : "json",
            success: function(res_data){          

            if(res_data.result == "success"){
               comment_list(global_comment_page);
            }                
           },
           error  : function(err){
               alert(err.responseText);
           }
    });
}
          
   </script>

</head>
<body>
    
    <c:forEach var="vo" items="${list}">
        <div class="e_name">

            <div class="c_create_date" style="display: flex; justify-content: space-between;">
                <label style="font-size: 14px;">
                    <strong>${vo.e_name}</strong>
                </label>
                ${fn:substring(vo.c_create_date, 0, 16)}
               
            </div>
            
            <div class="c_comment">
               <strong> <textarea class="form-control" rows="3" name="content" readonly style="font-size: 14px;">${vo.c_comment}</textarea></strong>
            </div>
        </div>
    </c:forEach>
    
     

</body>
</html>

<!-- <c:if test="${member.e_idx eq vo.e_idx}">
    <div style="position: absolute; right: 4px; top: 5px;">
        <input type="button" value="X" onclick="comment_del('${vo.c_idx}')" style="width: 25px; height: 25px;">
    </div>
</c:if> -->