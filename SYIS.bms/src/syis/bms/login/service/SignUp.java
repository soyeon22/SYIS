package syis.bms.login.service;

import java.util.List;

import syis.bms.login.domain.User;

public interface SignUp {
	User findUser(String userId);
	boolean join(User user);
	boolean modifyUser(User user);
	List<User> userList();
	boolean deleteUser(User user);
}
