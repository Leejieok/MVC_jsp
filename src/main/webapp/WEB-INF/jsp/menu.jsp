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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
 <script>
 window.onload=function(){}
 function f(){
	 $.ajax({
		 url:"<%=request.getContextPath()%>/member/ajaxlist.do",
		 dataType:"json",
		 success:function(obj){
			 const buffer=["<ol>"];
			 obj.memberlist.forEach(member=>buffer.push("<li>"+member.id+"</li>"))
			 buffer.push("</ol>");
			 $('#listContainer').html(buffer.join(""));
		 }
	 });
 }
 
 </script>
</head>
<body>
<h1>:: 메뉴 ::</h1>
<a href="<%=request.getContextPath()%>/member/list.do">회원리스트</a><br/>
<a href="#" onclick="f()">회원리스트(AJAX)</a><br/>
<div id="listContainer"></div>
<button 
	onclick="location.href='<%=request.getContextPath()%>/addForm.html'">
	회원가입</button>
<button 
	onclick="location.href='<%=request.getContextPath()%>/member/loginForm.html'">
	로그인</button>
</body>
</html>



