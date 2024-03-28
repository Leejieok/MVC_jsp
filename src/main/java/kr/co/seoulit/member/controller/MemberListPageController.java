package kr.co.seoulit.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.seoulit.common.servlet.ModelAndView;
import kr.co.seoulit.common.servlet.mvc.Controller;
import kr.co.seoulit.common.to.ListForm;
import kr.co.seoulit.member.sf.MemberServiceFacade;
import kr.co.seoulit.member.sf.MemberServiceFacadeImpl;
import kr.co.seoulit.member.to.MemberBean;

public class MemberListPageController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		String uri=request.getRequestURI();
		String contextPath=request.getContextPath();
		String viewName=uri.split("[.]")[0].substring(contextPath.length());
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		MemberServiceFacade sf=MemberServiceFacadeImpl.getInstance();
		ListForm listform=new ListForm();
//		listform.setRowsize( Integer.parseInt(request.getParameter("size")) );
		listform.setPagenum( Integer.parseInt(request.getParameter("pn")) );
		listform.setDbcount(sf.getDbcount());
		List<MemberBean> list=sf.getMemberList(
								listform.getStartrow(),
								listform.getEndrow()
								);

		listform.setList(list);
		map.put("listform",listform);
		return new ModelAndView(viewName,map);
	}
}
