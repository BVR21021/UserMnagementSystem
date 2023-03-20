<%@ page import="java.sql.*"%>
<%
String Email=request.getParameter("mail");
String Password=request.getParameter("pwd");
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
	PreparedStatement ps=con.prepareStatement("select * from Users where Email=? and Password=?");
	ps.setString(1,Email);
	ps.setString(2,Password);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("userHome.jsp");
	}
	else
	{
		out.println("please insert valid email and password...");
	}
	con.close();
}
catch(Exception e)
{
	out.println(e);

}
%>