<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<%@ include file="all_component/allCss.jsp" %>
<style>
    .contact-card {
        background-color: #303f9f; /* dark background */
        color: #fff;
        border-radius: 10px;
        padding: 30px;
        text-align: center;
    }
    .contact-card img {
        border-radius: 50%;
        width: 100px;
        margin-bottom: 20px;
    }
    .contact-card a {
        color: #fff;
        text-decoration: none;
    }
    .contact-card i {
        margin-right: 10px;
    }
</style>
</head>
<body style="background-color: #f7f7f7;">
<%@ include file="all_component/navbar.jsp" %>

<div class="container">
    <div class="row justify-content-center p-5">
        <div class="col-md-6 contact-card">
            <h2>Contact Us</h2>
            <p><i class="fa fa-phone"></i> <a href="tel:+1234567890">9022678700</a></p>
            <p><i class="fa fa-envelope"></i> <a href="mailto:hello@reallygreatsite.com">shreya.joshi@gmail.com</a></p>
            <p><i class="fa fa-map-marker"></i> Shivajinagar, Pune</p>
            <p>@findyourbook</p>
            <a href="index.jsp" class="btn btn-primary mt-3">Home</a>
        </div>
    </div>
</div>

</body>
</html>
