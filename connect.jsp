<title></title>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	Connection connection = null;
	try {
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

		String dbType = System.getenv("DB_TYPE");
		if (dbType == null || dbType.trim().length() == 0) {
			dbType = "5432".equals(dbPort) ? "postgres" : "mysql";
		}

		if ("postgres".equalsIgnoreCase(dbType) || "postgresql".equalsIgnoreCase(dbType)) {
			Class.forName("org.postgresql.Driver");
			String dbUrl = System.getenv("DB_URL");
			if (dbUrl == null || dbUrl.trim().length() == 0) {
				if (dbHost.startsWith("jdbc:postgresql://") || dbHost.startsWith("postgresql://") || dbHost.startsWith("postgres://")) {
					dbUrl = dbHost;
				}
			}

			String jdbcUrl;
			if (dbUrl != null && dbUrl.trim().length() > 0) {
				jdbcUrl = dbUrl.trim();
				if (jdbcUrl.startsWith("postgres://")) {
					jdbcUrl = "postgresql://" + jdbcUrl.substring("postgres://".length());
				}
				if (!jdbcUrl.startsWith("jdbc:")) {
					jdbcUrl = "jdbc:" + jdbcUrl;
				}
			} else {
				jdbcUrl = "jdbc:postgresql://" + dbHost + ":" + dbPort + "/" + dbName;
			}

			if ((dbUrl != null && dbUrl.contains("@")) || (dbHost != null && (dbHost.startsWith("jdbc:postgresql://") || dbHost.startsWith("postgresql://") || dbHost.startsWith("postgres://")) && dbHost.contains("@"))) {
				connection = DriverManager.getConnection(jdbcUrl);
			} else {
				connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
			}
		} else {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException ex) {
				Class.forName("com.mysql.jdbc.Driver");
			}

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
				throw new SQLException("Unable to connect to MySQL database '" + dbName + "'. " + err + " Verify DB settings in environment variables.");
			}
		}
	} catch (Exception e) {
		throw new RuntimeException(e);
	}
%>