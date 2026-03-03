
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
<title></title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style3 {color: #FFFFFF; font-weight: bold; }
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
		   
		   String fname=request.getParameter("fname");
		     String owner=request.getParameter("owner");
		   
		   %>
			  
	      <form action="E_DownloadFile1.jsp" method="post" name="form1" id="form1">
<table width="780" border="1" align="center">
	<tr>
		<td bgcolor="#FF0000" ><span class="style3">Enter File Name :-</span></td>
		<td ><input required name="t1" type="text"   size="40" value="<%=fname%>" readonly/> </td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">Enter Owner Name:-</span></td>
		<td><input name="oname" type="text" size="40"  value="<%=owner%>" readonly/>		</td>
	</tr>
	
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 1:-</span></td>
		<td>  <input name="t12" type="text" size="40" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 2:-</span></td>
		<td><input name="t122" type="text" size="40" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 3:-</span></td>
		<td><input name="t123" type="text" size="40" /></td>
	</tr>
	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">MAC 4:-</span></td>
		<td><input name="t124" type="text" size="40" /></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style3">Secret Key :-</span></td>
		<td><input name="t13" type="text" size="40" /></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr><td></td>
		<td>
		<div align="left"><input type="submit" name="Submit"
			value="Req MAC" /></div>		</td>
	</tr>
</table>
</form>      
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