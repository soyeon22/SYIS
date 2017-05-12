package syis.bms.purchase.service;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.purchase.domain.Purchase;
import syis.bms.query.domain.Query;

public interface PurchaseService {
	List<Purchase> listPurchases();
	Purchase findPurchase(int orderNum);
	List<Purchase> findPurchaseBook(String bookCode);
	List<Purchase> findPurchaseList(int orderNum);
	List<Purchase> findPurchaseId(String userId);
	List<Purchase> findPurchasePage(String userId, Page page);
	List<Purchase> findPurchaseSearch(String date1, String date2);
	Purchase findBook(String bookCode);
	boolean addPurchase(Purchase purchase);
	boolean modifyPurchase(Purchase purchase);
	boolean modifyRefund(Purchase purchase);
	boolean deletePurchase(int orderNum);
}
