package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnDB {

	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	private final static String URL = "jdbc:mysql://localhost:3306/gadgets_store?useTimezone=true&serverTimezone=UTC";
	private final static String USUARIO = "root";
	private final static String SENHA = "qwe123";

	private static Connection conn = null;

	// ESTABELECE UMA CONEXAO
	public static Connection getConnection() {
		if (conn == null) {
			try {
				Class.forName(DRIVER);
				conn = DriverManager.getConnection(URL, USUARIO, SENHA);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	// FECHA UMA CONEXAO
	public static void closeConnection() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				throw new DbException(e.getMessage());
			}
		}
	}

	// FECHA UM STATEMENT
	public static void closeStatement(Statement st) {
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				throw new DbException(e.getMessage());
			}
		}
	}

	// FECHA UM RESULTSET
	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				throw new DbException(e.getMessage());
			}
		}
	}

}
