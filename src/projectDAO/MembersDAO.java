package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import projectVO.BoardsVO;
import projectVO.MembersVO;

public class MembersDAO {
	
	Connection conn;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;
	ResultSet rs;

	public MembersDAO(){
		conn = MakeConnection.getInstance().getConnection();
	}
	
	public ArrayList<MembersVO> selectAll(MembersVO vo){
		ArrayList<MembersVO> list = new ArrayList<MembersVO>();
		
		sb.setLength(0);
		sb.append(" select memberno, id, nickname, pw, question, answer, profileimg, phone, birthday from members ");
		sb.append(" where memberno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getMemberno());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				String id = rs.getString(vo.getId());
				String nickname = rs.getString(vo.getNickname());
				String pw = rs.getString(vo.getPw());
				String question = rs.getString(vo.getQuestion());
				String answer = rs.getString(vo.getAnswer());
				String profileimg = rs.getString(vo.getProfileimg());
				String phone = rs.getString(vo.getPhone());
				String birthday = rs.getString(vo.getBirthday());
			vo = 
				new MembersVO(id, nickname, pw, question, answer, profileimg, phone, birthday);
			list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public boolean checkID(String id){
		sb.setLength(0);
		sb.append("select id from members where id = ? ");
		
		boolean checkID = false;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			checkID = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return checkID;
	}
	
	public boolean checkNick(String id){
		sb.setLength(0);
		sb.append("select nickname from members where nickname = ? ");
		
		boolean checkNick = false;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			checkNick = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return checkNick;
	}
	
	public MembersVO selectOne(String id){
		sb.setLength(0);
		sb.append("select memberno, id, nickname, pw, question, answer, profileimg, phone, birthday ");
		sb.append("from members where id=?");
		
		MembersVO vo = new MembersVO();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			vo.setMemberno(rs.getInt("memberno"));
			vo.setId(rs.getString("id"));
			vo.setNickname(rs.getString("nickname"));
			vo.setPw(rs.getString("pw"));
			vo.setQuestion(rs.getString("question"));
			vo.setAnswer(rs.getString("answer"));
			vo.setProfileimg(rs.getString("profileimg"));
			vo.setPhone(rs.getString("phone"));
			vo.setBirthday(rs.getString("birthday"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return vo;
	}
	
	public MembersVO selectOneNo(int no){
		sb.setLength(0);
		sb.append("select memberno, id, nickname, pw, question, answer, profileimg, phone, birthday ");
		sb.append("from members where memberno = ?");
		
		MembersVO vo = new MembersVO();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			rs.next();
			vo.setMemberno(rs.getInt("memberno"));
			vo.setId(rs.getString("id"));
			vo.setNickname(rs.getString("nickname"));
			vo.setPw(rs.getString("pw"));
			vo.setQuestion(rs.getString("question"));
			vo.setAnswer(rs.getString("answer"));
			vo.setProfileimg(rs.getString("profileimg"));
			vo.setPhone(rs.getString("phone"));
			vo.setBirthday(rs.getString("birthday"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return vo;
	}
	
	public boolean isExist(String id, String pw){
		sb.setLength(0);
		sb.append("select memberno ");
		sb.append("from members where id=? and pw=? ");
		boolean exist = false;
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			exist = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
		return exist;
	}
	
	public void insertOne(MembersVO vo){
		sb.setLength(0);
		sb.append("insert into members ");
		sb.append(" values(members_memberno_seq.nextval, ?, ? ,? ,? ,? ,? ,? ,? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPw());
			pstmt.setString(4, vo.getQuestion());
			pstmt.setString(5, vo.getAnswer());
			pstmt.setString(6, vo.getProfileimg());
			pstmt.setString(7, vo.getPhone());
			pstmt.setString(8, vo.getBirthday());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void deleteOne(int vo){
		sb.setLength(0);
		sb.append("delete members where memberno = ? ");
		// ? : 회원번호
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void updateOne(MembersVO vo){
		
		sb.setLength(0);
		sb.append("Update members " );
		sb.append("SET nickname = ?, pw = ? ");
		sb.append("where memberno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getNickname());
			pstmt.setString(2, vo.getPw());
			pstmt.setInt(3, vo.getMemberno());
			
						
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}
	
public void updateImg(MembersVO vo){
		
		sb.setLength(0);
		sb.append("Update members " );
		sb.append("SET Profileimg = ? ");
		sb.append("where memberno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getProfileimg());
			pstmt.setInt(2, vo.getMemberno());
			
						
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close();
	}
	
	public ArrayList<MembersVO> searchRs(String str){
		ArrayList<MembersVO> list = new ArrayList<MembersVO>();
		
		sb.setLength(0);
		sb.append("select id, nickname, pw, question, answer, profileimg, phone, birthday, memberno ");
		sb.append("from members where nickname like ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, str);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				MembersVO vo;
				String id = rs.getString("id");
				String nickname = rs.getString("nickname");
				String pw = rs.getString("pw");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				String profileimg = rs.getString("profileimg");
				String phone = rs.getString("phone");
				String birthday = rs.getString("birthday");
				int memberno = rs.getInt("memberno");
				vo = new MembersVO(memberno, id, nickname, pw, question, answer, profileimg, phone, birthday);
				list.add(vo);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
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
