package syis.bms.search.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import syis.bms.search.domain.SearchResult;

public interface SearchMapper {
	List<SearchResult> salesNum(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> reviewCnt(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> publiDate(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> highPrice(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	List<SearchResult> lowPrice(@Param("searchOption")String searchOption, @Param("searchText")String searchText);
	
	//도서 1권 가져오기
	//Param : 도서 코드
	//return : 도서
	SearchResult getBook(String bookCode);
}
