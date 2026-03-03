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
<title>Verify</title>
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
			    <%@ include file="connect.jsp" %>
<%@ page import="java.util.*" %>
<%
  try 
	 {
	 
	 
	 
     
    ArrayList a2=new ArrayList();
	

	    String query2="select * FROM pusg_domains"; 
     Statement st2=connection.createStatement();
     ResultSet rs2=st2.executeQuery(query2);
           
 	   while ( rs2.next() )
 	   {
	  
 			a2.add(rs2.getString("domain"));
 		
 	   }
      		
        
		
		   %>

              <p style="font-size:24px; color:#CC6600;">&nbsp;</p>
              <p style="font-size:24px; color:#CC6600; text-align:center;">Verify Block File !!!!</p>
              
                             
              <div class="clr"></div>
           <form id="form1" name="form1" method="post" action="O_VerifyBlock1.jsp">
          <table width="780" border="1" align="center">
		    <tr>
              <td width="286" bgcolor="#FFFF00"><span class="style4">Select Domain :- </span></td>
                 <td>  <select name="domain">
                  <option>--Select--</option>
                <% for(int l=0;l<a2.size();l++)
        	  {
        	  %>
                  <option><%= a2.get(l)%></option>
                
                  <%}%>
              </select>			</td>
            </tr>
              <tr>
              <td width="286" bgcolor="#FFFF00"><span class="style4">Enter File Name</span></td>
              <td width="356"><input required="required" type="text" name="file" id="file" size="50" /></td>
            </tr>
            <tr>
              <td bgcolor="#FFFF00" class="style4">Select The Block </td>
              <td><select name="block"  >
			  <option>--Select--</option>
			  <option>Block1</option>
			   <option>Block2</option>
			    <option>Block3</option>
				 <option>Block4</option>
			  </select></td>
            </tr>
            
            <tr>
              <td><div align="right"></div></td>
              <td><input type="submit" name="Submit" value="Verify" /></td>
            </tr>
          </table>
  </form>
            <%
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