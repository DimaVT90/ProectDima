<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<body>
	<sec:authorize access="!hasRole('ROLE_USER')">
		<h3>
			<a href="login">Click Here to Go to Login Page </a>
		</h3>
	</sec:authorize>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h3>
			<a href="listAdmin">Click Here to GO to AdminPage</a>
		</h3>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
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
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
		<center>

			<div style="color: #009ACD; font-size: 40px">List of Products</div>

			<c:if test="${!empty productsList}">
				<table border="1" bgcolor="#A2B5CD" width="800px">
					<tr
						style="background-color: #A2B5CD; color: #1874CD; text-align: center;"
						height="60px">

						<td>ID</td>
						<td>Name of Products</td>
						<td>Price</td>
						<td>Quantity</td>

					</tr>
					<c:forEach items="${productsList}" var="product">
						<tr
							style="background-color: white; color: black; text-align: center;"
							height="30px">

							<td><c:out value="${product.id}" /></td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><c:out value="${product.quantity}" /></td>

						</tr>
					</c:forEach>
				</table>
			</c:if>


		</center>

	</sec:authorize>


</body>
</html>