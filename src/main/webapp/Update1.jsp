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
			PreparedStatement ps=con.prepareStatement("update Users set Password=?,Email=?,Address=? where Name=?");
			ps.setString(1,Password);
			ps.setString(2,Email);
			ps.setString(3,Address);
			ps.setString(4,Name);
			int i=ps.executeUpdate();
			out.println(i+"Your Record is Updated.");
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
%>	