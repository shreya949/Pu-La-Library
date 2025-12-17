<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.User" %>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u=(User)session.getAttribute("userobj");
	%>
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
	BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=b.getPhotoName()%>"
					style="width: 50%; height: 200px; object-fit: cover; border-radius: 5px;">

				<h4 class="mt-3">
					Book Name: <span class="text-success"> <%=b.getBookName()%>
					</span>
				</h4>
				<h4>
					Author Name: <span class="text-success"> <%=b.getAuthor()%>
					</span>
				</h4>
				<h4>
					Category: <span class="text-success"> <%=b.getBookCategory()%>
					</span>
				</h4>

			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>
				<%
				}
				%>
				
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>
					</div>

				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<!-- Old Book -->
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"> <i
						class="fa-solid fa-cart-plus"></i> Continue Shopping
					</a> <a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>
				<%
				} else {
				%>
				<!-- New Book -->
				<div class="text-center p-3">
					<%
					if (u == null) {
					%>
					<!-- User not logged in -->
					<a href="login.jsp" class="btn btn-primary"> <i
						class="fa-solid fa-cart-plus"></i> Add Cart
					</a>
					<%
					} else {
					%>
					<!-- User logged in -->
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary"> <i class="fa-solid fa-cart-plus"></i>
						Add Cart
					</a>
					<%
					}
					%>
					<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
					
				</div>
				<%
				}
				%>


			</div>
		</div>
	</div>
</body>
</html>