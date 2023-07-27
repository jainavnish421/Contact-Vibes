<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContactVibes</title>
<%@include file="component/allCss.jsp"%>
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
					<h4 class="text-center text-success">Add Contact</h4>
						
						
						<%
						String succMsg=(String) session.getAttribute("succMsg");
						String failedMsg=(String) session.getAttribute("failedMsg");
						if(succMsg != null){
						%>
							<p class="text-success text-center"><%=succMsg %></p>		
						<%
						session.removeAttribute("succMsg");
						}
						%>
					
						<%
						if(failedMsg != null){
						%>
							<p class="text-danger text-center "><%=failedMsg %></p>		
						<%
						session.removeAttribute("failedMsg");
						}
						%>
						
						
						<form action="addContact" method="post">
						
							<%
							if(user!=null){
							%>
								<input type="hidden" value="<%=user.getId()%>" name="userid">
							<%
							}
							%>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputname1"
									aria-describedby="nameHelp" placeholder="Enter name">	
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">	
							</div>
							
							<div class="form-group">
								<label for="exampleInputNumber1">Contact Number</label> <input name="phno"
									type="number" class="form-control" id="exampleInputNumber1"
									aria-describedby="numberHelp" placeholder="Enter number">	
							</div>
							
							<div class="form-group">
								About
								<textarea rows="1" placeholder="Enter about" name="about" 
								class="form-control"></textarea> 	
							</div>
							
							
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Save Contact</button>
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