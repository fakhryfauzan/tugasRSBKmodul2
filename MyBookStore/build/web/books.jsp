<%-- 
    Document   : books
    Created on : Jun 2, 2018, 1:51:05 AM
    Author     : kelompok 14 fakhry fauzan dan kawan-kawan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>
        <%@ include file="header.jsp"%>
    </head>
    <body>
        <h1>Books are here</h1>
     <%
     try{
         String book_name = request.getParameter("search_boook");
          Class.forName("com.mysql.jdbc.Driver");
          Connection  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
            
         
          Statement stmt = con.createStatement();
           ResultSet rs = stmt.executeQuery("select bname,bdes,book_location from book where bname = '"+book_name+"'");
         
         while(rs.next())
         {
             String book = rs.getString("bname");
             String book_des = rs.getString("bdes");
             String book_loc = rs.getString("book_location");
             %>
             <h1 style="width: 800px"> <%out.print(book);
              out.print( " "+book_des);
             out.print( " "+book_loc);%>
              <a href="http://localhost:8080/MyBookStore/<%out.println(book_loc);%>">Download</a></h1>
             
            <%
         }
        }catch(Exception e){
            
        }
     %>
     
    </body>
</html>
