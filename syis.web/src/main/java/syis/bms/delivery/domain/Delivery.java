package syis.bms.delivery.domain;

public class Delivery {
	private int deliveryNum;//배송번호
	private String deliveryNow;//배송상태
	private String phoneNum;//핸드폰
	private String recipient;//보내는사람
	private String sender;//받는사람
	private String address;//주소
	private String message;//배송메세지
	private String deliveryDate;//배송날짜
	

	public Delivery(){}
	
	public Delivery(int deliveryNum, String deliveryNow, String phoneNum, String recipient, String sender, String address, String message, String deliveryDate){
		this.deliveryNum=deliveryNum;
		this.deliveryNow=deliveryNow;
		this.phoneNum=phoneNum;
		this.recipient=recipient;
		this.sender=sender;
		this.address=address;
		this.message=message;
		this.deliveryDate=deliveryDate;
	}

	public int getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getDeliveryNow() {
		return deliveryNow;
	}

	public void setDeliveryNow(String deliveryNow) {
		this.deliveryNow = deliveryNow;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	
}
