<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://bootswatch.com/united/bootstrap.css">
 <link rel="stylesheet" type="text/css" href="bootstrap.min.css"/>
 <script type="text/javascript" src="bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="bootstrap.min.css"></script>
 <script type="text/javascript" src="jquery-1.12.1.min.js"></script> 
 
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js">
        </script>
        
  <!--       <script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script> -->
</head>
<body>
<jsp:include page="header1.jsp"></jsp:include>
<%



Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/blogger";
Connection con=DriverManager.getConnection(url,"root","Nilnik@143");

String name=(String)session.getAttribute("uname");
String pwd=(String)session.getAttribute("pwd");

if(name == null)
{
	 String redirectURL = "login.jsp";
	 response.sendRedirect(redirectURL);	
}

Statement stmt=con.createStatement();
String query="select * from registration where login_name='"+name+"' and password='"+pwd+"'";
ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
%>
 <div  class="container">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3 toppad">


            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title"><%=rs.getString(5) %></h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3 col-lg-3 " align="center"> <img src="images/profileicon.png" class="img-circle img-responsive"> </div>

                        <div class=" col-md-9 col-lg-9 ">
                            <table class="table table-user-information">
                                <tbody>
                                <tr>
                                    <td>Full Name:</td>
                                    <td><%=rs.getString(1)%> <%=rs.getString(2)%></td>
                                </tr>
                                <tr>
                                    <td>Login Name:</td>
                                    <td><%=rs.getString(3)%></td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td><%=rs.getString(6)%></td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><%=rs.getString(7)%></td>
                                </tr>

                               </tbody>
                            </table>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%} %>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
