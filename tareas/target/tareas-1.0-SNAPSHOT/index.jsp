<%@page import="com.emergentes.tareas"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("almacen")==null) {
            ArrayList<tareas> lisaux = new ArrayList<tareas>();
            session.setAttribute("almacen",lisaux);
        }
    ArrayList<tareas> almacen = (ArrayList<tareas>)session.getAttribute("almacen");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>TAREAS PENDIENTES</h1>
        <a href="ContadorServet">saludo</a>
        <form action = "MainServet" method = "post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type= "text" name= "id" value=""></td>
                </tr>
                <tr>
                    <td>Tarea</td>
                    <td><input type= "text" name= "tarea" value=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>     
            </table>     
        </form>
        <a href="MainServet?op=vaciar">Nuevo</a>
        <h2>Contenido de tareas</h2>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th></th>
            </tr>
            <%
                if (almacen!= null) {
                   for (tareas p: almacen) {
            %>
            <tr>
                <td><%=p.getId()%></td>
                <td><%= p.getTarea()%></td>
                <td><input type="checkbox" name="completado" value="ON" /></td>
                <td><a href="MainServet?op=eliminar&id=<%=p.getId()%>">Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
