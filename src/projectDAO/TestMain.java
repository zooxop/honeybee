package projectDAO;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import projectVO.BoardsVO;

public class TestMain {
	public static void main(String[] args){
		/*BoardsDAO dao = new BoardsDAO();
		Date today = new Date ( );
		Calendar cal = Calendar.getInstance ( );
		cal.setTime ( today );// 오늘로 설정. 
		
		ArrayList<BoardsVO> list = dao.selectAll(1);
		for(BoardsVO vo : list){  // String으로 날짜를 리턴.
			System.out.println(vo.getTime());
		}
		System.out.println(today);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String now = sdf.format(today);
		System.out.println(now);*/
		doDiffOfDate();
		
	}
	
	
	public static void doDiffOfDate(){  // 1000 == 1초
	    String start = "2016-03-25 03:00:00";
	    String end = "2016-03-25 11:00:00";
	    long diffDays = 0;
	    long oneDate = 86400000;
	    long oneHour = 3600000;
	    long oneMinute = 60000;
	    String unit = null;
	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        Date beginDate = formatter.parse(start);
	        Date endDate = formatter.parse(end);
	        

	         
	        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
	        long diff = endDate.getTime() - beginDate.getTime();
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
	        System.out.println("diff = " + diff);
	        System.out.println("날짜차이 = " + diffDays + unit);
	        
	        String result = diffDays + unit;
	        
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	}
}
