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
			Properties pgProps = new Properties();
			if (dbUser != null && dbUser.trim().length() > 0) pgProps.setProperty("user", dbUser);
			if (dbPass != null) pgProps.setProperty("password", dbPass);

			if (dbUrl != null && dbUrl.trim().length() > 0) {
				String raw = dbUrl.trim();
				if (raw.startsWith("jdbc:")) {
					raw = raw.substring(5);
				}
				if (raw.startsWith("postgres://")) {
					raw = "postgresql://" + raw.substring("postgres://".length());
				}

				if (raw.startsWith("postgresql://")) {
					java.net.URI uri = new java.net.URI(raw);
					String host = uri.getHost();
					int port = uri.getPort() > 0 ? uri.getPort() : 5432;
					String path = uri.getPath();
					String urlDb = (path != null && path.length() > 1) ? path.substring(1) : dbName;
					jdbcUrl = "jdbc:postgresql://" + host + ":" + port + "/" + urlDb;

					String userInfo = uri.getUserInfo();
					if (userInfo != null && userInfo.contains(":")) {
						String[] up = userInfo.split(":", 2);
						if (!pgProps.containsKey("user") || pgProps.getProperty("user").trim().length() == 0) pgProps.setProperty("user", up[0]);
						if (!pgProps.containsKey("password")) pgProps.setProperty("password", up[1]);
					}
				} else {
					jdbcUrl = "jdbc:" + raw;
				}
			} else {
				jdbcUrl = "jdbc:postgresql://" + dbHost + ":" + dbPort + "/" + dbName;
			}

			connection = DriverManager.getConnection(jdbcUrl, pgProps);
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