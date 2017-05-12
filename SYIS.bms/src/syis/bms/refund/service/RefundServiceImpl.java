package syis.bms.refund.service;

import java.util.ArrayList;
import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.query.domain.Query;
import syis.bms.refund.dao.RefundDao;
import syis.bms.refund.domain.Refund;

public class RefundServiceImpl implements RefundService{
private RefundDao refundDao;
	
	public RefundServiceImpl(RefundDao refundDao) {
		this.refundDao = refundDao;
	}
	public List<Refund> listRefunds(String userId){
		return refundDao.refundList(userId);
	}
	public List<Refund> listRefundPage(String userId,Page page){
		List<Refund> RefundList= new ArrayList<Refund>();
		 List<Refund> RefundLists =refundDao.refundListPage(page);
		 for(Refund Refund :RefundLists){
			 if(Refund.getUserId().equals(userId)){
				 RefundList.add(Refund);
			 } 
		}return RefundList;
	}
	
	public Refund findRefund(int orderNum){
		return refundDao.getRefund(orderNum);
	}
	
	public boolean addRefund(Refund refund){
		return refundDao.addRefund(refund)>0;
	}
	
	public boolean modifyRefund(Refund refund){
		return refundDao.updateRefund(refund)>0;
	}
	
	public boolean deleteRefund(int refundNum){
		return refundDao.delRefund(refundNum)>0;
	}
}
