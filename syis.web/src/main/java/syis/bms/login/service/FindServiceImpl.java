package syis.bms.login.service;

import java.util.List;

import syis.bms.login.dao.LoginDao;
import syis.bms.login.domain.User;

public class FindServiceImpl implements FindService {
	private LoginDao loginDao;

	public FindServiceImpl(LoginDao logindao) {
		this.loginDao = logindao;
	}

	public User findUserPw(String userId, String name, String myNum){
		User user = loginDao.getUserPw(userId,name, myNum); 
		if(user!=null){
			return user;
		}else
			return null;
	}

	public User findIdCheck(String name, String myNum){
		return loginDao.getUserId(name, myNum);
	}
	public List<User> userList(){
		return loginDao.userList();
	}
}
