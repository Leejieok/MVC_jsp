package kr.co.seoulit.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.seoulit.common.servlet.ModelAndView;
import kr.co.seoulit.common.servlet.mvc.Controller;
import kr.co.seoulit.member.sf.MemberServiceFacade;
import kr.co.seoulit.member.sf.MemberServiceFacadeImpl;
import kr.co.seoulit.member.to.MemberBean;
import net.sf.json.JSONObject;

public class MemberAjaxListController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		JSONObject json=new JSONObject();

	 	try {		
			MemberServiceFacade sf=MemberServiceFacadeImpl.getInstance();
			List<MemberBean> list=sf.getMemberList();
	 		 json.put("memberlist",list);
	 		 json.put("errorCode", 0);
	 		 json.put("errorMsg", "success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			 json.put("errorCode", -1);
			 json.put("errorMsg", e.getMessage());
		}	
	 	PrintWriter out=response.getWriter();
	 	out.write(json.toString());
		return null;
	}
}
