package syis.bms.bookmanagement.service;

import java.util.List;

import syis.bms.bookmanagement.dao.BookDao;
import syis.bms.bookmanagement.domain.Book;
import syis.bms.paging.domain.Page;

public class BookServiceImpl implements BookService {
	private BookDao bookDao;
	
	public BookServiceImpl(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public List<Book> listBooks(Page page){
		return bookDao.bookList(page);
	}
	public Book findBook(String bookCode){
		return bookDao.getBook(bookCode);
	}
	public boolean addBook(Book book){
		return bookDao.addBook(book)>0;
	}
	public boolean modifyBook(Book book){
		return bookDao.updateBook(book)>0;
	}
	public boolean deleteBook(String bookCode){
		return bookDao.delBook(bookCode)>0;
	}
	public List<Book> bestBookList(){
		return bookDao.bestBookList();
	}
	public List<Book> newBookList(){
		return bookDao.newBookList();
	}
	public List<Book> saleBookList(){
		return bookDao.saleBookList();
	}
	public List<Book> domesticBookList(String kind) {
		return bookDao.domesticBookList(kind);
	}
	public List<Book> foreignBookList(String kind) {
		return bookDao.foreignBookList(kind);
	}
}
