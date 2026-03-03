<html>
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
	 <%
		  String name=request.getParameter("name");
		    String fname=request.getParameter("file");
					    String block=request.getParameter("block");
						String domain=request.getParameter("domain");
						
			String query="";
			String query1="";
			String query2="";
			String query3="";
			if(block.equalsIgnoreCase("Block-1"))
			{
			query="select mac1 from pusg_cloudserver where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query1="select mac1 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query2="select mac1 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"'";
			
			}
			if(block.equalsIgnoreCase("Block-2"))
			{
			query="select mac2 from pusg_cloudserver where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query1="select mac2 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query2="select mac2 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"'";
			}
			if(block.equalsIgnoreCase("Block-3"))
			{
			query="select mac3 from pusg_cloudserver where fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query1="select mac3 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query2="select mac3 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"'";
			}
			if(block.equalsIgnoreCase("Block-4"))
			{
			query="select mac4 from pusg_cloudserver where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query1="select mac4 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"' and per='Yes' and ownername='"+name+"'";
			query2="select mac4 from pusg_ttp where  fname='"+fname+"' and domain='"+domain+"'";
			}
			%>
		  
		    <%
		  try
		  {
		  String status="";
		  
      		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;

		  ResultSet rs=connection.createStatement().executeQuery(query);
		   ResultSet rs1=connection.createStatement().executeQuery(query1);
		   		   ResultSet rs2=connection.createStatement().executeQuery(query2);
				   if(rs2.next())
				   {
		  				if(rs.next() && rs1.next())
		  					{
		 
								  if(rs.getString(1).equalsIgnoreCase(rs1.getString(1)))
		  							{
									status="Safe";
		 							 %>
		 							 <h2> File is safe details Shown Below</h2>
									  <%
		 							 }
		 								 else
		 									 {
		 										 status="Attacked";
												 %>
											   <h2> File is Modified by Attacker details Shown Below</h2>
		 										  <%
											   }
											   
											   %>
											   <form action="#" method="post">
<table width="755" border="1" align="center">
<tr>
		<td width="286"><span class="style4">Domain Name :- </span></td>
		<td width="356"><input name="domain" type="text" id="t42" size="50" value="<%=domain%>" readonly="readonly"
			/></td>
	</tr>
	<tr>
		<td width="286"><span class="style4">File Name :- </span></td>
		<td width="356"><input name="file" type="text" id="t42" size="50" value="<%=fname%>" readonly="readonly"
			/></td>
	</tr>
	

	<tr>
		<td width="286"><span class="style4">Select the Block</span></td>
		<td width="286"><span class="style4"><input name="block" type="text" id="t42" size="50" value="<%=block%>" readonly="readonly"
			/></span></td>
	
	</tr>
		<tr>
		<td width="286"><span class="style4">Cloud Server Mac :- </span></td>
		<td width="356"><input name="mac" type="text" id="t42" size="50" value="<%=rs.getString(1)%>" readonly="readonly"
			/></td>
	</tr>
	<tr>
		<td width="286"><span class="style4">TTP Mac :- </span></td>
		<td width="356"><input name="mac" type="text" id="t42" size="50" value="<%=rs1.getString(1)%>" readonly="readonly"
			/></td>
	</tr>
			<tr>
		<td  colspan="2" height="20" bgcolor="#00FF00" >
		
		</td>
		
	</tr>
</table>
</form>
<%
	ResultSet rs11=connection.createStatement().executeQuery("select * from pusg_ttpverified where  dname='"+domain+"' and fname='"+fname+"' and block='"+block+"' ");
	if(!rs11.next())
	{
	connection.createStatement().executeUpdate("insert into pusg_ttpverified values('"+name+"','"+domain+"','"+fname+"','"+block+"','"+rs.getString(1)+"','"+rs1.getString(1)+"','"+dt+"','"+status+"')");
	}
	else
	{
	connection.createStatement().executeUpdate("update  pusg_ttpverified set omac='"+rs.getString(1)+"',tmac='"+rs1.getString(1)+"',dt='"+dt+"',status='"+status+"' where  dname='"+domain+"' and fname='"+fname+"' and block='"+block+"' ");
	}
	
				%>	<h2>Successfully Details Sent To  Author...!!!</h2>						   <%
		   						}
		   						else
		  							 {%>
		  							 <h2>Author has not given Permission to Verify his File ...</h2>
		  						<%	 }
					}
					else
					{%>
					<h2>File Does Not Exist...</h2>
		<%			}
					%>
		    <%

}
catch(Exception e)
{
e.printStackTrace();
}%>
        </html>