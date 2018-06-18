<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"
	prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	
<c:if test="${empty authors && empty editAuthorId}">
	<div class="container">
	<div class="formbox">
		<form method="POST"
			action="${pageContext.request.contextPath}/author/add">
			<div class="form-group">
				<label for="name">AuthorName:</label> <input type="text"
					required="required" name="name" 
					class="form-control" placeholder="Enter author name"
					id="name" />
			</div>
<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Save</button>
				</div>
			</div>

		</form>
	</div>
	</div>
</c:if>
<c:if test="${not empty authors}">
	<div class="form-group">
		<input type="text" class="form-control pull-right" id="search"
			placeholder="Search">
	</div>
	<div class="table-responsive">
		<table id="escalation" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${authors}" var="author">
					<tr>
						<td>${author.name}</td>
						<td colspan="2" style="width: 50px;">
							<form action="${pageContext.request.contextPath}/author/delete"
								id="formDelete_${author.id }">
								<input type="hidden" name="authorId" value="${author.id}">
							</form>
							<form action="${pageContext.request.contextPath}/author/edit"
								id="formEdit_${author.id }">
								<input type="hidden" name="authorId" value="${author.id}">
							</form>
							<div class="input-group-append">
								<button form="formEdit_${author.id }" type="submit"
									class="btn btn-outline-secondary">Edit</button>
								<button type="button" class="btn btn-outline-danger"
									data-toggle="modal" data-target="#confirmDelete_${author.id }">Delete</button>
							</div>
						</td>
					</tr>
					<!-- Modal -->
					<div class="modal fade" id="confirmDelete_${author.id }"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">Confirm Delete</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<span>Delete this author?</span><br>
									<p class="font-weight-bold text-danger">${author.name }</p>
								</div>
								<div class="modal-footer">
									<div class="container">
										<button type="button" class="btn btn-outline-secondary"
											data-dismiss="modal">Cancel</button>
										<button form="formDelete_${author.id }" type="submit"
											class="btn btn-outline-danger">Delete</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</c:if>
<c:if test="${not empty editAuthorId}">
	<div class="container">
	<div class="formbox">
		<form method="POST"
			action="${pageContext.request.contextPath}/author/saveChanges">
			

			<div class="form-group">
				<input type="hidden" name="authorId" value="${editAuthorId}">
				<label for="name">Author Name:</label> <input type="text"
					required="required" name="name" value="${authorName}"
					class="form-control" placeholder="Enter author name"
					id="name" />
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Save</button>
				</div>
			</div>

		</form>
	</div>
	</div>
</c:if>
</div>
</body>
</html>