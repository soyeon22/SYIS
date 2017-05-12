package syis.bms.login.service;

import java.util.List;

import syis.bms.login.dao.LoginDao;
import syis.bms.login.domain.User;

public class SignUpImpl implements SignUp{
	private LoginDao dao;

	public SignUpImpl(LoginDao dao){
		this.dao=dao;
	}
	public User findUser(String userId){
		return dao.getUser(userId);
	}
	public boolean join(User user){
		 return dao.addUser(user)>0;
	 }
	public boolean modifyUser(User user){
		return dao.updateUser(user)>0;
	}
	public List<User> userList(){
		return dao.userList();
	}
	public boolean deleteUser(User user){
		return dao.delUser(user)>0;
	}
}
