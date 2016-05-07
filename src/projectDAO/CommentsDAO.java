package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.CommentsVO;

public class CommentsDAO {

	Connection conn;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;
	ResultSet rs;

	public CommentsDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
		//System.out.println("conn : " + conn);
	}
	
	public ArrayList<CommentsVO> selectThree(int bno){
		ArrayList<CommentsVO> list = new ArrayList<CommentsVO>();
		sb.setLength(0);
		sb.append("select adminnum, contents, time, memberno, boardno ");
		sb.append("from comments where boardno = ? order by time desc");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommentsVO cvo = new CommentsVO();
				cvo.setBoardno(rs.getInt("adminnum"));
				cvo.setContents(rs.getString("contents"));
				cvo.setTime(rs.getString("time"));
				cvo.setMemberno(rs.getInt("memberno"));
				list.add(cvo);
				cnt++;
				if(cnt >= 3){
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public ArrayList<CommentsVO> selectAll(int bno){
		ArrayList<CommentsVO> list = new ArrayList<CommentsVO>();
		
		sb.setLength(0);
		sb.append("select adminnum, contents, time, memberno, boardno ");
		sb.append("from comments where boardno = ? order by time");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CommentsVO cvo = new CommentsVO();
				cvo.setAdminnum(rs.getInt("adminnum"));
				cvo.setBoardno(rs.getInt("Boardno"));
				cvo.setContents(rs.getString("contents"));
				cvo.setTime(rs.getString("time"));
				cvo.setMemberno(rs.getInt("memberno"));
				list.add(cvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public void insertOne(int bno, String contents, int mno){
		sb.setLength(0);
		sb.append("insert into comments ");
		sb.append("values(comments_adminnum_seq.nextval, ?, sysdate, ?, ?)");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, contents);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, bno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void deleteAll(int no){
		sb.setLength(0);
		sb.append("delete comments where boardno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void deleteOne(int no){
		sb.setLength(0);
		sb.append("delete comments where adminnum = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void close(){
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}