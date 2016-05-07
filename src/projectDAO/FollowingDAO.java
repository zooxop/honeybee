package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.FollowingVO;

public class FollowingDAO {
	
	Connection conn;
	StringBuffer sb = new StringBuffer();
	ResultSet rs;
	PreparedStatement pstmt;
	
	public FollowingDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
	}
	
	public ArrayList<FollowingVO> selectAll(int no){
		ArrayList<FollowingVO> list = new ArrayList<FollowingVO>();
		
		sb.setLength(0);
		sb.append(" select adminnum, followingnick, memberno, followingmno from following ");
		sb.append(" where memberno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int adminnum = rs.getInt("adminnum");
				String followingnick = rs.getString("followingnick");
				int memberno = rs.getInt("memberno");
				int followingmno = rs.getInt("followingmno");
			
			FollowingVO vo = new FollowingVO(adminnum, followingnick, memberno, followingmno);
			list.add(vo);	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	
	public int selectCount(int no){
		sb.setLength(0);
		sb.append(" select count(*) cnt from following where memberno = ? ");
		
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	public ArrayList<Integer> selectMemberno(int no){
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		sb.setLength(0);
		sb.append(" select followingmno from following ");
		sb.append(" where memberno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int Memberno = rs.getInt("followingmno");
			
			list.add(Memberno);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public void insertOne(int followingNo, int userNo){
		sb.setLength(0);
		sb.append("insert into following ");
		sb.append(" values(following_adminnum_seq.nextval, ?, ?, ?) "); //첫번 째? : FollowingNick, 두번째? : memberno
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "a");
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, followingNo);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void deleteOne(int followingNo, int userNo){
		sb.setLength(0);
		sb.append("delete from following where memberno = ? and followingMno = ? ");
		// 첫번째 ? : Memberno의 값
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, followingNo);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public boolean isExist(int FollowingMno, int userMno){
		sb.setLength(0);
		sb.append("select adminnum from following where followingmno = ? and memberno = ? ");
		
		boolean exist = false;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, FollowingMno);
			pstmt.setInt(2, userMno);
			rs = pstmt.executeQuery();
			
			exist = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return exist;
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