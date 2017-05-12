package syis.bms.login.dao;

import java.util.List;

import syis.bms.login.dao.mapper.LoginMapper;
import syis.bms.login.domain.User;
import syis.bms.paging.domain.Page;

public class LoginDaoImpl implements LoginDao {
	
	private LoginMapper loginMapper;
	
	public LoginDaoImpl(){}
	
	public LoginDaoImpl(LoginMapper loginMapper){
		this.loginMapper = loginMapper;
	}
	
	public User getUser(String id) { 
		return loginMapper.getUser(id);
	}
	public User getUserId(String name, String myNum){
		return loginMapper.getUserId(name, myNum);
	}
	public User getUserPw(String userId, String name, String myNum){
		return loginMapper.getUserPw(userId, name, myNum);
	}
	public int addUser(User user){
		return loginMapper.addUser(user);
	}
	public int updateUser(User user){
		return loginMapper.updateUser(user);
	}
	public List<User> userList(){
		return loginMapper.userList();
	}
	public int updatePoint(User user){
		return loginMapper.updatePoint(user);
	}
	public List<User> userListPage(Page page){
		return loginMapper.userListPage(page);
	}
	public int delUser(User user){
		return loginMapper.delUser(user);
	}
}
