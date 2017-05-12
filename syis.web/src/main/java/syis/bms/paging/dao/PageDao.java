package syis.bms.paging.dao;

public interface PageDao {
	int getTotRowCntBook();
	int getTotRowCntQuery1(String userId);
	int getTotRowCntQuery();
	int getTotRowCntUser();
	int getTotRowCntRefund(String userId);
	int getTotRowCntOrder(String userId);
}
