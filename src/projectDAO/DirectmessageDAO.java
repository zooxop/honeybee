package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.DirectmessageVO;

public class DirectmessageDAO {
	Connection conn;
	ResultSet rs;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;

	public DirectmessageDAO() {
		conn = MakeConnection.getInstance().getConnection();
	}

	// 전체조회
	public ArrayList<DirectmessageVO> selectAll(int messagenum) {
		ArrayList<DirectmessageVO> list = new ArrayList<DirectmessageVO>();
		sb.setLength(0);
		sb.append("select messagenum, receivenick, imgroute, contents, time, memberno ");
		sb.append("from directmessage where messagenum=?");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, messagenum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String receivenick = rs.getString("receivenick");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				String time = rs.getString("time");
				int memberno = rs.getInt("memberno");
				DirectmessageVO vo = new DirectmessageVO(messagenum, receivenick, imgroute, contents, time,
						memberno);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 1건 조회
	public DirectmessageVO selectOne(int messagenum) {
		sb.setLength(0);
		sb.append("SELECT messagenum, receivenick, imgroute, contents, time, memberno ");
		sb.append("FROM directmessage WHERE messagenum=?");
		DirectmessageVO vo = null;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, messagenum);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String receivenick = rs.getString("receivenick");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				String time = rs.getString("time");
				int memberno = rs.getInt("memberno");
				vo = new DirectmessageVO(messagenum, receivenick, imgroute, contents, time, memberno);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	// 메세지 입력
	public void insertOne(DirectmessageVO vo) {
		sb.setLength(0);
		sb.append("INSERT INTO directmessage VALUES (directmessage_messagenum_seq.nextval, ?, ?, ?, sysdate, ?) ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getReceivenick());
			pstmt.setString(2, vo.getImgroute());
			pstmt.setString(3, vo.getContents());
			pstmt.setInt(4, vo.getMemberno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 다이렉트메세지 삭제
	public void deleteOne(int messagenum){
		sb.setLength(0);
		sb.append("DELETE directmessage WHERE messagenum = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, messagenum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 자원반납
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
