package syis.bms.query.dao.mapper;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.query.domain.Query;

public interface QueryMapper {
	List<Query> queryList(Page page);
	Query getQueryNum(int boardNum);
	List<Query> getQueryId(String userId);
	int updateQuery(Query query);
	int updateQueryAnswer(Query query);
	int addQuery(Query query);
	int delQuery(int boardNum);
}
