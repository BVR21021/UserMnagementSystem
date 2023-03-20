<%@ page import="java.sql.*"%>
<% 
String Name=request.getParameter("name");
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","venky","venky");
			PreparedStatement ps=con.prepareStatement("select * from Users where Name=?");
			ps.setString(1,Name);
			ResultSet rs=ps.executeQuery();
			ResultSetMetaData rsmd=rs.getMetaData();
			out.print("<table border='1'>");
			int n=rsmd.getColumnCount();
			for(int i=1;i<=n;i++)
				out.print("<td><font color=blue size=3> "+"rsmd.getColomnName(i)");
			out.print("<tr>");
			while(rs.next())
			{
				for(int i=1;i<=n;i++)
					out.println("<td><br>"+rs.getString(i));
				out.println("<tr>");
			}
			out.println("</table> </body> </html>");
			con.close();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	%>
