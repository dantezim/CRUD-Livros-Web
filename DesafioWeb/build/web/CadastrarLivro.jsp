<%-- 
    Document   : CadastrarLivro
    Created on : 17 de mai. de 2024, 17:15:45
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
            livro.setAutor(request.getParameter("autor"));
            livro.setEditora(request.getParameter("editora"));
            livro.setAno(request.getParameter("ano"));
            livro.setLocalizacao(request.getParameter("localizacao"));
            ALDAL.geraTabela(livro);
            ALDAL.set(livro);
            response.sendRedirect("livro.html");
        %>*
    </body>
</html>
