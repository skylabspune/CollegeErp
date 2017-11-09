<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.proj.Utils.DBClass"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

			<!-- this page is for viewig mentor profile only -->

      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mentor Panel</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
<%

	//--------------Getting Session data in String variables----------------//
	
			String uname=(String)session.getAttribute("sessionUname");
			String type=(String)session.getAttribute("sessionType");
			String password=(String)session.getAttribute("sessionPassword");
			
	//-----------------------------------------------------------------------//
	Connection con=DBClass.DBConnectMethod();

%>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Mentor Panel</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"><form method="link" action="logout.jsp">
 					<input type="submit" value="Logout" class="btn btn-danger square-btn-adjust"></div>	
				 </form>
        </nav>    
        
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
				        <li>
                       <a  href="mentorHome.jsp"><i class="fa fa-dashboard fa-3x"></i> Dashboard</a>
                    </li>
                      <li>
                        <a  href="viewMenteeProfile.jsp"><i class="glyphicon glyphicon-user"></i>View MyProfile</a>
                    </li> 
                    <li>
                        <a  href="mentorprofile.jsp"><i class="glyphicon glyphicon-user"></i>Edit Profile</a>
                    </li> 
                  
                    <li>
                        <a  href="menteeDetails.jsp"><i class="glyphicon glyphicon-eye-open"></i> View Mentee Deatils</a>
                   </li>
                   <li>
                        <a  href="Messages.jsp"><i class="glyphicon glyphicon-comment"></i>Messages</a>
                   </li>	
                    
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12"> <div class="row">
                    <div class="col-md-8">
                     
                     <font> ${Failmessage}</font> 
                     <%
	                       	  
                               String unameFromMentor="";
                               String fnameFromMentor="";
                               String lnameFromMentor="";
                               String phnFromMentor="";
                               String emailFromMentor="";
                               String domainFromMentor="";
                           
                               	String dname=(String)session.getAttribute("dept");
                               		
                               		PreparedStatement ps=con.prepareStatement("select * from mentor where uname=? and password=?");
                               		ps.setString(1,uname);
                               		ps.setString(2,password);
                               		ResultSet rs=ps.executeQuery();
                               	
                               		if(rs.next()){
                               			
                               			fnameFromMentor=rs.getString("fname");
                               			lnameFromMentor=rs.getString("lname");
                               		 phnFromMentor=rs.getString("phn");
                               		 emailFromMentor=rs.getString("email");
                               		 domainFromMentor=rs.getString("domain");
                               		
                               		
                               		}  %>
                               		
          <div class="panel panel-default">
                       
                        <div class="panel-heading">
                           My Profile 
                        </div>
                         <div class="col-md-8">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    
                                 
                                        <tr class="success">
                                            <td>First Name</td>
                                            <td><%=fnameFromMentor%></td>
                                        </tr>
                                        <tr class="info">
                                            <td>Last Name</td>
                                          <td><%=lnameFromMentor%></td>
                                           
                                        </tr>
                                        <tr class="warning">
                                            <td>Phone</td>
                                         <td><%=phnFromMentor %></td>
                                           
                                        </tr>
                                        <tr class="danger">
                                            <td>Email</td>
                                        <td><%=emailFromMentor %></td>
                                        </tr>
                                        <tr class="success">
                                            <td>Domain</td>
                                           <td><%=rs.getString(10)%></td>
                                        </tr>
                                        <tr class="info">
                                            <td>Department</td>
                                           <td><%=session.getAttribute("sessionDname") %></td>
                                           
                                        </tr>
                             
                                </table>
                                        <a href="mentorprofile.jsp"><button type="submit" class="btn btn-primary">Edit My Profile </button></a>
                            </div>
                        </div>
                    </div>
              	</div>
              		
              		 
              		  <img src="RetriveImageServlet?uname=<%=uname%>" class="col-md-4">  
 
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
