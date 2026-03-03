<%@ include file="connect.jsp"%>
<%@ page import="java.util.*"%>
<html>
<%
try
{
String domain=request.getParameter("domain");

ResultSet rs=connection.createStatement().executeQuery("select * from pusg_ttpverified where dname='"+domain+"'");
ResultSet rs2=connection.createStatement().executeQuery("select * from pusg_ttpverified where dname='"+domain+"'");
%><h2>Verification details...!</h2><%
while(rs.next())
{

%>
<table width="755" border="1" align="center" >
<tr> <td align="center">Domain Name:</td><td align="center"><%=rs.getString(2)%></td></tr>
<tr> <td align="center">Owner Name:</td><td align="center"><%=rs.getString(1)%></td></tr>
<tr> <td align="center">File Name:</td><td align="center"><%=rs.getString(3)%></td></tr>
<tr> <td align="center">Block Name:</td><td align="center"><%=rs.getString(4)%></td></tr>
<tr> <td align="center">Verification  Date:</td><td align="center"><%=rs.getString(7)%></td></tr>
<tr> <td align="center">Status:</td><td align="center"><%=rs.getString(8)%></td></tr>

<tr> <td colspan="2" height="20" bgcolor="#00FF00"></td></tr>
</table>
<%
}
if(!rs2.next())
{
%>
</br>
<h1>There are no Verification Blocks</h1>
<%
}
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>