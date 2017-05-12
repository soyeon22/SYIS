package syis.bms.paging.dao.mapper;

public interface PageMapper {
	int getTotRowCntBook();
	int getTotRowCntQuery1(String userId);
	int getTotRowCntQuery();
	int getTotRowCntUser();
	int getTotRowCntRefund(String userId);
	int getTotRowCntOrder(String userId);
}
