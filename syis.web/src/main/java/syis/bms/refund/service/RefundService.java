package syis.bms.refund.service;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.refund.domain.Refund;

public interface RefundService {
	List<Refund> listRefunds(String userId);
	List<Refund> listRefundPage(String userId,Page page);
	Refund findRefund(int orderNum);
	boolean addRefund(Refund refund);
	boolean modifyRefund(Refund refund);
	boolean deleteRefund(int refundNum);
}
