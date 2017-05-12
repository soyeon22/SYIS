package syis.bms.login.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import syis.bms.login.domain.User;
import syis.bms.paging.domain.Page;

public interface LoginMapper {
	User getUser(String id); //아이디 값과 같은 유저객체를 찾음 이게 실행되면 loginMapper.xml 파일에 있는 메서드 실행
	User getUserId(@Param("name")String name, @Param("myNum") String myNum);
	User getUserPw(@Param("userId")String userId, @Param("name")String name, @Param("myNum")String myNum);
	int updatePoint(User user);
	int addUser(User user);
	int updateUser(User user);
	List<User> userList();
	List<User> userListPage(Page page);
	int delUser(User user);
}
