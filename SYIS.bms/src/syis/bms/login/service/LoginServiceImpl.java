package syis.bms.login.service;

import syis.bms.login.dao.LoginDao;
import syis.bms.login.domain.User;

public class LoginServiceImpl implements LoginService {
	private	LoginDao loginDao;
	
	public LoginServiceImpl(LoginDao loginDao) {
		this.loginDao = loginDao;
	}
	public User findUser(String userId){
		return loginDao.getUser(userId);
	}
	
	public boolean loginCheck(String id, String pw) {
		User user = loginDao.getUser(id); //loginDao.getUser메서드 실행으로 id값과 같은 유저객체를 찾고 
										  //찾으면 찾은 유지객체를 대입 못찾으면 null을 대입
		if(user == null) {                //null이면 못찾았다는 거니까 false 실패 값 리턴
			return false;
		}else {
			return user.getPassword().equals(pw); //찾은 아이디에 pw까지 같으면 로그인 성공으로 true값 리턴
		}
	}
}
