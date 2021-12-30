<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id=request.getParameter("id");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ci4_hotel", "root", "");
        Statement st=conn.createStatement();
        st.executeUpdate("DELETE FROM user WHERE user_id="+id);
        String redirectURL = "index.jsp";
        response.sendRedirect(redirectURL);
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>