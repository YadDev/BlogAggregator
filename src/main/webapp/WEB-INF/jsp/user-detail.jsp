<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	
	
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
	
	 
	