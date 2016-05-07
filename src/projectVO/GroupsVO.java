package projectVO;

public class GroupsVO {
	int adminnum, groupno;
	String name, admin;
	int memberno;
	String groupImg;
	public GroupsVO(int adminnum, int groupno, String name, String admin, int memberno, String groupImg) {
		this.adminnum = adminnum;
		this.groupno = groupno;
		this.name = name;
		this.admin = admin;
		this.memberno = memberno;
		this.groupImg = groupImg;
	}

	public int getAdminnum() {
		return adminnum;
	}

	public void setAdminnum(int adminnum) {
		this.adminnum = adminnum;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	public String getGroupImg(){
		return groupImg;
	}
	
	public void setGroupImg(String groupImg){
		this.groupImg = groupImg;
	}
	
}
