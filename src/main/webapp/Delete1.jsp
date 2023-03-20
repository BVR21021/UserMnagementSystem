<%@ page import="java.sql.*"%>
<%
String Name=request.getParameter("name");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
	PreparedStatement ps=con.prepareStatement("Delete from Users where Name=?");
	ps.setString(1,Name);
	 int i=ps.executeUpdate();
	out.print(i+"your Record Deleted.....");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}
%>