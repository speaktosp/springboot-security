<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <title>Welcome Page</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> 
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>
    
    <div class="panel panel-default">
	  <div class="panel-heading">
	        <h3 panel-firstName></span> Registered users</h3>
	  </div>
	  <div class="panel-body">
	     <c:if test="${not empty lists}"> 
		    <ul class="list-group">
		        <c:forEach var="listValue" items="${lists}">
		            <li class="list-group-item">${listValue.username}</li>
		        </c:forEach>
		    </ul> 
		</c:if>
	   
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
