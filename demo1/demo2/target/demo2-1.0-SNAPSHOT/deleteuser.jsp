<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost/";
    String database = "ci4_hotel";
    String userid = "root";
    String password = "";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
<h1>Retrieve data from database in jsp</h1>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Email</th>
        <th>Password</th>
        <td>Action</td>
    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from user";
            resultSet = statement.executeQuery(sql);
            int i=0;
            while(resultSet.next()){
    %>
    <tr>
        <td><%=resultSet.getString("name") %></td>
        <td><%=resultSet.getString("address") %></td>
        <td><%=resultSet.getString("email") %></td>
        <td><%=resultSet.getString("password") %></td>
        <td><a href="delete.jsp?id=<%=resultSet.getString("user_id") %>"><button type="button" class="delete">Delete</button></a></td>
    </tr>
    <%
                i++;
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>