<%-- 
    Document   : crear
    Created on : 26-02-2021, 09:14:26 PM
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
        <title>Crear Empleado</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    
                    <form action="editar.jsp" method="post">
                        <div class="form-group">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" 
                                   required="required" value="<%=nombre%>"
                                   aria-describedby="Nombre">
                            <small id="emailHelp" class="form-text text-muted">Ingrese el nombre</small>
                        </div>
                        
                        <div class="form-group">
                            <label for="direccion">Dirección</label>
                            <input type="text" class="form-control" id="direccion" name="direccion"
                                   required="required" value="<%=direccion%>"
                                   aria-describedby="Dirección">
                            <small id="emailHelp" class="form-text text-muted">Ingrese el Direción</small>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono</label>
                            <input type="text" class="form-control" id="telefono" name="telefono"
                                   required="required" value="<%=telefono%>"
                                   aria-describedby="Teléfono">
                            <small id="emailHelp" class="form-text text-muted">Ingrese el Teléfono</small>
                        </div>
                        
                                   <a href="index.jsp" class="btn btn-danger"> Cancelar <i class="fa fa-ban" aria-hidden="true"></i> </a>
                                   
                        <button type="submit" name="enviar" class="btn btn-primary">Guardar
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>
                        </button>
                                   
                                   <input type="hidden" id="id" name="id" value="<%=id%>">
                    </form>
                </div>
            </div>
        </div>
        
        <%
            
        if (request.getParameter("enviar") != null) {
                

                try {
                    Connection con = null;
                    Statement st = null;
                    //ResultSet rs = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/jsp?user=jsp&password=jsp");
                    st = con.createStatement();
                    
                    //st.executeUpdate("update empleados set nombre ='" + nombre + "',direccion= '" + direccion + "',telefono ='" + telefono + "' where id = '"+id+"' ;");
                      st.executeUpdate("update empleados set nombre='" + nombre + "',direccion='" + direccion + "',telefono='" + telefono + "' where id='"+id+"';");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println("error " + e);
                }
            }
        %>
        
    </body>
</html>
