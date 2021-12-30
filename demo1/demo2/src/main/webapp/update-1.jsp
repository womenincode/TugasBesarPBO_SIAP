<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
  String id = request.getParameter("id");
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
<%
  try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from user where user_id="+id;
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-process.jsp">
  <input type="hidden" name="user_id" value="<%=resultSet.getString("user_id") %>">
  <br>
  Nama:<br>
  <input type="text" name="name" value="<%=resultSet.getString("name") %>">
  <br>
  Alamat:<br>
  <input type="text" name="address" value="<%=resultSet.getString("address") %>">
  <br>
  Email:<br>
  <input type="email" name="email" value="<%=resultSet.getString("email") %>">
  <br>
  Password:<br>
  <input type="password" name="password" value="<%=resultSet.getString("password") %>">
  <br><br>
  <input type="submit" value="submit">
</form>
<%
    }
    connection.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
</body>
</html>