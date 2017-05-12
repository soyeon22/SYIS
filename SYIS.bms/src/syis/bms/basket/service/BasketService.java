package syis.bms.basket.service;

import java.util.List;

import syis.bms.basket.domain.Basket;

public interface BasketService {
	List<Basket> listBaskets(String userId);
	Basket findBasket(int basketNum);
	boolean plusBasket(Basket basket);
	boolean deleteBasket(int basketNum);
	boolean modifyBasket(Basket basket);
}
