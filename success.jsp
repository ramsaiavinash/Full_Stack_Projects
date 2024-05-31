<%@ page import="java.sql.*" %>

<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid").equals(""))) {
%>
    You are not logged in
    <br />
    <a href="index.jsp">Please Login</a>
<%
} else {
    try {
        String userid = request.getParameter("uname");
        String pwd = request.getParameter("pass");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
        PreparedStatement st = con.prepareStatement("SELECT * FROM member WHERE uname = ? AND pass = ?");
        st.setString(1, userid);
        st.setString(2, pwd);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
        	String s1 = rs.getString("id");
            out.print("Employee ID: " + s1);
            String s2 =rs.getString("first_name");
            out.println(" | First Name: " + s2 );
            String s3 =  rs.getString("last_name");
            out.println(" | Last Name: " +s3);
            String s4 =  rs.getString("email");
            out.println(" | Employee Email: " +s4);
        } else {
            out.println("Invalid credentials. Please try again.");
        }

        rs.close();
        st.close();
        con.close();
    } catch (SQLException e) {
        out.println("An error occurred: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Database driver not found: " + e.getMessage());
    }
}
%>
