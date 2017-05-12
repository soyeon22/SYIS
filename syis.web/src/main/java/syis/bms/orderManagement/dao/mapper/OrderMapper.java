package syis.bms.orderManagement.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import syis.bms.orderManagement.domain.Order;

public interface OrderMapper {
	List<Order> orderList();
	
	List<Order> searchDates(@Param("registrationDate1")String registrationDate1, @Param("registrationDate2")String registrationDate2);
}
