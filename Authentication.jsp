<title>Authentication Page</title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String type=request.getParameter("type");
	
	String sql ="";
	try {
	if(type.equalsIgnoreCase("cloud"))
	{
		 sql = "SELECT 1 FROM cloud_server where username='" + name
				+ "' and password='" + pass + "' UNION SELECT 1 FROM pusg_cloud where name='" + name
				+ "' and pass='" + pass + "' ";
				}
				if(type.equalsIgnoreCase("trust"))
	{
		 sql = "SELECT 1 FROM ttp where username='" + name
				+ "' and password='" + pass + "' UNION SELECT 1 FROM pusg_trust where name='" + name
				+ "' and pass='" + pass + "' ";
				}
				if(type.equalsIgnoreCase("domain"))
	{
		 sql = "SELECT 1 FROM domain_manager where username='" + name
				+ "' and password='" + pass + "' UNION SELECT 1 FROM pusg_domain where name='" + name
				+ "' and pass='" + pass + "' ";
				}
				if(type.equalsIgnoreCase("user"))
	{
		 sql = "SELECT * FROM pusg_user where name='" + name
				+ "' and pass='" + pass + "' ";
				}
				if(type.equalsIgnoreCase("owner"))
	{
		 sql = "SELECT * FROM pusg_owner where name='" + name
				+ "' and pass='" + pass + "' ";
				}
				
		application.setAttribute("cname", name);

		
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			
if(type.equalsIgnoreCase("owner"))
{
		application.setAttribute("oname", name);
response.sendRedirect("O_MainPage.jsp");
}
if(type.equalsIgnoreCase("domain"))
{
		application.setAttribute("dname", name);
response.sendRedirect("D_MainPage.jsp");
}
	
	if(type.equalsIgnoreCase("user"))
{
		application.setAttribute("ename", name);
response.sendRedirect("E_MainPage.jsp");
}
	
	if(type.equalsIgnoreCase("trust"))
{
		application.setAttribute("tname", name);
response.sendRedirect("T_MainPage.jsp");
}
	
	if(type.equalsIgnoreCase("cloud"))
{
		application.setAttribute("cname", name);
response.sendRedirect("C_MainPage.jsp");
}
	
			
			

		} else {

			response.sendRedirect("wronglogin.html");
		}

	} catch (Exception e) {
		out.print(e);
		e.printStackTrace();
	}
	//Built By:Banu Prakash Gowda
	//Date:14-May-2016
	//Phone:8861090866
	//Email:banu.v07@gmail.com
%>

