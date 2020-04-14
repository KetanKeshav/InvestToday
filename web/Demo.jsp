<%-- 
    Document   : Demo.jsp
    Created on : Nov 25, 2018, 4:28:42 PM
    Author     : ketan
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String name=request.getParameter("name");
            String imgurl=request.getParameter("imgurl");
            String wurl=request.getParameter("wurl");
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invest_today?useSSL=false", "root", "root");
            
            
            
            String qr="insert into shares(name,imgurl,wurl) values(?,?,?)";
            PreparedStatement pst=con.prepareStatement(qr);
            pst.setString(1, name);
            pst.setString(2,imgurl);
            pst.setString(3,wurl);
            pst.executeUpdate();
            response.sendRedirect("shares.html");
            %>
    </body>
</html>
