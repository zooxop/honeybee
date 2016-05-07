package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.DMcommentsVO;

public class DMcommentsDAO {
	Connection conn;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;

	public DMcommentsDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	// 전체조회
	public ArrayList<DMcommentsVO> selectAll(int adminnum) {
		ArrayList<DMcommentsVO> list = new ArrayList<DMcommentsVO>();
		sb.setLength(0);
		sb.append("select * from dmcomments where adminnum=?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, adminnum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String contents = rs.getString("contents");
				int memberno = rs.getInt("memberno");
				String time = rs.getString("time");
				int messagenum = rs.getInt("messagenum");
				DMcommentsVO vo = new DMcommentsVO(adminnum, contents, memberno, time, messagenum);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void insertOne(DMcommentsVO vo) {
		sb.setLength(0);
		sb.append("insert into dmcomments ");
		sb.append("values(dmcommnets_adminnum_seq.nextval, ?, ?, sysdate, ?");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getContents());
			pstmt.setInt(2, vo.getMemberno());
			pstmt.setInt(3, vo.getMessagenum());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteOne(DMcommentsVO vo) {
		sb.setLength(0);
		sb.append("delete dmcomments where adminnum = ? ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getAdminnum());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
