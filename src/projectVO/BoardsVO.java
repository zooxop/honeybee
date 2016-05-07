package projectVO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardsVO {
	int boardno;
	String imgroute, contents; 
	int isgroup;
	int memberno;
	String time;
	
	
	
	public BoardsVO(){}
	
	public BoardsVO(int boardno, String imgroute, String contents, int isgroup, int memberno, String time) {
		this.boardno = boardno;
		this.imgroute = imgroute;
		this.contents = contents;
		this.isgroup = isgroup;
		this.memberno = memberno;
		this.time = time;
	}
	
	public BoardsVO(int boardno, String imgroute, String contents, int isgroup, int memberno) {
		this.boardno = boardno;
		this.imgroute = imgroute;
		this.contents = contents;
		this.isgroup = isgroup;
		this.memberno = memberno;
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
	public int getIsgroup() {
		return isgroup;
	}
	public void setIsgroup(int isgroup) {
		this.isgroup = isgroup;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	public String doDiffOfDate(String today){
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
	        
	     // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	        long diff = beginDate.getTime() - endDate.getTime();
	        // 1일 == 86400000
	        if(diff >= oneDate){
	        	diffDays = diff / (24 * 60 * 60 * 1000);
	        	unit = "일";
	        }
	        else if(diff >= oneHour){
	        	diffDays = diff / (60 * 60 * 1000);
	        	unit = "시간";
	        }
	        else if(diff >= oneMinute){
	        	diffDays = diff / (60 * 1000);
	        	unit = "분";
	        }
	        else{
	        	diffDays = diff / 1000;
	        	unit = "초";
	        }
	        
	        result = diffDays + unit;
	        
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}
	
}
