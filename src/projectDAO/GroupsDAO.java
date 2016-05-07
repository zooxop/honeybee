package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.GroupsVO;

public class GroupsDAO {
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	StringBuffer sb = new StringBuffer();
	
	public GroupsDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
	}

	public ArrayList<GroupsVO> selectAll(int memberno){
		ArrayList<GroupsVO> list = new ArrayList<GroupsVO>();
		
		sb.setLength(0);
		sb.append(" select adminnum, groupno, name, admin, memberno from groups ");
		sb.append(" where memberno = ? ");
		// ? : 회원번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, memberno);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int adminnum = rs.getInt("adminnum");
				int groupno = rs.getInt("groupno");
				String name = rs.getString("name");
				String admin = rs.getString("admin");
				//int memberno = rs.getInt(memberno);
				String groupImg = rs.getString("groupimg");
			GroupsVO vo = 
				new GroupsVO(adminnum, groupno, name, admin, memberno, groupImg);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public void insertOne(GroupsVO vo){
		sb.setLength(0);
		sb.append("insert into comments ");
		sb.append("values(groups_adminnum_seq.nextval, ?, ?, ?, ?");
		// ?1 : groupno, ?2 : name, ?3 : admin, ?4 : memberno
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getGroupno());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getAdmin());
			pstmt.setInt(4, vo.getMemberno());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteOne(GroupsVO vo){
		sb.setLength(0);
		sb.append("delete groups where boardno = ? ");
		// ? : memberno
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getMemberno());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateOne(GroupsVO vo){
		
		sb.setLength(0);
		sb.append("Update groups " );
		sb.append("SET adminnum = ? , groupno = ? , name = ? , admin = ? ");
		sb.append(" where memberno = ? ");
		/*?1 : adminNum
		?2 : 그룹번호
		?3 : 그룹이름
		?4 : 그룹만든사람
		?5 : 회원번호*/
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAdminnum());
			pstmt.setInt(2, vo.getGroupno());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getAdmin());
			pstmt.setInt(5, vo.getMemberno());
			
			
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
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}