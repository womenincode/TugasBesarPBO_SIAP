<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String name=request.getParameter("name");
    String address=request.getParameter("address");
    String telp=request.getParameter("telp");
    String role=request.getParameter("role");

    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ci4_hotel", "root", "");
        Statement st=conn.createStatement();

        st.executeUpdate("insert into user(email, password, name, address, telp, role)values('"+email+"','"+password+"','"+name+"','"+address+"','"+telp+"','"+role+"')");
        out.println("Data is successfully inserted!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>