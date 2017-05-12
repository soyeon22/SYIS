package syis.bms.purchase.dao;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.purchase.domain.Purchase;
import syis.bms.query.domain.Query;

public interface PurchaseDao {
	List<Purchase> purchaseList();
	Purchase getPurchase(int orderNum);
	List<Purchase> getPurchaseList(int orderNum);
	List<Purchase> getPurchaseBook(String bookCode);
	List<Purchase> getPurchaseId(String userId);
	List<Purchase> getPurchasePage(Page page);
	List<Purchase> getPurchaseSearch(String date1, String date2);
	Purchase getBook(String bookCode);
	int addPurchase(Purchase purchase);
	int updatePurchase(Purchase purchase);
	int updateRefund(Purchase purchase);
	int delPurchase(int orderNum);
}
