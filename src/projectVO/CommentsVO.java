package projectVO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentsVO {
	int adminnum;
	String contents, time;
	int memberno, boardno;
	
	
	public CommentsVO(){}
	
	public CommentsVO(int adminnum, String contents, String time, int memberno, int boardno) {
		this.adminnum = adminnum;
		this.contents = contents;
		this.time = time;
		this.memberno = memberno;
		this.boardno = boardno;
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
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	
	public String doDiffOfDate(String today){  // target = �Խñ� ��¥
	    String result = null;
	    long diffDays = 0;
	    long oneDate = 86400000;
	    long oneHour = 3600000;
	    long oneMinute = 60000;
	    String unit = null;
	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        Date beginDate = formatter.parse(today);
	        Date endDate = formatter.parse(time);
	         
	     // �ð����̸� �ð�,��,�ʸ� ���� ������ ������ �Ϸ� ������ ����
	        long diff = beginDate.getTime() - endDate.getTime();
	        // 1�� == 86400000
	        if(diff >= oneDate){
	        	diffDays = diff / (24 * 60 * 60 * 1000);
	        	unit = "��";
	        }
	        else if(diff >= oneHour){
	        	diffDays = diff / (60 * 60 * 1000);
	        	unit = "�ð�";
	        }
	        else if(diff >= oneMinute){
	        	diffDays = diff / (60 * 1000);
	        	unit = "��";
	        }
	        else{
	        	diffDays = diff / 1000;
	        	unit = "��";
	        }
	        
	        result = diffDays + unit;
	        
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}
	
}
