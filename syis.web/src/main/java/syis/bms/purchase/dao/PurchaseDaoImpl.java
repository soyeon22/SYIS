package syis.bms.purchase.dao;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.purchase.dao.mapper.PurchaseMapper;
import syis.bms.purchase.domain.Purchase;
import syis.bms.query.domain.Query;


public class PurchaseDaoImpl implements PurchaseDao{

	PurchaseMapper purchaseMapper;
	
	public PurchaseDaoImpl(){}
	
	public PurchaseDaoImpl(PurchaseMapper purchaseMapper){
		this.purchaseMapper = purchaseMapper;
	}
	public List<Purchase> getPurchaseId(String userId){
		return purchaseMapper.getPurchaseId(userId);
	}
	public List<Purchase> getPurchaseSearch(String date1, String date2){
		return purchaseMapper.getPurchaseSearch(date1, date2);
	}
	public List<Purchase> purchaseList() {
		return purchaseMapper.purchaseList();
	}
	public List<Purchase> getPurchasePage(Page page){
		return purchaseMapper.getPurchasePage(page);
	}
	public List<Purchase> getPurchaseBook(String bookCode){
		return purchaseMapper.getPurchaseBook(bookCode);
	}
	public List<Purchase> getPurchaseList(int orderNum){
		return purchaseMapper.getPurchaseList(orderNum);
	}
	public Purchase getPurchase(int orderNum) {
		return purchaseMapper.getPurchase(orderNum);
	}
	public Purchase getBook(String bookCode) {
		return purchaseMapper.getBook(bookCode);
	}
	public int addPurchase(Purchase purchase){
		return purchaseMapper.addPurchase(purchase);
	}
	public int updatePurchase(Purchase purchase) {
		return purchaseMapper.updatePurchase(purchase);
	}
	public int updateRefund(Purchase purchase) {
		return purchaseMapper.updateRefund(purchase);
	}
	public int delPurchase(int orderNum) {
		return purchaseMapper.delPurchase(orderNum);
	}

}
