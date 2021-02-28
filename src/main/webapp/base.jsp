<%-- 
    Document   : ver
    Created on : 26-02-2021, 11:35:53 PM
    Author     : henry.taby
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Conexión MySQL con JSTL para</title>
    </head>
    <body>

        <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/jsp" user="jsp" password="jsp" var="con" />
        <sql:query dataSource="${con}" var="result">
            SELECT * FROM empleados;
        </sql:query>      

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
                            <c:forEach var="filas" items="${result.rows}">
                                <tr>
                                    <th scope="row"><c:out value="${filas.id}" /></th>
                                    <td><c:out value="${filas.nombre}" /></td>
                                    <td><c:out value="${filas.direccion}" /></td>
                                    <td><c:out value="${filas.telefono}" /></td>
                                    <td>
                                        <a href="#" ><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        <a href="#" class="ml-1" ><i class="fa fa-trash" aria-hidden="true"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
