package syis.bms.refund.dao;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.refund.dao.mapper.RefundMapper;
import syis.bms.refund.domain.Refund;

public class RefundDaoImpl implements RefundDao{
	RefundMapper refundMapper;
	
	public RefundDaoImpl(){}
	
	public RefundDaoImpl(RefundMapper refundMapper){
		this.refundMapper = refundMapper;
	}
	
	public List<Refund> refundList(String userId) {
		return refundMapper.refundList(userId);
	}
	public List<Refund> refundListPage(Page page) {
		return refundMapper.refundListPage(page);
	}
	public Refund getRefund(int orderNum) {
		return refundMapper.getRefund(orderNum);
	}
	public int addRefund(Refund refund){
		return refundMapper.addRefund(refund);
	}
	public int updateRefund(Refund refund) {
		return refundMapper.updateRefund(refund);
	}
	public int delRefund(int refundNum) {
		return refundMapper.delRefund(refundNum);
	}

}
