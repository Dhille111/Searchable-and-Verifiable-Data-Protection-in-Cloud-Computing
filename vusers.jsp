<%@ include file="connect.jsp"%>
<%@ page import="java.util.*"%>
<html>
<%
try
{
String domain=request.getParameter("domain");

ResultSet rs=connection.createStatement().executeQuery("select * from pusg_user ");
%><%
while(rs.next())
{

%>
<table width="755" border="1" align="center" >
<tr><td rowspan="7"><img src="images.jsp?id=<%=rs.getInt(1)%>" alt=""/></td> <td align="center">User Name:</td><td align="center"><%=rs.getString(2)%></td></tr>
<tr> <td align="center"> Email:</td><td align="center"><%=rs.getString(4)%></td></tr>
<tr> <td align="center">Mobile:</td><td align="center"><%=rs.getString(5)%></td></tr>
<tr> <td align="center">Address:</td><td align="center"><%=rs.getString(6)%></td></tr>
<tr> <td align="center">DOB:</td><td align="center"><%=rs.getString(7)%></td></tr>
<tr> <td align="center">Gender:</td><td align="center"><%=rs.getString(8)%></td></tr>
<tr> <td align="center">PIN:</td><td align="center"><%=rs.getString(9)%></td></tr>

<tr> <td colspan="3" height="20" bgcolor="#00FF00"></td></tr>
</table>
<%
}
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>