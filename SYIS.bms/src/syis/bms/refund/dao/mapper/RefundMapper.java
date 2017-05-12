package syis.bms.refund.dao.mapper;

import java.util.List;

import syis.bms.paging.domain.Page;
import syis.bms.refund.domain.Refund;

public interface RefundMapper {
	List<Refund> refundList(String userId);
	List<Refund> refundListPage(Page page);
	Refund getRefund(int orderNum);
	int addRefund(Refund refund);
	int updateRefund(Refund refund);
	int delRefund(int refundNum);
}

