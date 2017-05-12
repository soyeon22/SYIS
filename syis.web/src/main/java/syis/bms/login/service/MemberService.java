package syis.bms.login.service;

import java.util.List;

import syis.bms.login.domain.User;
import syis.bms.paging.domain.Page;

public interface MemberService {
	List<User> memberListPage(Page page);
}
