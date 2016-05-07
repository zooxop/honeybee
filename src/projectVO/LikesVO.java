package projectVO;

public class LikesVO {
	int adminnum;
	String time;
	int boardno, memberno;
	
	public LikesVO(int adminnum, String time, int boardno, int memberno) {
		this.adminnum = adminnum;
		this.time = time;
		this.boardno = boardno;
		this.memberno = memberno;
	}
	
	public LikesVO(){
		
	}
	public int getAdminnum() {
		return adminnum;
	}
	public void setAdminnum(int adminnum) {
		this.adminnum = adminnum;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	
	
}
