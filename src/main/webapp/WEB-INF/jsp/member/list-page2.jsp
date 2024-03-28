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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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
		int pagesize=5;  //화면에 보여질 페이지갯수
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
		<tr>
			<td><%=num++%></td>
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
 %>
 <script>
 	let path = '<%= path %>';
	let pagenum=<%=pagenum%>;
	let startpage=<%=startpage%>;
	let endpage=<%=endpage%>;
	$(document).ready(function(){
        $(".pagination .page-item").click(function(){
            $(".pagination .page-item").each(function(){
                this.classList.remove("active");
            });
            this.classList.add("active");
        });
    });
	function showPagenum(sp,ep, pagenum){
        for(let a=sp; a<=ep; a++){  
        	document.write(
        		    '<li class="page-item ' + (a == pagenum ? 'active' : '') + '">' +
        		    '<a class="page-link" href="' + path + '/member/list-page2.do?pn='+a+'">' + a + '</a>' +
        		    '</li>'
        		);
    }
    }
</script>
	<nav aria-label="...">
		<ul class="pagination">

			<li class='page-item'><a class='page-link'
				href='<%= path %>/member/list-page2.do?pn=<%= pagenum-1%>'>◀</a></li>
			<script>
			showPagenum(<%=startpage%>,<%=endpage%>,<%=pagenum%>);
			</script>
			<li class="page-item"><a class="page-link"
				href="<%= path %>/member/list-page2.do?pn=<%= pagenum+1%>">▶</a></li>

		</ul>
	</nav>
</body>
</html>