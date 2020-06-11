
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
		 
	<form action="saveNote" method="post" modelAttribute="Note">
		Note ID: <input type="text" name="noteId"><br/>
		title  : <input type="text" name="noteTitle"><br/>
		content: <input type="text" name="noteContent"><br/>
		status : <input type="text" name="noteStatus"><br/>
		<input type=submit value="Send">
	</form>

	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
	<table border=2>
		<tr>
			<td>Id</td>
			<td>Title</td>
			<td>Content</td>
			<td>Status</td>
			<td>Created Date</td>
			<td>Action</td>
		</tr>
		<c:forEach items="${notes}" var="note">
			<tr>
				<td>${note.noteId}</td>
				<td>${note.noteTitle}</td>
				<td>${note.noteContent}</td>
				<td>${note.noteStatus}</td>
				<td><fmt:formatDate pattern="dd/MM/yyyy" value="${notes.createdAt}" /></td>
				<td><a href="deleteNote?noteId=${notes}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>