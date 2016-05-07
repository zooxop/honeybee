package projectVO;

public class FollowingVO {
	int adminnum;
	String followingnick;
	int memberno;
	int followingmno;
	public FollowingVO(int adminnum, String followingnick, int memberno, int followingmno) {
		this.adminnum = adminnum;
		this.followingnick = followingnick;
		this.memberno = memberno;
		this.followingmno = followingmno;
	}

	public int getFollowingmno() {
		return followingmno;
	}

	public void setFollowingmno(int followingmno) {
		this.followingmno = followingmno;
	}

	public int getAdminnum() {
		return adminnum;
	}

	public void setAdminnum(int adminnum) {
		this.adminnum = adminnum;
	}

	public String getFollowingnick() {
		return followingnick;
	}

	public void setFollowingnick(String followingnick) {
		this.followingnick = followingnick;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	
	
}
