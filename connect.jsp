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
						pgProps.setProperty("user", up[0]);
						pgProps.setProperty("password", up[1]);
					}
				} else {
					jdbcUrl = "jdbc:" + raw;
				}
			} else {
				jdbcUrl = "jdbc:postgresql://" + dbHost + ":" + dbPort + "/" + dbName;
			}

			connection = DriverManager.getConnection(jdbcUrl, pgProps);

			Statement ddl = connection.createStatement();
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_owner (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, addr TEXT, dob TEXT, gender TEXT, pin TEXT, location TEXT, imagess BYTEA)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_user (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, addr TEXT, dob TEXT, gender TEXT, pin TEXT, location TEXT, imagess BYTEA)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS ttp (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS domain_manager (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS cloud_server (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_trust (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_domain (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_cloud (id SERIAL PRIMARY KEY, name TEXT, pass TEXT, email TEXT, mobile TEXT, address TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_domains (domain TEXT PRIMARY KEY)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_cloudserver (fname TEXT, ownername TEXT, cname TEXT, ct1 TEXT, mac1 TEXT, ct2 TEXT, mac2 TEXT, ct3 TEXT, mac3 TEXT, ct4 TEXT, mac4 TEXT, sk TEXT, dt TEXT, domain TEXT, per TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_ttp (fname TEXT, ownername TEXT, cname TEXT, mac1 TEXT, mac2 TEXT, mac3 TEXT, mac4 TEXT, sk TEXT, dt TEXT, domain TEXT, per TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_userrequest (username TEXT, fnamereq TEXT, reqdate TEXT, resdate TEXT, resstatus TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS results (fname TEXT, ttime TEXT, tpt TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_attacker (user TEXT, fname TEXT, block TEXT, domain TEXT, ownername TEXT, mac TEXT, sk TEXT, dt TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}
			try {
				ddl.executeUpdate("CREATE TABLE IF NOT EXISTS pusg_blockeduser (user TEXT, fname TEXT, ownername TEXT, sk TEXT, dt TEXT)");
			} catch (SQLException se) {
				if (!"42P07".equals(se.getSQLState()) && (se.getMessage() == null || se.getMessage().toLowerCase().indexOf("already exists") < 0)) {
					throw se;
				}
			}

			ddl.executeUpdate("INSERT INTO ttp(name,pass,email,mobile,address) SELECT 'ttpadmin','1234','ttp@svdp.com','9000000001','TTP HQ' WHERE NOT EXISTS (SELECT 1 FROM ttp WHERE name='ttpadmin')");
			ddl.executeUpdate("INSERT INTO domain_manager(name,pass,email,mobile,address) SELECT 'domainadmin','1234','domain@svdp.com','9000000002','Domain HQ' WHERE NOT EXISTS (SELECT 1 FROM domain_manager WHERE name='domainadmin')");
			ddl.executeUpdate("INSERT INTO cloud_server(name,pass,email,mobile,address) SELECT 'cloudadmin','1234','cloud@svdp.com','9000000003','Cloud HQ' WHERE NOT EXISTS (SELECT 1 FROM cloud_server WHERE name='cloudadmin')");
			ddl.executeUpdate("INSERT INTO pusg_trust(name,pass,email,mobile,address) SELECT 'ttpadmin','1234','ttp@svdp.com','9000000001','TTP HQ' WHERE NOT EXISTS (SELECT 1 FROM pusg_trust WHERE name='ttpadmin')");
			ddl.executeUpdate("INSERT INTO pusg_domain(name,pass,email,mobile,address) SELECT 'domainadmin','1234','domain@svdp.com','9000000002','Domain HQ' WHERE NOT EXISTS (SELECT 1 FROM pusg_domain WHERE name='domainadmin')");
			ddl.executeUpdate("INSERT INTO pusg_cloud(name,pass,email,mobile,address) SELECT 'cloudadmin','1234','cloud@svdp.com','9000000003','Cloud HQ' WHERE NOT EXISTS (SELECT 1 FROM pusg_cloud WHERE name='cloudadmin')");
			ddl.executeUpdate("INSERT INTO pusg_domains(domain) SELECT 'General' WHERE NOT EXISTS (SELECT 1 FROM pusg_domains WHERE domain='General')");
			ddl.close();
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