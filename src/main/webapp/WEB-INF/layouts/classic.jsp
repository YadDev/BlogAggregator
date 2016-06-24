<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
    
<!DOCTYPE html>
<html>
<head>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%-- <%@ taglib uri="http://jakarta.apache.org/taglibs/standard/permittedTaglibs" prefix="security" %> --%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!-- Bootstrap CDN -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<!-- Bootstrap CDN end  Here -->


<!-- JQuery CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<!-- JQuery CDN End Here-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/> </title>
</head>
<body>
	
	<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
	<tilesx:useAttribute name="current"/>
	
		
	<div class="container">
 <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href='<spring:url value="/"/>'>JBA</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="${current=='index'? 'active' : ''}"><a href='<spring:url value="/"/>'>Home</a></li>
              <security:authorize access="hasRole('ROLE_ADMIN')">
              		<li class="${current=='users'? 'active' : ''}"><a href="<spring:url value="/users.html"/>">User</a></li>
              </security:authorize>
              <li class="${current=='register'? 'active' : ''}"><a href="<spring:url value="/register.html"/>">Register</a></li>
              
              <security:authorize access="!isAuthenticated()">
              		<li class="${current=='login'? 'active' : ''}"><a href="<spring:url value="/login.html"/>">Login</a></li>
              </security:authorize>
           	  <security:authorize access="isAuthenticated()">
              		 <li><a href="<spring:url value="/logout"/>">Logout</a></li>
              </security:authorize>
           	  
           	 
            </ul>
           
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>	
	
		<tiles:insertAttribute name="body"/>
		
		
		<br><br>
		
		
		<center>
			<tiles:insertAttribute name="footer"/>
		</center>
			
		
	</div>
		
</body>
</html>