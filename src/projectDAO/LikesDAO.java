package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.LikesVO;

public class LikesDAO {
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	
	public LikesDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
	}
	
	public ArrayList<LikesVO> selectAll(int bno){
		ArrayList<LikesVO> list = new ArrayList<LikesVO>();
		
		sb.setLength(0);
		sb.append(" select adminnum, time, boardno, memberno from likes ");
		sb.append(" where boardno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				LikesVO vo = new LikesVO();
				vo.setAdminnum(rs.getInt("adminnum"));
				vo.setTime(rs.getString("time"));
				vo.setMemberno(rs.getInt("memberno"));
				vo.setBoardno(rs.getInt("boardno"));
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public int selectCount(int bno){
		sb.setLength(0);
		sb.append(" select count(*) cnt from likes ");
		sb.append(" where boardno = ? ");
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			rs.next();
			cnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return cnt;
	}
	
	public void insertOne(int bno, int mno){
		sb.setLength(0);
		sb.append("insert into likes ");
		sb.append("values(likes_adminnum_seq.nextval, sysdate, ?, ?) ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.setInt(2, mno);
			
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	public boolean isExist(int bno, int mno){
		sb.setLength(0);
		sb.append("select adminnum from likes where boardno = ? and memberno = ? ");
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.setInt(2, mno);
			rs = pstmt.executeQuery();
			exist = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return exist;
	}
	public void deleteOne(int bno, int mno){
		sb.setLength(0);
		sb.append("delete from likes where boardno = ? and memberno = ? ");
		// ? : 게시글 번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.setInt(2, mno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	public void deleteAll(int bno){
		sb.setLength(0);
		sb.append("delete from likes where boardno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
