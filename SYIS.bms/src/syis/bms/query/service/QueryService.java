package syis.bms.query.service;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.query.domain.Query;

public interface QueryService {
	List<Query> queryList(String userId, Page page);
	List<Query> queryLists(Page page);
	Query findQueryNum(int boardNum);
	List<Query> findQueryId(String userId);
	boolean modifyQuery(Query query);
	boolean modifyQueryAnswer(Query query);
	boolean addQuery(Query query);
	boolean deleteQuery(int boardNum);
	
}
