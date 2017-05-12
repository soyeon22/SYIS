package syis.bms.orderManagement.dao;

import java.util.List;

import syis.bms.orderManagement.domain.Order;


public interface OrderDao {
	List<Order> orderList();
	
	List<Order> searchDates(String registrationDate1, String registrationDate2);
}
