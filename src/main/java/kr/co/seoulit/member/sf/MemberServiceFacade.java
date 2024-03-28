package kr.co.seoulit.member.sf;

import java.util.List;
import kr.co.seoulit.member.to.MemberBean;

public interface MemberServiceFacade {
	public List<MemberBean> getMemberList();
	public MemberBean getMember(String id);
	public void addMember(MemberBean member);
	public MemberBean checkId(String id);
	public MemberBean login(String id, String pw);
	public void changeMember(MemberBean member);
	public void unenrollmentmember(String id);
	public int getDbcount();
	public List<MemberBean> getMemberList(int sr,int er);
}

