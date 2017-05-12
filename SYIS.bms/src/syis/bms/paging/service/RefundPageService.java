package syis.bms.paging.service;

import syis.bms.paging.domain.Page;

public interface RefundPageService {
	Page getPage();
	boolean isPrev();
	boolean isNext();
	int getStartPage();
	int getEndPage();
}
