package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.FollowerVO;

public class FollowerDAO {
	
	Connection conn;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;
	ResultSet rs;

	public FollowerDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
		//System.out.println("conn : " + conn);
	}
	
	public ArrayList<FollowerVO> selectAll(int no){
		ArrayList<FollowerVO> list = new ArrayList<FollowerVO>();
		
		sb.setLength(0);
		sb.append(" select adminnum, followernick, memberno, followermno from follower ");
		sb.append(" where memberno = ? ");
		// ? : 회원번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int adminnum = rs.getInt("adminnum");
				String followernick = rs.getString("followernick");
				int memberno = rs.getInt("memberno");
				int followermno = rs.getInt("followermno");
			FollowerVO vo = 
				new FollowerVO(adminnum, followernick, memberno, followermno);
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
		sb.append(" select count(*) cnt from follower ");
		sb.append(" where memberno = ? ");
		// ? : 회원번호
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			rs.next();
			cnt = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	
	public void insertOne(int mno, int fno){
		sb.setLength(0);
		sb.append("insert into follower ");
		sb.append("values(follower_adminnum_seq.nextval, 'a', ?, ?) ");
		// 
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, fno);
			pstmt.setInt(2, mno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void deleteOne(int fno, int mno){
		sb.setLength(0);
		sb.append("delete follower where memberno = ? and followermno = ? ");
		// ? = 회원번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, mno);
			pstmt.setInt(2, fno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void updateOne(FollowerVO vo){
		
		sb.setLength(0);
		sb.append("Update follower " );
		sb.append("SET adminnum = ? , followernick = ? ");
		sb.append(" where memberno = ? ");
		// ?1 : adminnum, ?2 : 팔로워 닉네임, ?3 = 회원번호.
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAdminnum());
			pstmt.setString(2, vo.getFollowernick());
			pstmt.setInt(3, vo.getMemberno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
