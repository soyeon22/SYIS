package syis.bms.login.service;

import java.util.List;

import syis.bms.login.dao.LoginDao;
import syis.bms.login.domain.User;
import syis.bms.paging.domain.Page;

public class MemberServiceImpl implements MemberService{
	private LoginDao loginDao;
	
	public MemberServiceImpl(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	
	public List<User> memberListPage(Page page){
		return loginDao.userListPage(page);
	}

}
