<%-- 
    Document   : signin
    Created on : Nov 25, 2018, 2:40:56 AM
    Author     : ketan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-in</title>
    </head>
    <body>
            <%@page import ="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
           String email=request.getParameter("email");
            String psw=request.getParameter("psw");
            try
            {
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invest_today?useSSL=false", "root", "root");
               String Query="select * from signup where email=? and psw=?";
               PreparedStatement psm=con.prepareStatement(Query);
               psm.setString(1, email);
               psm.setString(2, psw);
               ResultSet rs=psm.executeQuery();
               if(rs.next())
               {
                   response.sendRedirect("index.html");
               }
               else
            {
                  response.sendError(401,"Invalid Credentials");
            }
           }
               
           
           
           catch(Exception e)
        {
            out.println(e);
        }

            
        
           
  
%>
    </body>
</html>
