<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	session="true"
	%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<link rel="Stylesheet" href="/Web_QuanAo/css/bootstrap.min.css">
<h2>
	<fmt:formatDate value="${ now }" pattern="EEEE,dd/MM/yyyy" />
	<a class="btn btn-primary" style="float: right;" href="/Web_QuanAo/users/create">Thêm</a>
</h2>
<br>
<c:if test="${!empty sessionScope.message }">
<div class="alert alert-success">
${sessionScope.message }
</div>
<c:remove var="message" scope="session"/>
</c:if>
<c:if test="${empty ds }">
	<p>Không có dữ liệu</p>
</c:if>

<c:if test="${ !empty ds }">
	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Dịa chỉ</th>
				<th>Email</th>
				<th>SDT</th>
				<th colspan="2">Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ ds }" var="st1">
				<tr>
					<td>${st1.hoTen }</td>
					<td>${st1.diaChi }</td>
					<td>${st1.email }</td>
					<td>${st1.sdt }</td>
					<td>
					  <a class="btn btn-primary" href="/Web_QuanAo/users/edit?id=${st1.id }">Cập nhập</a>
					</td>
					<td>
					  <a class="btn btn-danger" href="/Web_QuanAo/users/delete?id=${st1.id }">Xóa</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
<script src="/Web_QuanAo/js/sidebars.js"></script>
	<script type="" src="/Web_QuanAo/js/jquery.min.js"></script>
	<script type="" src="/Web_QuanAo/js/popper.min.js"></script>
	<script type="" src="/Web_QuanAo/js/bootstrap.min.js"></script>