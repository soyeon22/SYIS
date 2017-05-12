package syis.bms.search.domain;

public class SearchResult {
	private String	img;		//사진 url
	private String  bookCode;	//도서 코드
	private String  bookName;	//도서 제목
	private int 	bookPrice;	//도서 가격
	private String	bookIntro;	//도서 소개
	private String  writer;		//저자
	private String	writerIntro;//저자 소개
	private String  company;	//출판사
	private String  publiDate;	//출판일
	private String  country;	//출판 국가(국내/해외)
	private String  kind;		//분류
	private int		salesNum;	//판매량
	private int		reviewCnt;	//상품평순
	private String	companyEval;//출판사 서평
	
	public SearchResult(){}
	
	public SearchResult(String bookCode, String bookName, int bookPrice, String	bookIntro, String writer,String writerIntro, String company,
			String publiDate, String contents, String companyEval) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookPrice = bookPrice;
		this.bookIntro = bookIntro;
		this.writer = writer;
		this.writerIntro=writerIntro;
		this.company = company;
		this.publiDate = publiDate;
		this.companyEval=companyEval;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterIntro() {
		return writerIntro;
	}

	public void setWriterIntro(String writerIntro) {
		this.writerIntro = writerIntro;
	}
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPubliDate() {
		return publiDate;
	}

	public void setPubliDate(String publiDate) {
		this.publiDate = publiDate;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public int getSalesNum() {
		return salesNum;
	}

	public void setSalesNum(int salesNum) {
		this.salesNum = salesNum;
	}
	
	public int getReviewCnt() {
		return reviewCnt;
	}

	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}

	public String getBookIntro() {
		return bookIntro;
	}

	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}

	public String getCompanyEval() {
		return companyEval;
	}

	public void setCompanyEval(String companyEval) {
		this.companyEval = companyEval;
	}
}
