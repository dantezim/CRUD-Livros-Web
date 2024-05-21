<%-- 
    Document   : DeletarLivro
    Created on : 19 de mai. de 2024, 12:27:43
    Author     : uryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="tpsemana11.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        livro livro = new livro();
        livro.setTitulo(request.getParameter("titulo"));
        ALDAL.delete(livro);
        response.sendRedirect("livro.html");
        %>
    </body>
</html>
