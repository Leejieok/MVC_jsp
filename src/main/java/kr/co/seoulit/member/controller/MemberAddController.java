package kr.co.seoulit.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.seoulit.common.servlet.ModelAndView;
import kr.co.seoulit.common.servlet.mvc.Controller;
import kr.co.seoulit.member.sf.MemberServiceFacade;
import kr.co.seoulit.member.sf.MemberServiceFacadeImpl;
import kr.co.seoulit.member.to.MemberBean;

public class MemberAddController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response){
		// TODO Auto-generated method stub
		 HashMap<String,Object> map=new HashMap<String,Object>();
		ModelAndView mav=null;
	 	try {		
	 		MemberBean member=new MemberBean();
	 		member.setId(request.getParameter("id"));
	 		member.setPw(request.getParameter("pw"));
	 		member.setAddr(request.getParameter("addr"));
	 		member.setTel(request.getParameter("tel"));
			MemberServiceFacade sf=MemberServiceFacadeImpl.getInstance();
			sf.addMember(member);
			String contextPath=request.getContextPath();
			mav=new ModelAndView("redirect:"+contextPath+"/member/list.do",null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
	 		 map.put("errorCode", -1);
	 		 map.put("errorMsg", e.getMessage());
	 		 mav=new ModelAndView("error",map);
		}	
		return mav;
	}
}
