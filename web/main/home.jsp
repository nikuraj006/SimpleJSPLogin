<%-- 
    Document   : home
    Created on : 23 Mar, 2019, 8:24:18 PM
    Author     : nikur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String name=null;
    try{
        name = session.getAttribute("userName").toString();
        
    }catch(Exception e){
        response.sendRedirect("../index.html?msg=Login failed");
        e.fillInStackTrace();
    }

    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
          <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="container">
        <h1>Successful login :<%=name%></h1>
        <a href="logout.jsp">Logout</a>
        </div>
    </body>
</html>
