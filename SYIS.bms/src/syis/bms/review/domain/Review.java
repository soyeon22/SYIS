package syis.bms.review.domain;

public class Review {
	private String userId;			//사용자 아이디
	private String bookCode;		//도서 코드
	private String reviewContent;	//리뷰 내용
	private String creationDate;	//작성 일자
	private int gpa;				//평점
	
	public Review() {}
	
	public Review(String userId, String bookCode, String reviewContent, int gpa){
		this.userId=userId;
		this.bookCode=bookCode;
		this.reviewContent=reviewContent;
		this.gpa=gpa;
	}
	
	public Review(String userId, String bookCode, String reviewContent, String creationDate, int gpa){
		this.userId=userId;
		this.bookCode=bookCode;
		this.reviewContent=reviewContent;
		this.creationDate=creationDate;
		this.gpa=gpa;
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

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public int getGpa() {
		return gpa;
	}

	public void setGpa(int gpa) {
		this.gpa = gpa;
	}
}
