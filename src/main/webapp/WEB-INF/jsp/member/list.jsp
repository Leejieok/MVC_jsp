<%@page import="kr.co.seoulit.member.to.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String contextPath = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
.listContainer{
		margin: 10px 100px 10px 10px;
		width: 200px;
	}
</style>
</head>

<body>
	<div class="listContainer">
	<button type="button" class="btn btn-outline-primary" onclick="location.href='<%=contextPath%>/menu.html'">Menu</button>
	<br />
	<form action="<%=contextPath%>/member/updateForm.do">
		<%
		List<MemberBean> list = (List<MemberBean>) request.getAttribute("memberlist");
		for (MemberBean bean : list) {
			String id = bean.getId();
			out.print("<input type=radio name='id' value=" + id + ">");
			out.print("<a href='" + contextPath + "/member/detail.do?id=" + id + "' onclick=f(this)>");
			out.print(id);
			out.print("</a><br/>");
		}
		%>
		<button type="submit" class="btn btn-primary btn-sm" >수정</button>
		<button type="submit" class="btn btn-primary btn-sm" onclick="this.form.action='<%=contextPath%>/member/remove.do'">삭제</button>
	</form>
	</div>
</body>
</html>