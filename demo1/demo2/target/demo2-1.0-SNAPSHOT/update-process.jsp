<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost/ci4_hotel";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String id = request.getParameter("user_id");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String name=request.getParameter("name");
    String address=request.getParameter("address");
    if(id != null)
    {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(id);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update user set email=?,password=?,name=?,address=? where user_id="+id;
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, address);
            int i = ps.executeUpdate();
            if(i > 0)
            {
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
            }
            else
            {
                String redirectURL = "update-1.jsp?id="+id;
                response.sendRedirect(redirectURL);
            }
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>