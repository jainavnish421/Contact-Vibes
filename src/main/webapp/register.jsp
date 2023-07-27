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
	<div class="container-fluid back-img">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3 pt-5">
				<div class="card">
					<div class="card-body " style="background-color: #afdef0">
					<h4 class="text-center text-success">Registartion Page</h4>
					<%
					String sucssMsg=(String) session.getAttribute("sucssMsg");
					String errorMsg=(String) session.getAttribute("errorMsg");
					
					if(sucssMsg != null){
					%>
						<p class="text-success text-center"><%=sucssMsg %></p>	
						
					<%
					session.removeAttribute("sucssMsg");
					}
					if(errorMsg != null){
					%>
						<p class="text-danger text-center"><%=errorMsg %></p>	
						
					<%
					session.removeAttribute("errorMsg");
					}
					%>
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input name="name"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name">
								
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="text-center mt-2">
								<button type="submit" class="btn btn-primary">Register</button>
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