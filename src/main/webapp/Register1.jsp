<%@ page import="java.sql.*"%>
<%
String Name=request.getParameter("name");
String Password=request.getParameter("pwd");
String Email=request.getParameter("mail");
String Address=request.getParameter("uadd");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
	PreparedStatement ps=con.prepareStatement("insert into Users values(?,?,?,?)");
	ps.setString(1,Name);
	ps.setString(2,Password);
	ps.setString(3,Email);
	ps.setString(4,Address);
	int i=ps.executeUpdate();
	out.println(i+"Thanks For Registretion...");
	con.close();
}
catch(Exception e)
{
	out.println(e);
}	
%>