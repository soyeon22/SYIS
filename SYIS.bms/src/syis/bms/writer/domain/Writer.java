package syis.bms.writer.domain;

public class Writer {
	private String writer;
	private String writerIntro;
	
	Writer(){}
	
	Writer(String writer){
		this.writer=writer;
	}
	
	Writer(String writer, String writerIntro){
		this.writer=writer;
		this.writerIntro=writerIntro;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterIntro() {
		return writerIntro;
	}

	public void setWriterIntro(String writerIntro) {
		this.writerIntro = writerIntro;
	}
}
