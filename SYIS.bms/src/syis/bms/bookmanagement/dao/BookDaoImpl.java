package syis.bms.bookmanagement.dao;

import java.util.List;

import syis.bms.bookmanagement.dao.mapper.BookMapper;
import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;

public class BookDaoImpl implements BookDao {
	BookMapper bookMapper;
	
	public BookDaoImpl(){}
	
	public BookDaoImpl(BookMapper bookMapper){
		this.bookMapper = bookMapper;
	}
	
	public List<Book> bookList(Page page) {
		return bookMapper.bookList(page);
	}
	public Book getBook(String bookCode) {
		return bookMapper.getBook(bookCode);
	}
	public int addBook(Book book){
		return bookMapper.addBook(book);
	}
	public int updateBook(Book book) {
		return bookMapper.updateBook(book);
	}
	public int delBook(String bookCode) {
		return bookMapper.delBook(bookCode);
	}
	public List<Book> bestBookList(){
		return bookMapper.bestBookList();
	}
	public List<Book> newBookList(){
		return bookMapper.newBookList();
	}
	public List<Book> saleBookList(){
		return bookMapper.saleBookList();
	}
	public List<Book> domesticBookList(String kind) {
		return bookMapper.domesticBookList(kind);
	}
	public List<Book> foreignBookList(String kind) {
		return bookMapper.foreignBookList(kind);
	}
}
