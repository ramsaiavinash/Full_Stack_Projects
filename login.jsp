<%@ page import="java.sql.*"%>
<%
String userid = request.getParameter("uname");
String pwd = request.getParameter("pass");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from member where uname='" + userid + "' and pass='" + pwd + "'");
if (rs.next()) {
	session.setAttribute("userid", userid);
	//out.println("welcome " + userid);
	//out.println("<a href='logout.jsp'>Log out</a>");
	response.sendRedirect("success.jsp");
} else {
	out.println("Invalid password / username <a href='index.jsp'>try again</a>");
}
%>