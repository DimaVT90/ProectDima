<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>


	<c:url value="/logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>
	<center>

		<div style="color: #A0522D; font-size: 40px">List of Products</div>

		<c:if test="${!empty productsList}">
			<table border="1" bgcolor="#F4A460" width="800px">
				<tr
					style="background-color: #F4A460; color: #8B4726; text-align: center;"
					height="60px">

					<td>ID</td>
					<td>Name of Products</td>
					<td>Price</td>
					<td>Quantity</td>
					<td>Edit</td>
					<td>Delete</td>

				</tr>
				<c:forEach items="${productsList}" var="product">
					<tr
						style="background-color: #FFE4C4; color: black; text-align: center;"
						height="30px">

						<td><c:out value="${product.id}" /></td>
						<td><c:out value="${product.name}" /></td>
						<td><c:out value="${product.price}" /></td>
						<td><c:out value="${product.quantity}" /></td>
						<td><a href="editProduct?id=${product.id}">Edit</a></td>
						<td><a href="removeProduct?id=${product.id}">Delete</a></td>
	
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<h3>
			<a href="formProduct">Click Here to add new Product</a>
		</h3>
		
	</center>
</body>
</html>