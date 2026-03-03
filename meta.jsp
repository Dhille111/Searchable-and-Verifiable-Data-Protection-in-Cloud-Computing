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
	<html>
	<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
    </style>
	
<%

      	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9,s10,s11,s12,s13="";
	int i=0,j=0;
String ii="";
      	try 
	{
        
           String query="select * from pusg_ttp "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
	s1=rs.getString("fname");
		s2=rs.getString("ownername");
		
		s3=rs.getString("mac1");
		s4=rs.getString("mac2");
		s5=rs.getString("mac3");
		s6=rs.getString("mac4");
		s7=rs.getString("sk");
		s8=rs.getString("domain");

		
		
%>


<table width="755" border="1" align="center">
  <tr>
    <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>File Name </b></span></div></td> 
    <td><div align="center"><%=s1%></div></td></tr>
       <tr> <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>Owner Name </b></span></div></td>
       <td><div align="center"><%=s2%></div></td></tr>
    <tr> <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>MAC-1</b></span></div></td>
    <td><div align="center"><%=s3%></div></td></tr>
   <tr>
    <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>MAC-2</b></span></div></td> 
    <td><div align="center"><%=s4%></div></td></tr>
        <tr><td bgcolor="#FF0000"><div align="center" class="style1"><span class="style3"><b>MAC-3</b></span></div></td>
        <td><div align="center"><%=s5%></div></td></tr>
<tr>    <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>MAC-4</b></span></div></td>
<td><div align="center"><%=s6%></div></td></tr>
   <tr>	<td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>Sk</b></span></div></td> 
   <td><div align="center"><%=s7%></div></td></tr>
	<tr>  <td bgcolor="#FF0000" ><div align="center" class="style1"><span class="style3"><b>Domain</b></span></div></td> 
	<td><div align="center"><%=s8%></div></td></tr>
	<tr>   <td colspan="2" height="20" bgcolor="#00FF00"><div align="center"></div></td></tr>
</table>

<%

	 
	   }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>



</html>