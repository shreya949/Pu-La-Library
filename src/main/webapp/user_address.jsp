<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					
						<h5 class="text-center text-success p-1">Add Address</h5>
						<form action="register" method="post">
							<div class="form-row">
								
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label><input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label><input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label><input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label><input type="text"
										class="form-control" id="inputEmail4" value="">
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">Pin Code</label><input type="number"
										class="form-control" id="inputEmail4" value="">
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning text-white">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>