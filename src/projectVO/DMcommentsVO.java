package projectVO;

public class DMcommentsVO {
	int adminnum;
	String contents;
	int memberno;
	String time;
	int messagenum;
	
	public DMcommentsVO() {}

	public DMcommentsVO(int adminnum, String contents, int memberno, String time, int messagenum) {
		this.adminnum = adminnum;
		this.contents = contents;
		this.memberno = memberno;
		this.time = time;
		this.messagenum = messagenum;
	}

	public int getAdminnum() {
		return adminnum;
	}

	public void setAdminnum(int adminnum) {
		this.adminnum = adminnum;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getMessagenum() {
		return messagenum;
	}

	public void setMessagenum(int messagenum) {
		this.messagenum = messagenum;
	}
	
}
