package syis.bms.refund.domain;

public class Refund {
	private int refundNum;//환불번호
	private String refundNow;//환불상태
	private String refundReason;//환불이유
	private String cancelType;//환불방법
	private String refundDate;//환불날짜
	private int refundAmount;//환불금액
	private String bookName;//환불상품
	private int orderNum;//주문번호
	private String userId;//환불자
	
	public Refund(){}
	
	public Refund(int refundNum, String refundNow, String refundReason, String cancelType, String refundDate, int refundAmount, String bookName, int orderNum, String userId){
		this.refundNum=refundNum;
		this.refundNow=refundNow;
		this.refundReason=refundReason;
		this.cancelType=cancelType;
		this.refundAmount=refundAmount;
		this.refundDate=refundDate;
		this.bookName=bookName;
		this.orderNum=orderNum;
		this.userId=userId;
	}

	public int getRefundNum() {
		return refundNum;
	}

	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}

	public String getRefundNow() {
		return refundNow;
	}

	public void setRefundNow(String refundNow) {
		this.refundNow = refundNow;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public String getCancelType() {
		return cancelType;
	}

	public void setCancelType(String cancelType) {
		this.cancelType = cancelType;
	}

	public String getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(String refundDate) {
		this.refundDate = refundDate;
	}

	public int getRefundAmount() {
		return refundAmount;
	}

	public void setRefundAmount(int refundAmount) {
		this.refundAmount = refundAmount;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
