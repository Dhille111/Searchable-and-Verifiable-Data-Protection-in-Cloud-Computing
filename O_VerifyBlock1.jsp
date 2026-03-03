<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>

	<%
	String owner=(String)application.getAttribute("oname");
	
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
			String domain = request.getParameter("domain");
   		try {
	   	    String mac1,mac2; 
		   	String query1="";
			String query2="";
			if(block.equalsIgnoreCase("Block1"))
			{
			query1="select mac1 from pusg_ttp where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			query2="select mac1 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			query1="select mac2 from pusg_ttp where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			query2="select mac2 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			query1="select mac3 from pusg_ttp where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			query2="select mac3 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			query1="select mac4 from pusg_ttp where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
						query2="select mac4 from pusg_cloudserver where fname='"+file+"' and ownername='"+owner+"' and domain='"+domain+"'"; 
			}
			
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query1);
	   if ( rs1.next() )
	      {
		    mac1=rs1.getString(1);
		   
		   
		    Statement st2=connection.createStatement();
		 
            ResultSet rs2=st2.executeQuery(query2);
	   if ( rs2.next() )
	      {
		   mac2=rs2.getString(1);
		   
		   if(mac1.equalsIgnoreCase(mac2))
		   {
		   %>
		   <h1>File is safe</h1><a href="O_VerifyBlock.jsp">Back</a>
		   <%
		  // String ss="File Is Safe";
		  // application.setAttribute("fname",file);
		  //application.setAttribute("attacker",ss);
		   }
		   else
		   {
		    %>
		   <h1>File is Not safe Attacked By Attacker</h1><a href="O_VerifyBlock.jsp">Back</a>
		   <%
		   //String ss="attacker";
		  // application.setAttribute("fname",file);
		  //application.setAttribute("attacker",ss);
		   }
		    
		   
		   }
		   
		   }
		   else
		   {
		   %>
		    <h1>File is Does Not exist..</h1><a href="O_VerifyBlock.jsp">Back</a>
		   <%
		   }
		   
		   
		   
		   
		   
		//response.sendRedirect("O_VerifyBlock2.jsp");   
		  
       	}
      	catch(Exception e)
     	{
			out.println(e.getMessage());
   		}
   		
	%>
