package syis.bms.orderManagement.domain;

public class Order {
	private String userId;
	private int orderNum;
	private String orderDate;
	private String destination;
	private String bookCode;
	private int orderCount;
	private int deliveryNum;
	private int refundNum;
	private String payOption;
	private int payAmount;
	
	Order(){}
	
	public Order(String userId, int orderNum, String orderDate, String destination,
			String bookCode, int orderCount, int deliveryNum, int refundNum, String payOption, int payAmount){
		this.userId= userId;
		this.orderNum=orderNum;
		this.orderDate=orderDate;
		this.destination=destination;
		this.bookCode=bookCode;
		this.orderCount=orderCount;
		this.deliveryNum=deliveryNum;
		this.refundNum=refundNum;
		this.payOption=payOption;
		this.payAmount=payAmount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public int getRefundNum() {
		return refundNum;
	}

	public void setRefundNum(int refundNum) {
		this.refundNum = refundNum;
	}

	public String getPayOption() {
		return payOption;
	}

	public void setPayOption(String payOption) {
		this.payOption = payOption;
	}

	public int getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	
}
