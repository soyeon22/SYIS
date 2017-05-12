package syis.bms.paging.dao;

import syis.bms.config.Configuration;
import syis.bms.paging.dao.mapper.PageMapper;

public class PageDaoImpl implements PageDao {
	private PageMapper pageMapper;
	
	public PageDaoImpl() {
		this.pageMapper = Configuration.getMapper(PageMapper.class);
	}
	
	public int getTotRowCntBook() {
		return pageMapper.getTotRowCntBook();
	}
	public int getTotRowCntQuery1(String userId) {
		return pageMapper.getTotRowCntQuery1(userId);
	}
	public int getTotRowCntQuery() {
		return pageMapper.getTotRowCntQuery();
	}
	public int getTotRowCntUser() {
		return pageMapper.getTotRowCntUser();
	}
	public int getTotRowCntRefund(String userId) {
		return pageMapper.getTotRowCntRefund(userId);
	}
	public int getTotRowCntOrder(String userId) {
		return pageMapper.getTotRowCntOrder(userId);
	}
	
	
}
