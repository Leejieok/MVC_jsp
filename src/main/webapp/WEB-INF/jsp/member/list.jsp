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
 <script>
 window.onload=function(){}
 </script>
</head>
<body>
<a href="<%=contextPath%>/menu.html">메뉴</a><br/>
<form action="<%=contextPath%>/member/updateForm.do">
	<%
	List<MemberBean> list = (List<MemberBean>) request.getAttribute("memberlist");
	for (MemberBean bean : list) {
		String id = bean.getId();
		out.print("<input type=radio name='id' value="+id+">");
		out.print("<a href='" + contextPath + "/member/detail.do?id=" + id + "' onclick=f(this)>");
		out.print(id);
		out.print("</a><br/>");
	}
	%>
<button>수정</button>
<button onclick="this.form.action='<%=contextPath%>/member/remove.do'">삭제</button>
</form>
</body>
</html>