package syis.bms.query.dao;

import java.util.List;

import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;
import syis.bms.query.domain.Query;

public interface QueryDao {
	List<Query> queryList(Page page);
	Query getQueryNum(int boardNum);
	List<Query> getQueryId(String userId);
	int updateQuery(Query query);
	int updateQueryAnswer(Query query);
	int addQuery(Query query);
	public int delQuery(int boardNum);
}
