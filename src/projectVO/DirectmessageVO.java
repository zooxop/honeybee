package projectVO;

public class DirectmessageVO {
	int messagenum;
	String receivenick, imgroute, contents, time;
	int memberno;
	
	
	public DirectmessageVO(int messagenum, String receivenick, String imgroute, String contents,
			String time, int memberno) {
		this.messagenum = messagenum;
		this.receivenick = receivenick;
		this.imgroute = imgroute;
		this.contents = contents;
		this.time = time;
		this.memberno = memberno;
	}

	public int getMessagenum() {
		return messagenum;
	}


	public void setMessagenum(int messagenum) {
		this.messagenum = messagenum;
	}


	public String getReceivenick() {
		return receivenick;
	}


	public void setReceivenick(String receivenick) {
		this.receivenick = receivenick;
	}


	public String getImgroute() {
		return imgroute;
	}


	public void setImgroute(String imgroute) {
		this.imgroute = imgroute;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public int getMemberno() {
		return memberno;
	}


	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	
	
}
