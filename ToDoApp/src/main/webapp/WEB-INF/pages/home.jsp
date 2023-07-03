<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:if test="${page=='home' }">
	Home 
</c:if> <c:if test="${page=='add' }">
	Add
</c:if></title>
</head>
<body>
	<div>
		<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<c:out value="${msg }"></c:out>
			</div>
		</c:if>
	</div>
	<div class="container mt-3">
		<h2 class="text-center">Welcome to ToDo App</h2>
		<div class="row mt-5">
			<div class="col-md-2 text-center">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href="<c:url value="/add"></c:url>" type="button"
						class="list-group-item list-group-item-action">Add ToDo</a> <a
						href="<c:url value="/home" ></c:url>" type="button"
						class="list-group-item list-group-item-action">View ToDo's</a>
				</div>
			</div>

			<div class="col-md-10 text-center">
				<c:if test="${page=='home'}">
					<h3 class="text-center">All ToDo's</h3>
					<c:forEach items="${todos }" var="t">
						<div class="card mb-2">
							<div class="card-body" style="display:flex; align-items:flex-start; justify-content: flex-start; flex-direction: column;">
								<h4>
									<c:out value="${t.toDoTitle}"></c:out>
								</h4>
								<p>
									<c:out value="${t.toDoContent}"></c:out>
								</p>
								<b><c:out value="${t.todoDate }"></c:out></b>
							</div>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${page=='add' }">
					<h3 class="text-center">add ToDo</h3>
					<br />
					<form:form action="saveToDo" method="post" modelAttribute="todo">
						<div class="form-group">
							<form:input path="toDoTitle" cssClass="form-control"
								placeholder="Enter Title" />
						</div>
						<div class="form-group">
							<form:textarea path="toDoContent" rows="6"
								cssClass="form-control" placeholder="Enter ToDo"></form:textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary px-4">ADD</button>
						</div>
					</form:form>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>