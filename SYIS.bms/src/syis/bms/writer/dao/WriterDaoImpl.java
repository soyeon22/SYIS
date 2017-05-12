package syis.bms.writer.dao;

import java.util.List;

import syis.bms.config.Configuration;
import syis.bms.writer.dao.mapper.WriterMapper;
import syis.bms.writer.domain.Writer;

public class WriterDaoImpl implements WriterDao{
	WriterMapper writerMapper;
	
	public WriterDaoImpl(){
		this.writerMapper=Configuration.getMapper(WriterMapper.class);
	}
	
	public List<Writer> getWriters(){
		return writerMapper.getWriters();
	}
}
