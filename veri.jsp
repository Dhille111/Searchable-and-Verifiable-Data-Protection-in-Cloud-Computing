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
<html>
<form action="veri1.jsp" method="post">
<table width="755" border="1" align="center">
 <tr>
              <td width="286"><span class="style4">Select Domain :- </span></td>
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
		<td width="286"><span class="style4">Owner Name :- </span></td>
		<td width="356"><input name="name" type="text" id="t42" size="50"
			/></td>
	</tr>
	<tr>
		<td width="286"><span class="style4">File Name :- </span></td>
		<td width="356"><input name="file" type="text" id="t42" size="50"
			/></td>
	</tr>


	<tr>
		<td width="286"><span class="style4">Select the Block</span></td>
		<td width="286"><span class="style4"><select name="block"><option>Block-1</option>
		<option>Block-2</option>
		<option>Block-3</option>
		<option>Block-4</option>
		</select></span></td>
	
	</tr>
		
			<tr>
		<td>
		<div align="right"></div>
		</td>
		<td><input type="submit" name="Submit2" value="Verify" /></td>
	</tr>
</table>
</form>
</html><%
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
			%> 