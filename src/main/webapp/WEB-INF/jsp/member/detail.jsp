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
</head>
<body>
<h3>회원상세정보</h3>
ID : <%=bean.getId() %><br/>
PW : <%=bean.getPw() %><br/>
ADDR : <%=bean.getAddr() %><br/>
TEL : <%=bean.getTel() %><br/>
</body>
</html>