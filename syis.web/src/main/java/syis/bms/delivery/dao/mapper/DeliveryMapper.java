package syis.bms.delivery.dao.mapper;

import java.util.List;

import syis.bms.delivery.domain.Delivery;

public interface DeliveryMapper {
	List<Delivery> deliveryList();
	Delivery getDelivery(int deliveryNum);
	int addDelivery(Delivery delivery);
	int updateDelivery(Delivery delivery);
	int updateDeliveryNow(Delivery delivery);
	int delDelivery(int deliveryNum);	
}
