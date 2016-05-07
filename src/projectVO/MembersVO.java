package projectVO;

public class MembersVO {
	
	
	
	int memberno;
	String id, nickname, pw, question, answer, profileimg, phone, birthday;
	
	public MembersVO(){}
	public MembersVO(String id, String nickname, String pw, String question, String answer,
			String profileimg, String phone, String birthday) {
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.question = question;
		this.answer = answer;
		this.profileimg = profileimg;
		this.phone = phone;
		this.birthday = birthday;
	}
	
	public MembersVO(int memberno, String id, String nickname, String pw, String question, String answer,
			String profileimg, String phone, String birthday) {
		this.memberno = memberno;
		this.id = id;
		this.nickname = nickname;
		this.pw = pw;
		this.question = question;
		this.answer = answer;
		this.profileimg = profileimg;
		this.phone = phone;
		this.birthday = birthday;
	}
	
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
}
