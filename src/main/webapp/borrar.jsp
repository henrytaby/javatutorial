<%-- 
    Document   : borrar
    Created on : 26-02-2021, 10:01:25 PM
    Author     : henry.taby
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=jsp&password=jsp");
                st = con.createStatement();
                st.executeUpdate("delete from empleados where id='"+request.getParameter("id")+"' ");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.println("error mysql " + e);
            }
        %>
        
    </body>
</html>
