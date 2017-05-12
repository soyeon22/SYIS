package syis.bms.search.dao;

import java.util.List;

import syis.bms.config.Configuration;
import syis.bms.search.dao.mapper.SearchMapper;
import syis.bms.search.domain.SearchResult;

public class SearchDaoImpl implements SearchDao{
	SearchMapper searchMapper;
	
	public SearchDaoImpl(){
		this.searchMapper=Configuration.getMapper(SearchMapper.class);
	}
	
	public List<SearchResult> salesNum(String searchOption, String searchText){
		return searchMapper.salesNum(searchOption, searchText);
	}
	
	public List<SearchResult> reviewCnt(String searchOption, String searchText){
		return searchMapper.reviewCnt(searchOption, searchText);
	}
	
	public List<SearchResult> publiDate(String searchOption, String searchText){
		return searchMapper.publiDate(searchOption, searchText);
	}
	
	public List<SearchResult> highPrice(String searchOption, String searchText){
		return searchMapper.highPrice(searchOption, searchText);
	}
	
	public List<SearchResult> lowPrice(String searchOption, String searchText){
		return searchMapper.lowPrice(searchOption, searchText);
	}
	
	
	//도서 1권 가져오기
	//Param : 도서 코드
	//return : 도서
	public SearchResult getBook(String bookCode){
		return searchMapper.getBook(bookCode);
	}
}
