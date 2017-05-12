package syis.bms.writer.service;

import java.util.List;

import syis.bms.writer.dao.WriterDao;
import syis.bms.writer.dao.WriterDaoImpl;
import syis.bms.writer.domain.Writer;


public class WriterServiceImpl implements WriterService{
	private WriterDao writerDao;
	
	public WriterServiceImpl(){
		this.writerDao=new WriterDaoImpl();
	}
	
	public List<Writer> listWriters(){
		return writerDao.getWriters();
	}
}
