package syis.bms.search.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import syis.bms.search.domain.SearchResult;

public interface SearchService {
	List<SearchResult> salesNum(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> reviewCnt(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> publiDate(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> highPrice(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> lowPrice(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	//도서 정보
	SearchResult bookInfo(String bookCode);
}
