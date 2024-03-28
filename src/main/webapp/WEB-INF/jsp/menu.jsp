<%@page import="kr.co.seoulit.member.to.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MemberBean bean=(MemberBean)request.getAttribute("member");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
	.divContainer{
		margin: 10px 100px 10px 10px;
		width: 250px;
	}
	.titleContainer{
		margin-top: 20px;
		margin-left: 10px;
	}
</style>
<script>
 window.onload=function(){}
 function f(){
	 $.ajax({
		 url:"<%=request.getContextPath()%>/member/ajaxlist.do",
		 dataType:"json",
		 success:function(obj){
			 let initialHtml='';
			 const buffer=["<button type='button'class=btn-close aria-label='Close'></button>","<ol>"];
			 obj.memberlist.forEach(member=>buffer.push("<li>"+member.id+"</li>"))
			 buffer.push("</ol>");
			 $('#listContainer').html(buffer.join(""));
			 
			 $('.btn-close').on('click', function(){
						$('#listContainer').html(initialHtml); 
					 });
		 }
	 });
 }

 </script>
</head>
<body>
	<div class="titleContainer">
		<figure>
		<blockquote class="blockquote">
			<p>회원가입 기능 구현해보기</p>
		</blockquote>
		<figcaption class="blockquote-footer"> <cite
			title="Source Title"> Join, List, Update, Delete</cite> </figcaption> </figure>
	</div>
	<div class="divContainer">
		<div class="innerdivContainer">
			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action active"
					aria-current="true"> click menu </a> 
					<a href="#" class="list-group-item list-group-item-action"
					onclick="location.href='<%=request.getContextPath()%>/member/list.do'">회원리스트</a>
				<a href="#" class="list-group-item list-group-item-action"
					onclick="f()">회원리스트(AJAX)</a>
				<div id="listContainer"></div>
				<a href="#" class="list-group-item list-group-item-action" 
					onclick="location.href='<%=request.getContextPath()%>/member/list-page1.do?pn=1' ">회원리스트(페이지달기)</a>
				<a href="#" class="list-group-item list-group-item-action" 
					onclick="location.href='<%=request.getContextPath()%>/member/list-page2.do?pn=1' ">회원리스트(bootstrap)</a>
				<a href="#" class="list-group-item list-group-item-action"
					onclick="location.href='<%=request.getContextPath()%>/addForm.html'">
					회원가입</a> <a href="#" class="list-group-item list-group-item-action"
					onclick="location.href='<%=request.getContextPath()%>/member/loginForm.html'">
					로그인</a>
			</div>
		</div>
	</div>
</body>
</html>



