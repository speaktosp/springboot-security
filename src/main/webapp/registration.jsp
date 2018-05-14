<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create an account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">  
</head>

<body>

<div class="container">
	<div class="panel panel-default">
	  <div class="panel-heading">
	        <h3 panel-firstName></span> Registration Page </h3>
	  </div>
	  <div class="panel-body">
	    <form:form method="POST" modelAttribute="userForm" class="form-signin"> 
	        <spring:bind path="username">
	            <div class="form-group ${status.error ? 'has-error' : ''}">
	                <form:input type="text" path="username" class="form-control" placeholder="Username"
	                            autofocus="true"></form:input>
	                <form:errors path="username"></form:errors>
	            </div>
	        </spring:bind>
	
	        <spring:bind path="password">
	            <div class="form-group ${status.error ? 'has-error' : ''}">
	                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
	                <form:errors path="password"></form:errors>
	            </div>
	        </spring:bind>
	
	        <spring:bind path="passwordConfirm">
	            <div class="form-group ${status.error ? 'has-error' : ''}">
	                <form:input type="password" path="passwordConfirm" class="form-control"
	                            placeholder="Confirm your password"></form:input>
	                <form:errors path="passwordConfirm"></form:errors>
	            </div>
	        </spring:bind>
	
	        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
	    </form:form>
	    </div>
	</div>
	<div id="footer">
		<div class="navbar navbar-fixed-bottom"> 
			<div style="text-align: center;" class="container">
				<footer class="row col-md-16">
					Created by <a href="https://www.linkedin.com/in/saravana-perumal-ramachandran-4249084/" target="_blank">Saravana</a> 
				</footer> 
			</div>
		</div>
	</div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
