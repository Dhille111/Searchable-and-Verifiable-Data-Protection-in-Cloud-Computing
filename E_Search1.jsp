<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E_Search</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style3 {color: #FFFFFF; font-weight: bold; }
.style2 {font-weight: bold}
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
  <p><a href="index.html">Logout</a></p>
          </div>
        
            
        
           
        
        </div>   
        <div class="content_left_section"></div>
    
        <div class="cleaner_h30"></div>
    </div> <!-- end of content left -->

    <div id="content_right">
    <marqueue>  <h1>Searched Data Results !!! </h1>
    </marqueue>
      <div class="content_right_section">
            <div class="content_header_02">
              <span style="color:#6e6e6e;    line-height: 1.5em; "><p>&nbsp;</p>
               <table width="605" border="1.5" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="60" height="29" bgcolor="#FF0000"><div align="center" class="style23 style2 style3 style5">
                  <div align="center"><span class="style24">Id </span></div>
                </div></td>
                <td width="101" bgcolor="#FF0000"><div align="center" class="style23 style2 style3 style5">
                  <div align="center"><span class="style24">File  Name </span></div>
                </div></td>
                <td width="123" bgcolor="#FF0000"><div align="center" class="style23 style2 style3 style5">
                  <div align="center"><span class="style24">Owner </span></div>
                </div></td>
				  <td width="210" bgcolor="#FF0000"><div align="center" class="style9"><span class="style1 style15"><strong>Download</strong></span></div></td>
              
              
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    String user=(String)application.getAttribute("uname");
try 
  {
            String keyword = request.getParameter("keyword").toLowerCase();
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		//String search = new String(Base64.encode(keyword.getBytes()));
			
			
	
				int found=0,total=0;
				String query4="select * from pusg_cloudserver "; 
				Statement st4=connection.createStatement();
				ResultSet rs=st4.executeQuery(query4);
				while ( rs.next() )
				{
					//i=rs.getInt(1);
					String fname=rs.getString(1);
					String owner=rs.getString(2);
					String ct1 =rs.getString(4);
					String ct2 =rs.getString(6);
					String ct3 =rs.getString(8);
					String ct4 =rs.getString(10);

					total=total+1;
					
					
					c.init(Cipher.DECRYPT_MODE,key);
					String decryptedValue1 = new String(Base64.decode(ct1.getBytes()));
					String decryptedValue2 = new String(Base64.decode(ct2.getBytes()));
					String decryptedValue3 = new String(Base64.decode(ct3.getBytes()));
					String decryptedValue4 = new String(Base64.decode(ct4.getBytes()));
					
					if(decryptedValue1.toLowerCase().contains(keyword.toLowerCase()) || decryptedValue2.toLowerCase().contains(keyword.toLowerCase()) || decryptedValue3.toLowerCase().contains(keyword.toLowerCase()) || decryptedValue4.toLowerCase().contains(keyword.toLowerCase()))	
					{
						found=found+1;
						
							%>
              </tr>
              <tr>
                <td height="28"><div align="center" class="style2 style26"><strong><%=total%></strong></div></td>
                <td><div align="center" class="style2 style26"><strong><%=fname%></strong></div></td>
                <td><div align="center" class="style2 style26"><strong><%=owner%></strong></div></td>
				<td><div align="center" class="style11"><a href="E_DownloadFile.jsp?fname=<%=fname%>&owner=<%=owner%>"> <%=fname%> </a></div></td>
              </tr>
              <%
					
							
					
			  		  }
			    }
			 
			connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
            
              </span></div>
            
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