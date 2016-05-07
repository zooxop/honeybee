package projectVO;

public class FollowerVO {
	int adminnum;
	String followernick;
	int memberno;
	int followermno;
	public FollowerVO(){}
	
	public FollowerVO(int adminnum, String followernick, int memberno, int followermno) {
		this.adminnum = adminnum;
		this.followernick = followernick;
		this.memberno = memberno;
		this.followermno = followermno;
	}
	public int getFollowermno() {
		return followermno;
	}

	public void setFollowermno(int followermno) {
		this.followermno = followermno;
	}

	public int getAdminnum() {
		return adminnum;
	}
	public void setAdminnum(int adminnum) {
		this.adminnum = adminnum;
	}
	public String getFollowernick() {
		return followernick;
	}
	public void setFollwernick(String followernick) {
		this.followernick = followernick;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	
}
