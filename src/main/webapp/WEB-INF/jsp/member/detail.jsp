<%@page import="kr.co.seoulit.member.to.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberBean bean=(MemberBean)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.detailContainer {
	margin: 10px 100px 10px 90px;
	width: 200px;
}

.input-container {
	margin-bottom: 10px;
}

.label {
	display: inline-block;
	width: 70px;
	text-align: right;
	margin-right: 10px;
}

.input-field {
	width: 200px;
}
</style>
<link rel="stylesheet" href="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
	<div class="detailContainer">
		<h1 class="display-6">Detailed Information</h1>
		</div>
		<div class="input-container">
			<span class="label">ID :</span> 
			<input class="input-field" name="id" type="text" value="<%=bean.getId()%>">
		</div>
		<br /> 
		<div class="input-container">
			<span class="label">PW :</span> 
			<input class="input-field" name="id" type="text" value="<%=bean.getPw()%>">
		</div>
		<br />
		<div class="input-container">
			<span class="label">ADDR :</span> 
			<input class="input-field" name="id" type="text" value="<%=bean.getAddr()%>">
		</div>
		<br />
		<div class="input-container">
			<span class="label">TEL :</span> 
			<input class="input-field" name="id" type="text" value="<%=bean.getTel()%>">
		</div>
		<br />
</body>
</html>