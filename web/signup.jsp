<%-- 
    Document   : signup
    Created on : Nov 25, 2018, 12:48:49 AM
    Author     : ketan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@  page import ="java.sql.*"%> 
        <%@ page import="javax.sql.*"%>
        <% 
            String email=request.getParameter("email");
            String psw=request.getParameter("psw");
            String cpsw=request.getParameter("cpsw");
            String acn=request.getParameter("acn");
            String pcn=request.getParameter("pcn");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invest_today?useSSL=false", "root", "root");
            
            
                CallableStatement calstat=con.prepareCall("{call signup1(?,?,?,?,? )}");
                
                calstat.setString(1,email);
                calstat.setString(2,psw);
                calstat.setString(3,cpsw);
                calstat.setString(4,acn);
                calstat.setString(5,pcn);
                   
                ResultSet rs=calstat.executeQuery();
            
                 con.close();
                 calstat.close();
                 //out.println("you data has inserted into the table.");
                 response.sendRedirect("signin.html");
                 
                   
                
                
                
           
            %>
    </body>
</html>