<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-2">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>
						<c:if test="${not empty failedmsg}">
							<h5 class="text-center text-danger">${failedmsg}</h5>
							<c:remove var="failedmsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="login" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
								<small> <a href="forgot_password.jsp">Forgot
										Password?</a>
								</small>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<hr>
								<div class="text-center mb-2">
									<p>Or</p>
									<button class="btn btn-outline-danger btn-block" disabled>
										<img
											src="https://developers.google.com/identity/images/g-logo.png"
											style="width: 20px; margin-right: 10px;" /> Sign in with
										Google
									</button>
								</div>

								<br> <a>Don't have an account? </a><a href="register.jsp">Sign
									up</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>