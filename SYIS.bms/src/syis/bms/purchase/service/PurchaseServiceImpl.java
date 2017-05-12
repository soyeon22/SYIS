package syis.bms.purchase.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import syis.bms.paging.domain.Page;
import syis.bms.purchase.dao.PurchaseDao;
import syis.bms.purchase.domain.Purchase;
import syis.bms.query.domain.Query;

public class PurchaseServiceImpl implements PurchaseService{
	private PurchaseDao purchaseDao;
	
	public PurchaseServiceImpl(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	public List<Purchase> listPurchases(){
		return purchaseDao.purchaseList();
	}
	public List<Purchase> findPurchaseList(int orderNum){
		return purchaseDao.getPurchaseList(orderNum);
	}
	public List<Purchase> findPurchaseBook(String bookCode){
		return purchaseDao.getPurchaseBook(bookCode);
	}
	
	public List<Purchase> findPurchaseId(String userId){
		List<Purchase> purchase = (List<Purchase>)purchaseDao.getPurchaseId(userId);
			return purchase;
	}
	public List<Purchase> findPurchasePage(String userId, Page page){
		List<Purchase> purchaseList= new ArrayList<Purchase>();
		 List<Purchase> purchaseLists =purchaseDao.getPurchasePage(page);
		 for(Purchase purchase :purchaseLists){
			 if(purchase.getUserId().equals(userId)){
				 purchaseList.add(purchase);
			 } 
		}return purchaseList;
	}
	public List<Purchase> findPurchaseSearch(String date1, String date2){
		List<Purchase> purchase = (List<Purchase>)purchaseDao.getPurchaseSearch(date1, date2);
		return purchase;
	}
	
	public Purchase findPurchase(int orderNum){
		return purchaseDao.getPurchase(orderNum);
	}
	public Purchase findBook(String bookCode){
		return purchaseDao.getBook(bookCode);
	}
	
	public boolean addPurchase(Purchase purchase){
		return purchaseDao.addPurchase(purchase)>0;
	}
	
	public boolean modifyPurchase(Purchase purchase){
		return purchaseDao.updatePurchase(purchase)>0;
	}
	public boolean modifyRefund(Purchase purchase){
		return purchaseDao.updateRefund(purchase)>0;
	}
	
	public boolean deletePurchase(int orderNum){
		return purchaseDao.delPurchase(orderNum)>0;
	}
	
}
