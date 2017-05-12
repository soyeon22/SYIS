package syis.bms.bookmanagement.dao;

import java.util.List;

import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;

public interface BookDao {
	List<Book> bookList(Page page);
	Book getBook(String bookCode);
	int addBook(Book book);
	int updateBook(Book book);
	int delBook(String bookCode);
	
	List<Book> bestBookList();
	List<Book> newBookList();
	List<Book> saleBookList();
	List<Book> domesticBookList(String kind);
	List<Book> foreignBookList(String kind);
}
