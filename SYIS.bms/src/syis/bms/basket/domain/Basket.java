package syis.bms.basket.domain;

public class Basket {
	private int		basketNum; 	//수량
	private	String 	userId;		//유저 아이디
	private String	bookCode;	//책 코드
	private String	bookName;	//책 이름
	private int		bookPrice;	//책 가격
	private int 	bookCount; 
	
	public Basket(){}
	
	public Basket(int basketNum, String userId,
			String bookCode, String bookName, int bookPrice,int bookCount){
		this.basketNum = basketNum;
		this.userId = userId;
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookCount = bookCount;
	}
	
	public int getBasketNum() {
		return basketNum;
	}

	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}
	
}
