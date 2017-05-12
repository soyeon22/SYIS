package syis.bms.bookmanagement.service;

import java.util.List;

import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;

public interface BookService {
	List<Book> listBooks(Page page);
	Book findBook(String bookCode);
	boolean addBook(Book book);
	boolean modifyBook(Book book);
	boolean deleteBook(String bookCode);
	
	List<Book> bestBookList();
	List<Book> newBookList();
	List<Book> saleBookList();
	List<Book> domesticBookList(String kind);
	List<Book> foreignBookList(String kind);
}
