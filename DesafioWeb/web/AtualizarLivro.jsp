<%-- 
    Document   : AtualizarLivro
    Created on : 19 de mai. de 2024, 12:27:26
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
        livro key = new livro();
        livro data = new livro();
        key.setTitulo(request.getParameter("titulo"));
        data.setAutor(request.getParameter("autor"));
        data.setEditora(request.getParameter("editora"));
        data.setAno(request.getParameter("ano"));
        data.setLocalizacao(request.getParameter("localizacao"));
        ALDAL.update(data, key);
        response.sendRedirect("livro.html");
        %>
        
    </body>
</html>
