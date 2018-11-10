<%-- 
    Document   : register
    Created on : Sep 29, 2016, 12:58:45 AM
    Author     : Oops
--%>

<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coba Login</title>
    </head>
    <body>
       
        <%
    
       String email = request.getParameter("email");
       String pass = request.getParameter("pass");
       
        try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
            
         
          Statement stmt = con.createStatement();
          stmt.execute("select uid,email,pass from user where email = '"+email+"' and  pass = '"+pass+"'");
          
        }catch(Exception e){
            
        }
        
      
        %>
    </body>
</html>
