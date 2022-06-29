<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Products</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<h2>
		<fmt:formatDate value="${ now }" pattern="EEEE,dd/MM/yyyy" />
		<a class="btn btn-primary" style="float: right;"
			href="/Web_QuanAo/Products/create">Thêm</a>
	</h2>
	<br>
	<c:if test="${!empty sessionScope.message }">
		<div class="alert alert-success">${sessionScope.message }</div>
		<c:remove var="message" scope="session" />
	</c:if>
	<c:if test="${empty ds }">
		<p>Không có dữ liệu</p>
	</c:if>

	<c:if test="${ !empty ds }">
		<table class="table">
			<thead>
				<tr>
					<th>Tên</th>
					<th>Loại</th>
					<th>Số lượng</th>
					<th>Đơn giá</th>
					<th>Màu sắc</th>
					<th>Kích thước</th> 
					<th>Ảnh</th> 
					<th colspan="2">Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ ds }" var="st1">
					<tr>
						<td>${st1.ten }</td>
						<td>${st1.category.ten }</td>
						<td>${st1.soLuong }</td>
						<td>${st1.donGia }</td>
						<td>${st1.maSac }</td>
						<td>${st1.kichThuoc }</td>
						<td><img alt="" src="/Web_QuanAo/images/${st1.img }" width="50px" height="50px"></td>
						<td><a class="btn btn-primary"
							href="/Web_QuanAo/Products/edit?id=${st1.id }">Cập nhập</a></td>
						<td><a class="btn btn-danger"
							href="/Web_QuanAo/Products/delete?id=${st1.id }">Xóa</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<script src="/Web_QuanAo/js/sidebars.js"></script>
	<script type="" src="/Web_QuanAo/js/jquery.min.js"></script>
	<script type="" src="/Web_QuanAo/js/popper.min.js"></script>
	<script type="" src="/Web_QuanAo/js/bootstrap.min.js"></script>
</body>
</html>