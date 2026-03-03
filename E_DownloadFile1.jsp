
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
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Download File</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style3 {color: #FFFFFF; font-weight: bold; }
.style4 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<div id="templatemo_header_wrapper">
    <div id="templatemo_header">
        <div id="site_title_section">
            <div id="site_title"></div>
            <div id="salogon">
	         A Searchable and Verifiable Data Protection Scheme for Scholarly Big Data</div>
            <div class="cleaner">&nbsp;</div>
        </div>
        
        <div id="search_section">
            <form action="#" method="get">
                <input type="text" name="q" size="10" id="searchfield" title="searchfield" />
                <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" />
            </form>
        </div>    
    </div> <!-- end of header -->
</div>  <!-- end of header wrapper -->

<div id="templatemo_banner_wrapper">
    <div id="templatemo_banner">
    
        <div id="banner_header_01"></div>
        <div id="banner_header_02"> A Searchable and Verifiable Data Protection Scheme for Scholarly Big Data.</div>
        <div id="banner_text">
            <p></p>
            <div class="rc_btn_01"><a href="#"></a></div>
        </div>
    </div>	<!-- end of banner -->
</div> <!-- end of banner wrapper -->

<div id="templatemo_menu_wrapper">    
    <div id="templatemo_menu">
        <ul>
            <li> <a href="E_HomePage.html" ><span></span>Home</a></li>
            <li><a href="#"><span></span>Author</a></li>
            <li><a href="E_MainPage.jsp" class="current"><span></span>Reader</a></li>
			        <li><a href="#"><span></span>TTP</a></li>
                    <li><a href="#"><span></span>Domain Manager </a></li>
                    <li><a href="#"><span></span>Cloud Server</a></li>
            <li></li>
        </ul>    	
    </div> 
    <!-- end of menu --></div> 
<!-- end of menu wrapper -->

<div id="templatemo_content_wrapper">
<div id="templatemo_content">
  <p>&nbsp;</p>
  <div id="content_left">
        <div class="content_left_section">
<div class="news_section">
  <p>MAIN MENU </p>
  <p><a href="E_HomePage.html" class="current">Home</a></p>
  <p><a href="E_RequestFile.jsp">Request File</a></p>
              <p>  <a href="E_ViewFileResponse.jsp">View File Response</a></p>
              <p><a href="E_DownloadFile.jsp">Download File</a></p>
         
              <p><a href="index.html">Logout</a></p>
          </div>
        
            
        
           
        
        </div>   
        <div class="content_left_section"></div>
    
        <div class="cleaner_h30"></div>
    </div> <!-- end of content left -->

    <div id="content_right">
    <marqueue>  <h1>A Searchable and Verifiable Data Protection Scheme for Scholarly Big Data. </h1></marqueue>
      <div class="content_right_section">
        <div class="content_header_02">  <p style="font-size:24px; color:#CC6600;">&nbsp;</p>
              <p style="font-size:24px; color:#CC6600; text-align:center;">Download File!!!!</p>
              <p style="font-size:24px; color:#000000; text-align:center;">&nbsp;</p>
              <div class="clr"></div>
			  
<%
		  
		    	try 
				{
		  		String file = request.getParameter("t1");

		  		
		        
		  
		  		String fn=(String)application.getAttribute("file");
		  		String un=(String)application.getAttribute("ename");
		  		String oname = request.getParameter("oname");
		  		
		  			String prcs = "Responsed";
		
		  			String query1 = "select * from pusg_userrequest  where username='"+un+"' and fnamereq='" + file+ "' and resstatus='" + prcs + "' ";
		  			Statement st1 = connection.createStatement();
		  			ResultSet rs1 = st1.executeQuery(query1);

		  			if (rs1.next()) {
		  		%>
		  		<%		  		
				String mac1="";
				String mac2="";
				String mac3="";
				String mac4="";
				String sk="";
				String strQuery = "select * from pusg_cloudserver where fname='"+file+"' and ownername='"+oname+"'";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				{
					if(rs.next()==true)
					{
						mac1=rs.getString(5);
						mac2=rs.getString(7);
						mac3=rs.getString(9);
						mac4=rs.getString(11);
						sk=rs.getString(12);
						
					SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;	
					String task="Download";
					String user=(String) application.getAttribute("ename");
					String strQuery2 = "insert into pusg_transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+sk+"','"+task+"','"+dt+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
			%>
			
<form action="E_DownloadFile2.jsp" method="post" name="form1" id="form1">
<table width="780" border="1" align="center">
	<tr>
		<td width="223" bgcolor="#FF0000"><span class="style3">Enter File Name :-</span></td>
		<td width="245"><label> <input required name="t1"
			type="text"  size="40" value="<%=file%>"/> </label></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">Enter Owner Name:-</span></td>
		<td><input name="oname" type="text" size="40" value="<%=oname%>" /></td>
	</tr>
	
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 1:-</span></td>
		<td><input name="t12" type="text" size="40" value="<%=mac1%>" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 2:-</span></td>
		<td><input name="t122" type="text" size="40" value="<%=mac2%>" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 3:-</span></td>
		<td><input name="t123" type="text" size="40" value="<%=mac3%>" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 4:-</span></td>
		<td><input name="t124" type="text" size="40"value="<%=mac4%>" /></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style3">Secret Key :-</span></td>
		<td><input name="t13" type="text" size="40" value="<%=sk%>" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"><input type="submit" name="Submit"
			value="Download" /></div>		</td>
	</tr>
</table>
</form>
<%	
					}
					else
					{
		
						out.println("File Doesn't Exist !!!");
			%>
						<p><a href="E_DownloadFile.jsp">Back</a></p>
	<%
					}
				}
				
		  			} else {
		  		%>
		  		<p>
		  		<h2 class="style4">You Don't Have Permission To Download !!!</h2>
		  		</p>
		  		<br />
		  		<p><a href="E_MainPage.jsp">Back</a></p>


		  		<%
		  			}
		
		  		     
		  				
	 
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
        </div>
            
            <div class="cleaner"><span class="style1">&nbsp;</span></div>
      </div>                    
        <div class="cleaner_h20"><span class="style1">&nbsp;</span></div>
    </div> <span class="style1"><!-- end of content right -->

</span><div class="cleaner"><span class="style1">&nbsp;</span></div>

</div> <span class="style1"><!-- end of content -->
</span></div> <span class="style1"><!-- end of content wrapper -->

</span><div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer"></div>
    <span class="style1"><!-- end of footer -->
</span></div><span class="style1"><!-- end of footer wrapper -->
</span><div align=center></div>
</body>
</html>