package syis.bms.query.service;

import java.util.ArrayList;
import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.query.dao.QueryDao;
import syis.bms.query.domain.Query;

public class QueryServiceImpl implements QueryService{
	private QueryDao queryDao;
	
	public QueryServiceImpl(QueryDao queryDao) {
		this.queryDao = queryDao;
	}
	
	public List<Query> queryList(String userId,Page page){
		List<Query> queryList= new ArrayList<Query>();
		 List<Query> queryLists =queryDao.queryList(page);
		 for(Query query :queryLists){
			 if(query.getUserId().equals(userId)){
				 queryList.add(query);
			 } 
		}return queryList;
	}
	
	public List<Query> queryLists(Page page){
		return queryDao.queryList(page);
	}
	
	public Query findQueryNum(int boardNum){
		return queryDao.getQueryNum(boardNum);
	}
	public List<Query> findQueryId(String userId){
		List<Query> query = (List<Query>)queryDao.getQueryId(userId);
			return query;
	}
	public boolean modifyQuery(Query query){
		return queryDao.updateQuery(query)>0;
	}
	public boolean modifyQueryAnswer(Query query){
		return queryDao.updateQueryAnswer(query)>0;
	}
	public boolean addQuery(Query query){
		return queryDao.addQuery(query)>0;
	}
	public boolean deleteQuery(int boardNum){
		return queryDao.delQuery(boardNum)>0;
	}

}
