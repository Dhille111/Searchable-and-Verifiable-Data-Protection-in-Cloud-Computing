
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
<title>Download</title>
<meta name="keywords" content="Professional Template, HTML, CSS, free website template" />
<meta name="description" content="Professional Template, HTML, CSS, free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" /><link href="css/style.css" rel="stylesheet" type="text/css" />
<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
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
              <div class="clr"></div>
			  
<%
		   	try {
		   		String file = request.getParameter("t1");
		   		String owner = request.getParameter("oname");
		   		String mac1 = request.getParameter("t12");
					String mac2 = request.getParameter("t122");
						String mac3 = request.getParameter("t123");
							String mac4 = request.getParameter("t124");
		   		String sk = request.getParameter("t13");

		   		application.setAttribute("file2", file);
		   		application.setAttribute("sk2", sk);

		   		String strQuery = "select * from pusg_cloudserver where fname='"
		   				+ file
		   				+ "' and ownername='"
		   				+ owner
		   				+ "' and  mac1='"
		   				+ mac1
		   				+ "' and  mac2='"
		   				+ mac2
		   				+ "' and  mac3='"
		   				+ mac3
		   				+ "' and  mac4='"
		   				+ mac4
		   				+ "' and  sk='" + sk + "'";
		   	
	String strQuery1 = "select * from pusg_cloudserver where fname='"
		   				+ file
		   				+ "' ";
							ResultSet rs1 = connection.createStatement().executeQuery(
		   				strQuery1);
		   		ResultSet rs = connection.createStatement().executeQuery(
		   				strQuery);
		   		
			if(rs1.next())
			{
					if(rs.next())
					{
							String ct1 = rs.getString(4);
								String ct2 = rs.getString(6);
									String ct3 = rs.getString(8);
										String ct4 = rs.getString(10);
										

												String keys = "ef50a0ef2c3e3a5f";
												byte[] keyValue1 = keys.getBytes();
												Key key1 = new SecretKeySpec(keyValue1, "AES");
												Cipher c1 = Cipher.getInstance("AES");
												c1.init(Cipher.DECRYPT_MODE, key1);
												String decryptedValue1 = new String(Base64
														.decode(ct1.getBytes()));
														String decryptedValue2 = new String(Base64
														.decode(ct2.getBytes()));
														String decryptedValue3 = new String(Base64
														.decode(ct3.getBytes()));
														String decryptedValue4 = new String(Base64
														.decode(ct4.getBytes()));
						%>
<div align="center"><table width="780" border="1"><tr><td align="center">File Contents</td></tr>
				<tr><td>
	              <textarea name="text" id="textarea" cols="110" rows="17"><%=decryptedValue1%><%=decryptedValue2%><%=decryptedValue3%><%=decryptedValue4%></textarea></td></tr>
				  
	              <br/>
	              <br/>
	           <tr>   <td align="center"><button onClick="saveTextAsFile()">Download</button></td></tr></table>
          </div>
		    </label>
		  <p align="center">&nbsp; </p>
		  <p>
		    <%
		    	} 
				else {
					SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");

					Date now = new Date();

					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;

					String user = (String) application
							.getAttribute("ename");
String type="Internal";
					String strQuery2 = "insert into pusg_blockeduser(user,fname,ownername,sk,dt) values('"
							+ user
							+ "','"
							+ file
							+ "','"+owner+"','"
							+ sk
							+ "','"
							+ dt
							+ "')";
					connection.createStatement().executeUpdate(strQuery2);
	%>
	      </p>
		  <p>
		  <h1 class="style1">Trapdoor / Secret Key Mismatch !!!</h1>
		  </p><br />
						<p><a href="E_DownloadFile.jsp">Back</a></p>
	<%
		}
		}
		else {
		    %>
	      </p>
		  <p>
		  <h1 class="style1">File Doesn't Exist !!!</h1>
		  </p><br />
						<p><a href="E_DownloadFile.jsp">Back</a></p>
	
		<%}
					
				
			
			connection.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
             <span> </span>
              <p>&nbsp;</p>
              <p><a href="E_MainPage.jsp">Back</a></p>
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