<%@ page import="com.entity.User"%>
<%@ page import="com.dao.ContactDAO"%>
<%@ page import="com.conn.DbConnect"%>
<%@ page import="com.entity.Contact"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContactVibes</title>
<%@include file="component/allCss.jsp" %>
<style type="text/css">
.crd-ho:hover{
	background-color: #f7f7f7;
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
	
	<%
	String succMsg=(String) session.getAttribute("succMsg");
	if(succMsg != null){
	%>
		<div class="alert alert-success" role="alert"><%=succMsg%></div>		
	<%
	session.removeAttribute("succMsg");
	}
	String failedMsg=(String) session.getAttribute("failedMsg");
	if(failedMsg != null){
	%>
		<div class="alert alert-danger" role="alert"><%=failedMsg %></div>		
	<%
	session.removeAttribute("failedMsg");
	}
	%>
	
	<%
	Contact c1=new Contact();
	%>
	
	<div class="container-fluid">
		
		<div class="row p-4">
		<%
		if(user!=null){
			ContactDAO dao=new ContactDAO(DbConnect.getConn());
			List<Contact> contact=dao.getAllContact(user.getId());
			
			for(Contact c:contact){
		%>
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body ">
						<h5>Name: <%=c.getName() %></h5>
						<p>Ph no.: <%=c.getPhno() %></p>
						<p>Email: <%=c.getEmail() %></p>
						<p>About: <%=c.getAbout() %></p>
						<%c1=c; %>
						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>" class="btn btn-success btn-sm text-white">Edit</a>
							<a data-toggle="modal" data-target="#exampleModalCenter1"  
							class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
		}
		%>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	
	<!-- Delete PopUp-->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Do You Want to Delete Contact?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a href="delete?cid=<%=c1.getId()%>" class="btn btn-primary">Delete</a>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>
	<!-- Delete PopUp-->
</body>
</html>