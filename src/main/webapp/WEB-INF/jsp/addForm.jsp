<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 <script>
 window.onload=function(){}
 function f(){
	 let id = $('#id').val();
	 let url= '<%=request.getContextPath()%>/member/idcheck.do?id='+encodeURIComponent(id);
	 $.ajax({
		 url:url,
		 dataType:"json",
		 success:function(obj){
			 if(obj.msg != null)
			 $('#checkIdContainer').text(obj.msg);
		 }
	 });
 }
 
 </script>
</head>
<body>
<h1>회원가입폼</h1>
<form>
ID <input type="text" name="id" id="id"/>
<input type="button" onclick="f()" value="ID중복확인" />
<a id="checkIdContainer"></a><br/> 
PW <input type="text" name="pw"/> <br/>
ADDR <input type="text" name="addr"/> <br/>
TEL <input type="text" name="tel"/> <br/>
<button onclick="this.form.aciton='<%=request.getContextPath()%>/member/add.do'">가입</button>
</form>
</body>
</html>