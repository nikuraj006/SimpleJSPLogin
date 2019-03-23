<%-- 
    Document   : Login
    Created on : 23 Mar, 2019, 8:18:14 PM
    Author     : nikur
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="utility.AuthCheck"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name=request.getParameter("username");  
String pwd=request.getParameter("password");
String sqlQuery = "select * from registeruser where userName=? and password=?";
ResultSet result = AuthCheck.authCheck(name, pwd,sqlQuery);
while (result.next()) {
    if(result.getString("userName").endsWith(name) && result.getString("password").endsWith(pwd))
    {   
        session.setAttribute("userName", result.getString("Name"));
        response.sendRedirect("home.jsp");
    }
    return;
}
response.sendRedirect("../index.html?msg=Login failed");
%> 

