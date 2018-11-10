<%-- 
    Document   : userprofile
    Created on : Jun 2, 2018, 1:51:05 AM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" type="text/css" rel="stylesheet"/>
        <title>User Profile</title>
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <%
         try{
        HttpSession session1=request.getSession(false);  
        if(session1!=null){  
        String name=(String)session1.getAttribute("name");  
        out.println(name);
        
             
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TUBES", "root", "");
          Statement stmt = con.createStatement();
          ResultSet rs = stmt.executeQuery("select * from user where uid = '"+name+"'");
          rs.next();
          String name2 = rs.getString("name");
          String email = rs.getString("email");
          %>
           <h1><%out.println(name2);%></h1>
           <h1><%out.println(email);%></h1>
           
           <%
        } }catch(Exception e){
          out.println(e);
         }
     
          
       
        %>
        
       
       
    </body>
</html>
