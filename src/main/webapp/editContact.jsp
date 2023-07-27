<%@ page import="com.entity.User"%>
<%@ page import="com.dao.ContactDAO"%>
<%@ page import="com.conn.DbConnect"%>
<%@ page import="com.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContactVibes</title>
<%@include file="component/allCss.jsp" %>
<style type="text/css">

.back-img{
background: url("img/bg.webp");
width: 100%;
height: 79vh;
background-repeat: no-repeat;
background-size: cover;
}

</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	User user=(User) session.getAttribute("user");
	if(user==null){
		session.setAttribute("invalidMsg", "Please Login!!");
		response.sendRedirect("login.jsp");
	}
	%>
	
	
	<div class="container-fluid back-img">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body " style="background-color: #afdef0">
					<h4 class="text-center text-success">Edit Contact</h4>
						
						
						<%
						String failedMsg=(String) session.getAttribute("failedMsg");
						if(failedMsg != null){
						%>
							<p class="text-danger text-center "><%=failedMsg %></p>		
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						
						
						<form action="UpdateContact" method="post">
						
							<%
							int cid=Integer.parseInt(request.getParameter("cid"));
							ContactDAO dao=new ContactDAO(DbConnect.getConn());
							Contact c=dao.getContactByID(cid);
							%>
							
							<input type="hidden" value="<%=cid%>" name="cid">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input name="name"
									value="<%=c.getName() %>"
									type="text" class="form-control" id="exampleInputname1"
									aria-describedby="nameHelp" >	
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									value="<%=c.getEmail() %>"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >	
							</div>
							
							<div class="form-group">
								<label for="exampleInputNumber1">Contact Number</label> <input name="phno"
									value="<%=c.getPhno() %>"
									type="number" class="form-control" id="exampleInputNumber1"
									aria-describedby="numberHelp" >	
							</div>
							
							<div class="form-group">
								About
								<textarea rows="1" name="about" class="form-control"><%=c.getAbout() %>
								</textarea> 	
							</div>
							
							
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Update Contact</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>