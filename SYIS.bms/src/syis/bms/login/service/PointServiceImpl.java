package syis.bms.login.service;

import syis.bms.login.dao.LoginDao;
import syis.bms.login.domain.User;

public class PointServiceImpl implements PointService{
	private LoginDao loginDao;

	public PointServiceImpl(LoginDao logindao) {
		this.loginDao = logindao;
	}
	
	public boolean updatePoint(User user){
		return loginDao.updatePoint(user)>0;
	}
}
