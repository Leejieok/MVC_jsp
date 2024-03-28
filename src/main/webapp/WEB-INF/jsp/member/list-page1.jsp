<%@page import="kr.co.seoulit.common.to.ListForm"%>
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
<body>
<h3>회원목록</h3>
<table>
    <%
		String path=request.getContextPath();

    
    	int startrow=1;  //보여지는 화면의 첫번째줄
    	int endrow=1;  //보여지는 화면의 끝줄
    	int pagenum=1;  //현재페이지번호
    	int rowsize=3;  //화면에 보여질 줄갯수
    	int startpage=1; //시작페이지 
    	int endpage=1;  //끝페이지
    	int pagesize=2;  //화면에 보여질 페이지갯수
    	int pagecount=0; //총페이지갯수
    	int dbcount=0;  //총레코드갯수  

    	ListForm listform = (ListForm) request.getAttribute("listform");
    	dbcount=listform.getDbcount();
                  
    	if(request.getParameter("pn")!=null)
    	pagenum=Integer.parseInt(request.getParameter("pn"));
                 
    	startrow=listform.getStartrow(); 
    	endrow= listform.getEndrow(); 
    	
    	int num=startrow;
    	
    	List<MemberBean> list = (List<MemberBean>) listform.getList();
		for (MemberBean member : list) {
    %>
 <tr><td><%=num++%></td>
 <td><%=member.getId()%></td>
 <td><%=member.getPw()%></td>
 <td><%=member.getAddr()%></td>
 <td><%=member.getTel()%></td>
 </tr>

<% } %>
</table>
<%
 pagecount=listform.getPagecount();
 startpage=listform.getStartpage();
 endpage= listform.getEndpage();
 if(startpage-pagesize>0){  
%> 
  <a href="<%= path %>/member/list-page1.do?pn=<%=pagenum-1%>">◀</a>
<%
 }
 
 for(int n=startpage; n<=endpage; n++){      
     
%>
  <a href="<%= path %>/member/list-page1.do?pn=<%=n%>"><%=n%>&nbsp;</a>
<%
  if(n==pagecount) break;
 }

 if(startpage+pagesize<=pagecount){
%>
  <a href="<%= path %>/member/list-page1.do?pn=<%=pagenum+1%>' ">▶</a>

<%
 }
%>
</body>
</html>