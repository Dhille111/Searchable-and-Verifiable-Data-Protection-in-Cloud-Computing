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
<title>Upload</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
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
			     <h5 align="right"><%=new java.util.Date()%></h5>
		  <h2> Upload Data:</h2>
		            <div class="clr"></div>
					   <%
	String owner = (String) application.getAttribute("oname");
	//String ocl=(String)application.getAttribute("uploadC");
%>
					    
						
						<% try 
	{
	
	long stime=System.currentTimeMillis();
	
	
      		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String domain = request.getParameter("domain");
		String per = request.getParameter("per");
		String cont1 = request.getParameter("text1");
		String cont2 = request.getParameter("text2");
		String cont3 = request.getParameter("text3");
		String cont4 = request.getParameter("text4");
		
		String mac1 = request.getParameter("t1");
				String mac2 = request.getParameter("t2");
						String mac3 = request.getParameter("t3");
								String mac4 = request.getParameter("t4");
								
		String cloud = "cloud";
			
      		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;

		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
		Cipher encoder = Cipher.getInstance("RSA");
		KeyPair kp = kg.generateKeyPair();

		Key pubKey = kp.getPublic();

		byte[] pub = pubKey.getEncoded();
		//				System.out.println("PUBLIC KEY" + pub);

		String pk = String.valueOf(pub);
		String rank = "0";
		Statement st = connection.createStatement();

		String user = "Author";
		String task = "Upload";
		Statement st21 = connection.createStatement();
						st21.executeUpdate("insert into  pusg_cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,domain,per) values ('"
										+ file
										+ "','"
										+ owner
										+ "','"
										+ cloud
										+ "','"
										+ cont1
										+ "','"
										+ mac1
										+ "','"
										+ cont2
										+ "','"
										+ mac2
										+ "','"
										+ cont3
										+ "','"
										+ mac3
										+ "','"
										+ cont4
										+ "','"
										+ mac4
										+ "','"
										+ pk
										+ "','" + dt + "','" + domain + "','" + per + "')");
										
										
										Statement st211 = connection.createStatement();
						st211.executeUpdate("insert into  pusg_ttp(fname,ownername,cname,mac1,mac2,mac3,mac4,sk,dt,domain,per) values ('"
										+ file
										+ "','"
										+ owner
										+ "','"
										+ cloud
										+ "','"
										+ mac1
										+ "','"
										+ mac2
										+ "','"
										+ mac3
										+ "','"
										+ mac4
										+ "','"
										+ pk
										+ "','" + dt + "','" + domain + "','" + per + "')");
										
										
											long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont1.length()+cont2.length()+cont3.length()+cont4.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
			
										
										
										
										%>
										<p>
										
<h2>Data Uploaded Successfully !!!</h2>
</p>
<br />
<p><a href="O_MainPage.jsp">BACK</a></p>
      		
			
      		
			

 <div class="clr"></div>
		
  <%

	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>  
              <p>&nbsp;</p>
        </div>
            
            <div class="cleaner"><span class="style1">&nbsp;</span></div>
      </div>                    
        <div class="cleaner_h20"></div>
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