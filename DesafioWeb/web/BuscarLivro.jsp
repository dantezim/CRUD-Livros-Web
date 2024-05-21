<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="tpsemana11.*"%>
<%
    livro livro = new livro();
    livro.setTitulo(request.getParameter("titulo"));
    ALDAL.get(livro);
    String livroJSON = "{\"titulo\":\"" + livro.getTitulo() + "\", \"autor\":\"" + livro.getAutor() + "\", \"editora\":\"" + livro.getEditora() + "\", \"ano\":\"" + livro.getAno() + "\", \"localizacao\":\"" + livro.getLocalizacao() + "\"}";
    out.print(livroJSON);
%>
