package projectDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MakeConnection {
	private static MakeConnection mc = null;
	final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String URL = "jdbc:oracle:thin:@orcl.c62yftb6zqan.ap-northeast-2.rds.amazonaws.com:1521:orcl";
	final private String ID = "beebee";
	final private String PW = "honeybee";
	Connection conn;
	
	private MakeConnection(){
		
	}
	
	public Connection getConnection(){
		if(conn == null){
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, ID, PW);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}
	public static MakeConnection getInstance(){
		if(mc == null){
			mc = new MakeConnection();
		}
		return mc;
	}
}
