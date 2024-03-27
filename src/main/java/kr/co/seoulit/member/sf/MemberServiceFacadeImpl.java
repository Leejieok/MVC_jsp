package kr.co.seoulit.member.sf;

import java.util.List;
import kr.co.seoulit.member.dao.MemberDAOImpl;
import kr.co.seoulit.member.to.MemberBean;

public class MemberServiceFacadeImpl implements MemberServiceFacade{
	private static MemberServiceFacade instance=new MemberServiceFacadeImpl();
	public static MemberServiceFacade getInstance(){
		return instance;
	}
	@Override
	public List<MemberBean> getMemberList() {
		// TODO Auto-generated method stub
		return MemberDAOImpl.getInstance().selectMemberList();
	}
	@Override
	public void addMember(MemberBean member) {
		// TODO Auto-generated method stub
		MemberDAOImpl.getInstance().insertMember(member);		
	}
	@Override
	public MemberBean getMember(String id) {
		// TODO Auto-generated method stub
		return MemberDAOImpl.getInstance().selectMember(id);
	}
	@Override
	public MemberBean checkId(String id) {
		// TODO Auto-generated method stub
		MemberBean bean=MemberDAOImpl.getInstance().selectMember(id);
		if(bean == null) return null;
		else {return bean;}
	}
	@Override
	public MemberBean login(String id, String pw) {
		// TODO Auto-generated method stub
		MemberBean bean=MemberDAOImpl.getInstance().selectMember(id);
		if(bean == null) return null;
		else if( bean.getPw().equals(pw))return bean;
		else return null;
	}
	@Override
	public void changeMember(MemberBean member) {
		// TODO Auto-generated method stub
		MemberDAOImpl.getInstance().updateMember(member);
	}
	@Override
	public void unenrollmentmember(String id) {
		// TODO Auto-generated method stub
		MemberDAOImpl.getInstance().deleteMember(id);
	}
}
