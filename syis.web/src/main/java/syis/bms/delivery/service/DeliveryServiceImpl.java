package syis.bms.delivery.service;

import java.util.List;

import syis.bms.delivery.dao.DeliveryDao;
import syis.bms.delivery.domain.Delivery;

public class DeliveryServiceImpl implements DeliveryService{
	private DeliveryDao deliveryDao;
	
	public DeliveryServiceImpl(DeliveryDao deliveryDao) {
		this.deliveryDao = deliveryDao;
	}
	public List<Delivery> listDeliverys(){
		return deliveryDao.deliveryList();
	}
	
	public Delivery findDelivery(int deliveryNum){
		return deliveryDao.getDelivery(deliveryNum);
	}
	
	public boolean addDelivery(Delivery delivery){
		return deliveryDao.addDelivery(delivery)>0;
	}
	
	public boolean modifyDelivery(Delivery delivery){
		return deliveryDao.updateDelivery(delivery)>0;
	}
	public boolean modifyDeliveryNow(Delivery delivery){
		return deliveryDao.updateDeliveryNow(delivery)>0;
	}
	public boolean deleteDelivery(int deliveryNum){
		return deliveryDao.delDelivery(deliveryNum)>0;
	}
}
