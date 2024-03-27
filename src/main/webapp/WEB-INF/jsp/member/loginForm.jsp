<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
function f(){
	let id=$('#id').val();
	let pw=$('#pw').val();
	
	let url='<%=request.getContextPath()%>/member/loginForm.do?id='+id+'&pw='+pw;
	console.log(url)
	$.ajax({
		url:url, 
		dataType:"json",
		success:function(obj){
			$('#loginMsg').text(obj.msg);
			console.log(obj)
		}
	});
}
</script>
</head>
<body>
<h1>로그인</h1>
<form>
ID <input type="text" id="id"/> <br/>
PW <input type="text" id="pw"/> <br/>
<input type="button" onclick="f()" value="로그인">
<a id="loginMsg"></a><br/> 
<a href="<%=request.getContextPath()%>/menu.html">메뉴</a><br/>
</form>
</body>
</html>