<%-- 
    Document   : datos
    Created on : 26-02-2021, 08:32:18 PM
    Author     : henry.taby
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>S4 Demo - Tabla</title>
    </head>
    <body>
        <%
           Connection con=null;
           Statement st = null;
           ResultSet rs= null;
           
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">



                    <table class="table table-striped">

                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center"><h3>Empleados</h3></th>
                                <th scope="col">
                                    <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>
                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Teléfono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                try {
                                    Class.forName("com.mysql.jdbc.Driver");

                                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=jsp&password=jsp");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM empleados;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrar.jsp?id=<%= rs.getString(1)%>" class="ml-1" ><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            <%
                                    }
                                } catch (Exception e) {
                                    out.println("error mysql " + e);
                                }
                            %>

                        </tbody>
                    </table>


                </div>
            </div>

        </div>

    </body>
</html>
