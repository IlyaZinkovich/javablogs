<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../pages/taglib.jsp"%>
<tilesx:useAttribute name="current"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
        <title><tiles:getAsString name="title"/></title>
    </head>


    <body>

        <div class="container">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<spring:url value="/"/>">Java Blog Aggregator</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="${current == 'index' ? 'active' : ''}"><a href="<spring:url value="/"/>">Home</a></li>
                            <security:authorize access="hasRole('ROLE_ADMIN')">
                                <li class="${current == 'users' ? 'active' : ''}"><a href="<spring:url value="/users.html"/>">Users</a></li>
                            </security:authorize>
                            <li class="${current == 'register' ? 'active' : ''}"><a href="<spring:url value="/register.html"/>">Register</a></li>
                            <security:authorize access="! isAuthenticated()">
                                <li class="${current == 'login' ? 'active' : ''}"><a href="<spring:url value="/login.html"/>">Login</a></li>
                            </security:authorize>
                            <security:authorize access="isAuthenticated()">
                                <li class="${current == 'account' ? 'active' : ''}"><a href="<spring:url value="/account.html"/>">My account</a></li>
                                <li><a href="<spring:url value="/logout"/>">Logout</a></li>
                            </security:authorize>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Action</a></li>
                                    <li><a href="#">Another action</a></li>
                                    <li><a href="#">Something else here</a></li>
                                    <li class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>
                            <li><a href="../navbar-static-top/">Static top</a></li>
                            <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <div class="container">
            <tiles:insertAttribute name="body"/>
        </div>

        <footer class="footer">
            <div class="container">
                <p class="text-muted" align="center">
                    <tiles:insertAttribute name="footer"/>
                </p>
            </div>
        </footer>

    </body>
</html>
