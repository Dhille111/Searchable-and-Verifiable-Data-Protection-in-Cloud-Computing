<%@ include file="connect.jsp"%>
<%@ page import="java.util.*"%>
<html>
<%
try
{
ResultSet rs=connection.createStatement().executeQuery("select * from pusg_domains");
ArrayList a=new ArrayList();
while(rs.next())
{
a.add(rs.getString(1));
}
%><form method="post" action="vblock1.jsp">
<table width="755" border="1" align="center" >
<tr> <td align="center">Select the Domain</td><td><select name="domain" ><option>
--Select--</option>
<%
for(int l=0;l<a.size();l++)
{
%>
<option><%=a.get(l)%></option>
<%
}
%></select></td></tr>
<tr> <td colspan="2" align="center"><input type="submit" value="Submit"/></td></table>
<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>