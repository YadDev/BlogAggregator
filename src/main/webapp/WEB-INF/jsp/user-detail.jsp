<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@include file="../layouts/tagLib.jsp"  %>
		
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  		New blog
	</button>

<!-- Modal -->
<<form:form commandName="blog">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <div class="form-group">
				<label for="name" class="col-sm-2 control-label">Name:</label>
				<div class="col-sm-10">
      				<form:input path="name" cssClass="form-control"/>
    			</div>
			</div>
			<div class="form-group">
				<label for="name" class="col-sm-2 control-label">URL</label>
				<div class="col-sm-10">
      				<form:input path="url" cssClass="form-control"/>
    			</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary" value="save">
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</form:form>
	<br><br><br>
<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
  	<c:forEach items="${user.blogs}" var="blog">
	    <li>
	    	<a href="#blog_${blog.id}" data-toggle="tab">${blog.name}</a>
	    </li>
	</c:forEach>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">...</div>
    <div role="tabpanel" class="tab-pane" id="profile">...</div>
    <div role="tabpanel" class="tab-pane" id="messages">...</div>
    <div role="tabpanel" class="tab-pane" id="settings">...</div>
  </div>

</div>
	
	<br><br><br>
	
	<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>User ID</th>
					<th>User Name</th>
				</tr>
				
			</thead>
			<tbody>
				
					<tr>
						<td>
							${user.id}
						</td>
						<td>
							${user.name}
						</td>
					</tr>
					
				
			</tbody>
	</table> 
	
	<c:forEach items="${user.blogs}" var="blog">
	
			<h1>
				${blog.name}
			</h1>
			<p>
				${blog.url}
			</p>
	
		<table class="table table-bordered table-hover table-striped">
			<thead>
				<tr>
					<th>Title</th>
					<th>Link</th>
				</tr>
				
			</thead>
			<tbody>
					<c:forEach items="${blog.items}" var="item">
						<tr>
							<td>
								${item.title}
							</td>
							<td>
								${item.link}
							</td>
					</tr>	
					</c:forEach>
			</tbody>
	</table>
	</c:forEach>
	
	 
	