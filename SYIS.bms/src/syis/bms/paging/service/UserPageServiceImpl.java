package syis.bms.paging.service;

import syis.bms.paging.dao.PageDao;
import syis.bms.paging.dao.PageDaoImpl;
import syis.bms.paging.domain.Page;

public class UserPageServiceImpl implements UserPageService {
	private PageDao pageDao;
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int totRowCnt;
	private int pageNumCnt;
	private Page page;
	
	public UserPageServiceImpl(int pageNumCnt, Page page) {
		this.pageDao = new PageDaoImpl();
		this.totRowCnt = getTotRowCnt();
		this.pageNumCnt = pageNumCnt;
		this.page = page;
		init();
	}
	
	private int getTotRowCnt(){
		return pageDao.getTotRowCntUser();
	}
	
	
	private void init() {
		endPage = (int)(Math.ceil(page.getCurrentPage()/(double)pageNumCnt)*pageNumCnt);
		startPage = (endPage-pageNumCnt)+1;
		int lastEndPage = (int)(Math.ceil(totRowCnt/(double)page.getRowCnt()));
		
		if (endPage > lastEndPage) endPage = lastEndPage;
		
		prev = startPage ==1?false:true;
		next = endPage*page.getRowCnt() >= totRowCnt?false:true;
	}
	
	public Page getPage() {
		return page;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
}