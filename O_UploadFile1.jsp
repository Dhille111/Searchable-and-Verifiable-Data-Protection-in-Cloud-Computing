<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Upload File</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
.style4 {font-weight: bold}
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
            <li> <a href="O_HomePage.html" ><span></span>Home</a></li>
            <li><a href="O_MainPage.jsp" class="current"><span></span>Author</a></li>
            <li><a href="#"><span></span>Reader</a></li>
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
<p><a href="O_HomePage.html" class="current">Home</a></p>
  <p><a href="O_UploadFile.jsp">Upload File</a></p>
              <p>  <a href="O_VerifyBlock.jsp">Verify Block</a></p>
              <p><a href="O_UpdateBlock.jsp">Update Block</a></p>
              <p><a href="O_DeleteFile.jsp">Delete File </a></p>
			      <p><a href="O_ViewFiles.jsp">View Files </a></p>
				   <p><a href="O_ViewBlockVerification.jsp">View Verification  </a></p>
             
              <p><a href="index.html">Logout</a></p>
          </div>
        
            
        
           
        
        </div>   
        <div class="content_left_section"></div>
    
        <div class="cleaner_h30"></div>
    </div> <!-- end of content left -->

    <div id="content_right">
    <marqueue>  <h1>A Searchable and Verifiable Data Protection Scheme for Scholarly Big Data. </h1></marqueue>
      <div class="content_right_section">
            <div class="content_header_02">
              <div class="clr"></div>
			    <%@ include file="connect.jsp" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>

<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
<%
  try 
	 {
	 
	 String domain=request.getParameter("domain");
      		String per=request.getParameter("per");
	 String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h[]=new String[5];
      		String filename="filename.txt";
			String filename1="filename1.txt";
			String filename2="filename2.txt";
			String filename3="filename3.txt";
			String filename4="filename4.txt";
			ResultSet rs=connection.createStatement().executeQuery("select * from pusg_cloudserver where fname='"+file+"' ");
			if(!rs.next())
			
      		
      		
			{
      		
			int sourceFileSize=cont.length();
			int s=sourceFileSize%4;
			int s1=sourceFileSize/4;
			int a1=s1;
			int a2=s1+s1;
			int a3=s1+s1+s1;
			int a4=s1+s1+s1+s1+s;
			
			String encryptedValue3="",encryptedValue2="",encryptedValue1="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
				 encryptedValue1 = new String(Base64
														.encode(cont.substring(0,a1).getBytes()));
														 encryptedValue2 = new String(Base64
														.encode(cont.substring(a1+1,a2).getBytes()));
														 encryptedValue3 = new String(Base64
														.encode(cont.substring(a2+1,a3).getBytes()));
														 encryptedValue4 = new String(Base64
														.encode(cont.substring(a3+1,a4).getBytes()));		
												
			
			
			
			
			/*encryptedValue1=cont.substring(0,a1);
			encryptedValue2=cont.substring(a1+1,a2);
			encryptedValue3=cont.substring(a2+1,a3);
			encryptedValue4=cont.substring(a3+1,a4);*/
			
			//int NSplits=sourceFileSiz/5
			%>
			source<%=sourceFileSize %>
			a1<%=a1 %>
			a2<%=a2 %>
			a3<%=a3 %>
			a4<%=a4 %>
			split<%=s %>
			<%
      	
			PrintStream p1 = new PrintStream(new FileOutputStream("filename1.txt"));
			p1.print(new String(encryptedValue1));
			PrintStream p2 = new PrintStream(new FileOutputStream("filename2.txt"));
			p2.print(new String(encryptedValue2));
			PrintStream p3 = new PrintStream(new FileOutputStream("filename3.txt"));
			p3.print(new String(encryptedValue3));
			PrintStream p4 = new PrintStream(new FileOutputStream("filename4.txt"));
			p4.print(new String(encryptedValue4));
			
			for(int i=1;i<5;i++)
			{
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream("filename"+i+".txt");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h[i] = bi1.toString(16);
			
			
			
			
      	}	
	
     
   
      		
        
		
		   %>

              <p style="font-size:24px; color:#CC6600;">&nbsp;</p>
              <p style="font-size:24px; color:#CC6600; text-align:center;">Upload File !!!!</p>
              
                             
              <div class="clr"></div>
           <form id="form1" name="form1" method="post" action="O_UploadFile2.jsp">
          <table width="780" border="1" align="center">
		    <tr>
              <td width="286"><span class="style4">Select Domain :- </span></td>
                    <td><input required="required" name="domain" type="text" id="t42"  value="<%=domain%>" size="50"/></td>		
            </tr>
            
            <tr>
              <td bgcolor="#FF0000" class="style1 style4"><strong>File Name :- </strong></td>
                <td width="356"><input name="t42" type="text" id="t42" size="50"
			value="<%= file %>" readonly="readonly" /></td>
            </tr>
			
			   <tr>
              <td bgcolor="#FF0000" class="style1 style4"><strong>File Verification Permission :- </strong></td>
              <td><input required="required" name="per" type="text"  value="<%=per%>" id="t42" size="50"/></td>
            </tr>
			
            <tr>
		<td width="286" bgcolor="#FF0000"><span class="style1 style4"><strong>Block-1 </strong></span></td>
		<td width="286"><span class="style4">Size:<%=a1%>Bytes</span></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td><textarea name="text1" cols="50" rows="15" readonly><%= encryptedValue1 %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style1"><strong>MAC-1: </strong></span></td>
		<td><input name="t1" type="text" id="t4" size="50"
			value="<%= h[1] %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td width="286" bgcolor="#FF0000"><span class="style1"><strong>Block-2 </strong></span></td>
		<td width="286"><span class="style4">Size:<%=(a2-a1)%>Bytes</span></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue2 %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style1"><strong>MAC-2: </strong></span></td>
		<td><input name="t2" type="text" id="t4" size="50"
			value="<%= h[2] %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td width="286" bgcolor="#FF0000"><span class="style1"><strong>Block-3 </strong></span></td>
		<td width="286"><span class="style4">Size:<%=(a3-a2)%>Bytes</span></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td><textarea name="text3" cols="50" rows="15" readonly><%= encryptedValue3 %></textarea></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style1"><strong>MAC-3: </strong></span></td>
		<td><input name="t3" type="text" id="t4" size="50"
			value="<%= h[3]%>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td width="286" bgcolor="#FF0000"><span class="style1"><strong>Block-4 </strong></span></td>
		<td width="286"><span class="style4">Size:<%=(a4-a3)%>Bytes</span></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000">&nbsp;</td>
		<td><textarea name="text4" cols="50" rows="15" readonly><%= encryptedValue4 %></textarea></td>
	</tr>
	
	<tr>
		<td bgcolor="#FF0000"><span class="style1"><strong>MAC-4: </strong></span></td>
		<td><input name="t4" type="text" id="t4" size="50"
			value="<%= h[4] %>" readonly="readonly" /></td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"></div>		</td>
		<td><input type="submit" name="Submit2" value="Upload" /></td>
	</tr>
</table>
</form>

<%
}
else
{
%>
<h2>File name already exist</h2><a href="O_UploadFile.jsp">Back</a>
<%
}
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
			%>  </span>
              <p>&nbsp;</p>
        </div>
            
            <div class="cleaner"><span class="style1">&nbsp;</span></div>
      </div>                    
        <div class="cleaner_h20"><span class="style1">&nbsp;</span></div>
    </div> 
    <p class="style1">&nbsp;</p>
    <p class="style1">&nbsp;</p>
    <p class="style1">
      <!-- end of content right -->
      
    </p>
    <div class="cleaner"><span class="style1">&nbsp;</span></div>

</div> <span class="style1"><!-- end of content -->
</span></div> <span class="style1"><!-- end of content wrapper -->

</span><div id="templatemo_footer_wrapper">        
    <div id="templatemo_footer"></div>
    <span class="style1"><!-- end of footer -->
</span></div><span class="style1"><!-- end of footer wrapper -->
</span><div align=center></div>
</body>
</html>