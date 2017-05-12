package syis.bms.basket.dao;

import java.util.List;

import syis.bms.basket.domain.Basket;

public interface BasketDao {
	List<Basket> getBaskets(String userId);
	Basket getBasket(int basketNum);
	int addBasket(Basket basket);
	int updateBasket(Basket basket);
	int delBasket(int basketNum);
}