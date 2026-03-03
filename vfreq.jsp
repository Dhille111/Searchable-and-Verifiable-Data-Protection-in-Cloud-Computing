

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


        
            <table width="755" border="1" align="center">
  <tr>
   <td ><div align="center"><span class="style3"><strong>EndUser Name</strong></span></div></td>
      <td ><div align="center"><span class="style3"><strong>File Request</strong> </span></div></td>
   
     <td ><div align="center"><span class="style3"><strong>Req Date Time</strong></span></div></td>
      <td ><div align="center"><span class="style3"><strong>Processed Status</strong> </span></div></td>
 
   
  </tr>
        
     <%
             	String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
             	int i = 0, j = 0, k = 0;
             	String fname = request.getParameter("fn");
             	try {

             		String query = "select * from pusg_userrequest ";
             		Statement st = connection.createStatement();
             		ResultSet rs = st.executeQuery(query);
             		while (rs.next()) {
             			s1 = rs.getString(1);
             			s2 = rs.getString(2);
             			s3 = rs.getString(3);
             			s4 = rs.getString(4);
             			s5 = rs.getString(5);
             			
             %>
		

  <tr>
		<td height="29">
		<div align="center"><%=s1%></div>
		</td>
		<td>
		<div align="center"><%=s2%></div>
		</td>

		
		<td height="29">
		<div align="center"><%=s3%></div>
		</td>

		
	
		
		<%if(!s5.equalsIgnoreCase("Waiting"))
		{%>
		<td height="29">
			<div align="center"><%=s5%></div>
		
		</td>
		<%}
		else
		{%>
		<td height="29">
	<div align="center"><a href="Process.jsp?ename=<%=s1%>&fname=<%=s2%>"><%=s5%></a></div>
		</td>
	<%	}%>
		
	
	</tr>

<%
	}

		connection.close();
	}

	catch (Exception e) {
		out.println(e.getMessage());
	}
%>


</table>