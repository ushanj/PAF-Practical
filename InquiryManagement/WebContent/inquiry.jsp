<%@page import="com.Inquiry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%    //Save---------------------------------
if (request.getParameter("itemCode") != null) 
{ 
	Inquiry itemObj = new Inquiry(); 
 String stsMsg = ""; 
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "") 
 { 
 stsMsg = itemObj.insertdetails(request.getParameter("name"), 
 request.getParameter("email"), 
 request.getParameter("subject"), 
 request.getParameter("message")); 
 } 
else//Update----------------------
 { 
 stsMsg = itemObj.updateinquiry( 
 request.getParameter("name"), 
 request.getParameter("email"), 
 request.getParameter("subject"), 
 request.getParameter("message"), request.getParameter("hidItemIDSave")); 
 } 
 session.setAttribute("statusMsg", stsMsg); 
} 
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) 
{ 
	Inquiry itemObj = new Inquiry(); 
 String stsMsg = 
 itemObj.deleteinquiry(request.getParameter("hidItemIDDelete")); 
 session.setAttribute("statusMsg", stsMsg); 
}
 %>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inquiry Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>


</head>
<body>

<h1>Welcome</h1>

	<div class="container">
 <div class="row">
 <div class="col">
 
 <h1>Items Management</h1>
<form id="formItem" name="formItem" method="post" action="items.jsp">
 Name :
<input id="name" name="name" type="text" 
 class="form-control form-control-sm">
<br> email: 
<input id="email" name="email" type="text" 
 class="form-control form-control-sm">
<br> subject: 
<input id="subject" name="subject" type="text" 
 class="form-control form-control-sm">
<br> message: 
<input id="message" name="message" type="text" 
 class="form-control form-control-sm">
<br>
<div id="alertSuccess" class="alert alert-success"></div>
 <div id="alertError" class="alert alert-danger"></div>
<input id="btnSave" name="btnSave" type="button" value="Save" 
 class="btn btn-primary">
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>
<%
							 Inquiry itemObj = new Inquiry();
							 out.print(itemObj.readInquiry());
							%>
				
<%
 out.print(session.getAttribute("statusMsg")); 
%> 
 
 </div>
 </div>
</div>
	
	





</body>
</html>