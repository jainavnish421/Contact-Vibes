<%@ page import="com.entity.User"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-square-phone"></i> ContactVibes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="addContact.jsp"><i
					class="fa-solid fa-user-plus"></i> Add Contact</a></li>

			<li class="nav-item active"><a class="nav-link" href="viewContact.jsp"><i
					class="fa-solid fa-address-book"></i> View Contact</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success active my-2 my-sm-0" type="submit">Search</button>
			
			<%
			User u=(User) session.getAttribute("user");
			if(u == null){
			%>
				<a class="btn btn-success ml-5" href="login.jsp"><i
				class="fa-solid fa-user"></i> Login</a> 
				
				<a class="btn btn-danger ml-2"
				href="register.jsp"><i class="fa-regular fa-user"></i> Register</a>
						
			<%
			}else{
			%>
				<button class="btn  ml-5"><i class="fa-solid fa-user"></i> 
				<%=u.getName()%></button>	
				
				<a data-toggle="modal" data-target="#exampleModalCenter" href="Logout" 
				class="btn btn-dark ml-2"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
			<%
			}
			%>
			
		</form>
	</div>
	<!-- Logout PopUp-->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Do You Want to Logout?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a href="Logout" class="btn btn-primary">Logout</a>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
	<!-- Logout PopUp-->
</nav>