package syis.bms.orderManagement.service;

import java.util.List;

import syis.bms.orderManagement.domain.Order;

public interface OrderService {
	List<Order> orderList();
	
	List<Order> searchDates(String registrationDate1, String registrationDate2);
}
