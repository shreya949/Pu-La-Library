<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page import="com.entity.BookDetails" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PuLa Library: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img{
	background: url("img/2.jpg");
	height: 100vh;
	width: 90%;
	background-size: cover;
	background-repeat: no-repeat;
}
.crd-ho:hover{
	background-color: #f7f7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u=(User)session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger"></h2>
	</div>
	
	<!--Start recent book-->
	<div class="container" >
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
		<%
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBook();
			for(BookDetails b : list2) {
		%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100%; height: 300px; object-fit: cover; border-radius: 5px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
						<%
						if(b.getBookCategory().equals("Old")){
							%>
							Categories: <%=b.getBookCategory()%></p>
							<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
							<%
						}else{%>
							Categories: <%=b.getBookCategory()%></p>
						<div class="row">
				<%
				if (u == null) {
				%>
					<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>		 
				<%
				} else {
				%>
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
				<%
				}
				%>
							<a href="" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						
						<%}
						%>
						
					</div>
				</div>
			</div>
		<%
		}
		%>
		</div>
		<div>
			<div class="text-center mt-1">
				<a href="./all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View</a>
			</div>
		</div>
	</div>
	<!--End recent book-->
	<hr>
	<!--Start new book-->
	<div class="container" >
		<h3 class="text-center">New Book</h2>
		<div class="row">
			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBook();
			for(BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100%; height: 300px; object-fit: cover; border-radius: 5px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>
						<div class="row">
				<%
				if (u == null) {
				%>
					<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>		 
				<%
				} else {
				%>
					<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
				<%
				}
				%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div>
			<div class="text-center mt-1">
				<a href="./all_new_book.jsp" class="btn btn-danger btn-sm text-white">View</a>
			</div>
		</div>
	</div>
	<!--End new book-->
	<hr>
	<!--Start old book-->
	<div class="container" >
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDAOimpl dao3 = new BookDAOimpl(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBook();
			for(BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>" style="width: 100%; height: 300px; object-fit: cover; border-radius: 5px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>Categories: <%=b.getBookCategory()%></p>
						
						<div class="row">
							
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>			
			<%
			}
			%>
		</div>
		<div>
			<div class="text-center mt-1">
				<a href="./all_old_book.jsp" class="btn btn-danger btn-sm text-white">View</a>
			</div>
		</div>
	</div>
	<!--End old book-->
<%@include file="all_component/footer.jsp"%>	
</body>
</html>