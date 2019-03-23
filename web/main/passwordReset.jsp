<%-- 
    Document   : passwordReset
    Created on : 23 Mar, 2019, 9:05:43 PM
    Author     : nikur
--%>

<%@page import="utility.AuthCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="utility.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%
String name=request.getParameter("username");
String aadhar=request.getParameter("aadhar");
String pwd1=request.getParameter("password1");
String pwd2=request.getParameter("password1");

if(pwd1!=pwd2)
{
    response.sendRedirect("../pwdReset.jsp?msg=password should be same");
    return;
}
String sqlQuery = "select * from registeruser where userName=? and AadharNo=?";
ResultSet result = AuthCheck.authCheck(name, aadhar,sqlQuery);
while (result.next()) {
    if(result.getString("userName").endsWith(name) && aadhar.endsWith(result.getString("AadharNo")))
        {  
            Connection con = DBConnection.dbConnection();
            String query = "UPDATE registeruser set password=? WHERE userName=? and AadharNo=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, pwd1);
            stmt.setString(2, name);
            stmt.setString(3, aadhar);
            int t = stmt.executeUpdate();
            if(t>0){
                session.setAttribute("userName", result.getString("Name"));
                response.sendRedirect("home.jsp?msg=password changed!");
                
            }else{
                response.sendRedirect("../pwdReset.html?msg=Password not changed.");
               
            }            
        }else{
        response.sendRedirect("../pwdReset.html?msg=Aadhar Number is wrong.");
    }
    
    
}
response.sendRedirect("../pwdReset.html?msg=Aadhar Number is wrong.");
%>