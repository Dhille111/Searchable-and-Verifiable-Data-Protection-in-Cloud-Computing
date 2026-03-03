<%@ include file="connect.jsp"%>
<html>
<%
try
{
ResultSet rs=connection.createStatement().executeQuery("select * from pusg_domains");
%>
<table width="755" border="1" align="center" >
<tr> <td align="center" bgcolor="#00FF00">Domain Names</td></tr>
<%
while(rs.next())
{%>
<tr> <td align="center"><%=rs.getString(1)%></td></tr>
<%
}
%></table>
<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>