package syis.bms.orderManagement.service;

import java.util.List;

import syis.bms.orderManagement.dao.OrderDao;
import syis.bms.orderManagement.domain.Order;

public class OrderServiceImpl implements OrderService{
	private OrderDao orderDao;
	
	public OrderServiceImpl(OrderDao orderDao){
		this.orderDao = orderDao;
	}
	
	public List<Order> orderList(){
		return orderDao.orderList();
	}
	
	public List<Order> searchDates(String registrationDate1, String registrationDate2){
		return orderDao.searchDates(registrationDate1,registrationDate2);
	}
}