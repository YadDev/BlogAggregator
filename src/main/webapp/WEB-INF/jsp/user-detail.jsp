<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<%@include file="../layouts/tagLib.jsp"  %>
		
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  		New blog
	</button>

<!-- Modal -->
<form:form commandName="blog" cssClass="form-horizontal">
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add New Blog</h4>
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
        
      </div>
    </div>
  </div>
</div>
</form:form>
	<br><br><br>
<script type="text/javascript">
	$(document).ready(function(){
		$('.nav-tabs a:first').tab('show') // Select first tab
		 /* $(".triggerRemove").click(function(e){
			e.preventDefault;
			$("#modalRemove .removeBtn").attr("href",$(this).attr("href"));
			$("#modelRemove").modal();
		});  */
	});
</script>
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
  <c:forEach items="${user.blogs}" var="blog">
    <div class="tab-pane" id="blog_${blog.id}">
    		<h1>
				${blog.name}
			</h1>
			<p>
					
					<a href="<spring:url value="/blog/remove/${blog.id}.html"/>" class="btn btn-danger triggerRemove">Delete Blog</a>			
			
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
    
    </div>
      
  </c:forEach>	
</div>
	
	<!-- Confirm Modal -->
	
<!-- 	<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a href="" class="btn btn-danger removeBtn">Delete Blog</a>
      </div>
    </div>
  </div>
</div>
--> 
		
	
	
	 
	