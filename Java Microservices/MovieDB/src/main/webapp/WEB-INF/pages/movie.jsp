<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add a New Movie</title>
	</head>
	<body bgcolor="#ffffff" text="#aaad78">
		<div id="header">
			<font face="Arial">
				<h1>Local Movie Database (LMDb)</h1>
			</font>
			<hr/>
		</div>
		<div id="form"><center>
			<c:url var="addAction" value="/api/saveMovie"></c:url>
			<f:form action="${addAction}" modelAttribute="movie">
				<table width="50%">
					<tr>
						<td>Movie Index:</td>
						<td><f:input path="movieId" name="movieId"/></td>
					</tr>
					<tr>
						<td>Movie Name:</td>
						<td><f:input path="movieName" name="movieName"/></td>
					</tr>
					<tr>
						<td>Director:</td>
						<td><f:input path="directorName" name="directorName"/></td>
					</tr>
					<tr>
						<td>Budget:</td>
						<td><f:input path="budget" name="budget"/></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<c:if test="${!empty movie.movieName}">
								<input type="submit" value="Edit Movie" formaction="/api/updateMovie"/>
							</c:if>
							<c:if test="${empty movie.movieName}">
								<input type="submit" value="Add Movie" />
							</c:if>
							<input type="reset" value="clear"/></td>
					</tr>
				</table>
			</f:form>
		</center></div>
		<hr/>
		
		<div id="list"><center>
			<h3>Movie List</h3>
			<c:if test="${!empty allMovies}">
				<table border="5">
					<tr>
						<th width="50">Index</th>
						<th width="240">Movie Name</th>
						<th width="180">Directed By</th>
						<th width="180">Budget</th>
						<th width="80">Edit</th>
						<th width="80">Delete</th>
					</tr>
					<c:forEach items="${allMovies}" var="movie">
						<tr>
							<td>${movie.movieId}</td>
							<td>${movie.movieName}</td>
							<td>${movie.directorName}</td>
							<td>${movie.budget} millions</td>
							<td><a href="<c:url value='/update/${movie.movieId}'/>">Edit</a></td>
							<td><a href="<c:url value='/api/deleteById/${movie.movieId}'/>">Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		</center></div>
	</body>
</html>