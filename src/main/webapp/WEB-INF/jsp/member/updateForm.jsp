<%@page import="kr.co.seoulit.member.to.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
MemberBean bean=(MemberBean)request.getAttribute("member");
%>
<body>
<h3>회원정보 수정</h3>
<form action="<%=request.getContextPath() %>/member/update.do">
ID : <input type="text" value="<%=bean.getId()%>" name=id><br/>
PW : <input type="text" value="<%=bean.getPw()%>" name=pw><br/>
ADDR : <input type="text" value="<%=bean.getAddr()%>" name=addr><br/>
TEL : <input type="text" value="<%=bean.getTel()%>" name=tel><br/>
<input type="reset" value="취소" />
<button>수정</button>
</form>
</body>
</html>