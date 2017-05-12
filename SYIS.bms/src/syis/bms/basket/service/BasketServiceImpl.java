package syis.bms.basket.service;

import java.util.List;

import syis.bms.basket.dao.BasketDao;
import syis.bms.basket.domain.Basket;

public class BasketServiceImpl implements BasketService{
	private BasketDao basketDao;
	
	public BasketServiceImpl(BasketDao basketDao){
		this.basketDao = basketDao;
	}
	
	public List<Basket> listBaskets(String userId){
		return basketDao.getBaskets(userId);
	}
	
	public Basket findBasket(int bookNum){
		return basketDao.getBasket(bookNum);
	}

	public boolean plusBasket(Basket basket){
		return basketDao.addBasket(basket)>0;
	}
	
	public boolean deleteBasket(int basketNum){
		return basketDao.delBasket(basketNum)>0;
	}
	public boolean modifyBasket(Basket basket){
		return basketDao.updateBasket(basket)>0;
	}
}
