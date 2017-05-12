package syis.bms.search.service;

import java.util.List;

import syis.bms.search.dao.SearchDao;
import syis.bms.search.dao.SearchDaoImpl;
import syis.bms.search.domain.SearchResult;

public class SearchServiceImpl implements SearchService{
	private SearchDao searchDao;
	
	public SearchServiceImpl(){
		this.searchDao=new SearchDaoImpl();
	}
	
	public List<SearchResult> salesNum(String searchOption, String searchText){
		return searchDao.salesNum(searchOption, searchText);
	}
	
	public List<SearchResult> reviewCnt(String searchOption, String searchText){
		return searchDao.reviewCnt(searchOption, searchText);
	}
	
	public List<SearchResult> publiDate(String searchOption, String searchText){
		return searchDao.publiDate(searchOption, searchText);
	}
	
	public List<SearchResult> highPrice(String searchOption, String searchText){
		return searchDao.highPrice(searchOption, searchText);
	}
	
	public List<SearchResult> lowPrice(String searchOption, String searchText){
		return searchDao.lowPrice(searchOption, searchText);
	}
	
	//도서 상세정보
	//return : 도서 정보
	//Param : 도서 코드
	public SearchResult bookInfo(String bookCode){
		return searchDao.getBook(bookCode);
	}
}
