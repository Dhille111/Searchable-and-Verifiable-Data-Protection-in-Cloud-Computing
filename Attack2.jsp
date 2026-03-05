
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
	<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<html>
<style type="text/css">
<!--
.style3 {color: #FFFFFF; font-weight: bold; }
-->
</style>
<%
String aname=request.getParameter("aname");
String file=request.getParameter("fname");
String block=request.getParameter("block");
String domain=request.getParameter("domain");
String owner=request.getParameter("owner");

try
{
String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			String cont="";
			if(block.equalsIgnoreCase("Block-1"))
			{
			
			query2="select ct1 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			if(block.equalsIgnoreCase("Block-2"))
			{
			
			query2="select ct2 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"' ";
			}
			if(block.equalsIgnoreCase("Block-3"))
			{
			
			query2="select ct3 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			if(block.equalsIgnoreCase("Block-4"))
			{
			
						query2="select ct4 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query2);
				
			ResultSet rs=connection.createStatement().executeQuery("select * from pusg_attacker where username='"+aname+"'");
			if(rs.next())
			{
			%>
			<h1>Sorry You are Blocked</h1>
			<%
			}
			else
			{
			if(rs1.next())
			{
			cont=rs1.getString(1);
			
			}
			else
			{
			%>
			<h2>File Not Exist<h2>
			<%
			}
			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(cont.getBytes()));

%>
<form method="post" action="Attack3.jsp">
<table width="755" border="1" align="center" >
<tr><td align="center" bgcolor="#FF0000"><span class="style3">User Name</span></td>
<td><input type="text" value="<%=aname%>"  name="aname"/> </td></tr>
<tr><td align="center" bgcolor="#FF0000"><span class="style3">File Name</span></td>
<td><input type="text"  value="<%=file%>" name="fname"/> </td></tr>
<tr><td align="center" bgcolor="#FF0000"><span class="style3">Select Block</span></td>
<td> <input type="text"  value="<%=block%>" name="block"/></td></tr>
<tr><td align="center" bgcolor="#FF0000"><span class="style3">Owner Name</span></td>
<td> <input type="text"  value="<%=owner%>" name="owner"/></td></tr>
<tr> <td align="center" bgcolor="#FF0000"><span class="style3">Select the Domain</span></td>
<td><input type="text"  value="<%=domain%>" name="domain"/></td></tr>
<tr> <td align="center" bgcolor="#FF0000"><span class="style3">File Contents</span></td>
<td><textarea name="cont" id="textarea" cols="82" rows="20"><%=decryptedValue%></textarea></td></tr>


<tr> <td colspan="2" align="center"><input type="submit" value="Submit"/></td></table>
<%
}
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>