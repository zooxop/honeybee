package projectDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import projectVO.BoardsVO;

public class BoardsDAO {

	Connection conn;
	StringBuffer sb = new StringBuffer();
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardsDAO(){
		MakeConnection mc = MakeConnection.getInstance();
		conn = mc.getConnection();
	}
	
	   // 리팩토링 필요함 : 10개의 데이터만 가져오는것이 아닌 모든데이터를 가져온 후, 10개를 표시하는 중.
	public ArrayList<BoardsVO> selectTen(ArrayList<Integer> flist, int more){
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		more = more*10;
		int count = 0;
		int cntFollowing = 0;
		try {
			sb.setLength(0);
			sb.append(" select boardno, imgroute, contents, isgroup, memberno, time from boards where memberno = 0 ");
			
			for(int i = 0; i < flist.size(); i++){
				sb.append(" or memberno = ? ");
				cntFollowing++;
			}
			
			sb.append(" order by time desc ");
			pstmt = conn.prepareStatement(sb.toString());
			for(int i = 0; i<cntFollowing; i++){
				pstmt.setInt(i+1, flist.get(i));
			}
			rs = pstmt.executeQuery();
			
			for(int i = 0; i<more; i++){
				if(rs.next()){
					continue;
				}
				else{
					break;
				}
			}
			while(rs.next()){
				BoardsVO vo = new BoardsVO();
				int boardno = rs.getInt("boardno");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				int isgroup = rs.getInt("isgroup");
				int memberno = rs.getInt("memberno");
				String time = rs.getString("time");
				vo = new BoardsVO(boardno, imgroute, contents, isgroup, memberno, time);
				list.add(vo);
				count++;
				if(count >= 10){
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	
	
	/*public ArrayList<BoardsVO> selectTen(int no){
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		
		int count = 0;
		sb.setLength(0);
		sb.append(" select boardno, imgroute, contents, isgroup, memberno from boards ");
		sb.append(" where memberno = ? ");
		// ? = 회원번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardsVO vo = new BoardsVO();
				int boardno = rs.getInt("boardno");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				String isgroup = rs.getString("isgroup");
				int memberno = rs.getInt("memberno");
				String time = rs.getString("time");
				vo = new BoardsVO(boardno, imgroute, contents, isgroup, memberno, time);
				list.add(vo);
				count++;
				if(count >= 10){
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}*/
	
	public ArrayList<BoardsVO> selectAll(int no){  // 로그인한 유저의 게시물 전부 불러오기.
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		sb.setLength(0);
		sb.append("select boardno, imgroute, contents, isgroup, memberno, time from boards ");
		sb.append("where memberno = ?  order by time desc");
		// ? = 회원번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardsVO vo = new BoardsVO();
				int boardno = rs.getInt("boardno");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				int isgroup = rs.getInt("isgroup");
				int memberno = rs.getInt("memberno");
				String time = rs.getString("time");
				vo = new BoardsVO(boardno, imgroute, contents, isgroup, memberno, time);
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public void deleteOne(int no){
		sb.setLength(0);
		sb.append(" delete boards where boardno = ? ");
		// ? : 게시글 번호
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public void insertOne(BoardsVO vo){
		sb.setLength(0);
		sb.append("insert into boards ");
		sb.append(" values(boards_boardno_seq.nextval, ?, ?, ?, ?, sysdate )");
		
		/*
		?1 : 이미지 경로
		?2 : 내용
		?3 : 그룹여부
		?4 : 게시글번호	
		*/
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getImgroute());
			pstmt.setString(2, vo.getContents());
			pstmt.setInt(3, vo.getIsgroup());
			pstmt.setInt(4, vo.getMemberno());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
	}
	
	public ArrayList<BoardsVO> searchRs(String str){  // 검색 결과 표시
		ArrayList<BoardsVO> list = new ArrayList<BoardsVO>();
		
		sb.setLength(0);
		sb.append("select boardno, imgroute, contents, isgroup, memberno, time from boards ");
		sb.append(" where contents like ? ");
		sb.append(" order by time desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, str);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				BoardsVO vo = new BoardsVO();
				int boardno = rs.getInt("boardno");
				String imgroute = rs.getString("imgroute");
				String contents = rs.getString("contents");
				int isgroup = rs.getInt("isgroup");
				int memberno = rs.getInt("memberno");
				String time = rs.getString("time");
				vo = new BoardsVO(boardno, imgroute, contents, isgroup, memberno, time);
				list.add(vo);
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
	
	public void updateOne(BoardsVO vo){
		
		sb.setLength(0);
		sb.append("Update boards " );
		sb.append("SET boardno = ? , imgroute = ? , contents = ? , isgroup = ? ");
		sb.append("where memberno = ? ");
		/*
		 ?1 : 게시글 번호
		 ?2 : 이미지 경로
		 ?3 : 글 내용
		 ?4 : 그룹여부 파악
		 ?5 : 회원번호
		 */
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getBoardno());
			pstmt.setString(2, vo.getImgroute());
			pstmt.setString(3, vo.getContents());
			pstmt.setInt(4, vo.getIsgroup());
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}	
