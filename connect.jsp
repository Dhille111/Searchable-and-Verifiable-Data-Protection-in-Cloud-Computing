<title></title>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	Connection connection = null;
	try {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			Class.forName("com.mysql.jdbc.Driver");
		}

		String dbHost = System.getenv("DB_HOST");
		if (dbHost == null || dbHost.trim().length() == 0) dbHost = "localhost";
		String dbPort = System.getenv("DB_PORT");
		if (dbPort == null || dbPort.trim().length() == 0) dbPort = "3306";
		String dbName = System.getenv("DB_NAME");
		if (dbName == null || dbName.trim().length() == 0) dbName = "svdp";
		String dbUser = System.getenv("DB_USER");
		if (dbUser == null || dbUser.trim().length() == 0) dbUser = "root";
		String dbPass = System.getenv("DB_PASS");
		if (dbPass == null) dbPass = "";

		String jdbcUrl = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
		String[][] credentials = {
			{dbUser, dbPass},
			{"root", "Root@1234"},
			{"root", "root"},
			{"root", ""}
		};
		SQLException lastError = null;

		for (int i = 0; i < credentials.length; i++) {
			try {
				connection = DriverManager.getConnection(jdbcUrl, credentials[i][0], credentials[i][1]);
				break;
			} catch (SQLException ex) {
				lastError = ex;
			}
		}

		if (connection == null) {
			String err = (lastError == null) ? "Unknown database connection error" : lastError.getMessage();
			throw new SQLException("Unable to connect to MySQL database 'svdp'. " + err + " Verify MySQL is running and import database/Database.sql, then check username/password in connect.jsp.");
		}
	} catch (Exception e) {
		throw new RuntimeException(e);
	}
%>