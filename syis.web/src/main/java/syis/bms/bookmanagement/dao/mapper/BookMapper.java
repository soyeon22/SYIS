package syis.bms.bookmanagement.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;

public interface BookMapper {
	List<Book> bookList(Page page);
	Book getBook(String bookCode);
	int addBook(Book book);
	int updateBook(Book book);
	int delBook(String bookCode);
	
	List<Book> bestBookList();
	List<Book> newBookList();
	List<Book> saleBookList();
	List<Book> domesticBookList(@Param("kind")String kind);
	List<Book> foreignBookList(@Param("kind")String kind);
}
