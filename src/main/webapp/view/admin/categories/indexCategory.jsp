<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<h2>
		<fmt:formatDate value="${ now }" pattern="EEEE,dd/MM/yyyy" />
		<a class="btn btn-primary" style="float: right;"
			data-bs-toggle="modal" data-bs-target="#staticBackdrop">Thêm</a>
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Thêm thể
							loại</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form method="POST" action="store" enctype="multipart/form-data">
							<div>
								<label style="font-size: 25px">Tên danh mục</label> <br> <input
									class="form-control" type="text" name="ten" />
							</div>
							<label>Hình ảnh</label>
							<div class="input-group">
								<input type="file" class="form-control" name="img">
							</div>
							<button type="submit" class="btn btn-primary">Thêm mới</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</h2>
	<br>
	<c:if test="${!empty sessionScope.message }">
		<div class="alert alert-success">${sessionScope.message }</div>
		<c:remove var="message" scope="session" />
	</c:if>
	<c:if test="${empty ctg }">
		<p>Không có dữ liệu</p>
	</c:if>

	<c:if test="${!empty ctg }">
		<table class="table">
			<thead>
				<tr>
					<th>Tên</th>
					<th>Người tạo</th>
					<th colspan="2">Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ctg }" var="st1">
					<tr>
						<td>${st1.ten }</td>
						<td>${st1.userC.hoTen }</td>
						<td><a class="btn btn-primary" style="float: right;"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop${st1.id}">Cập nhập</a>
							<div class="modal fade" id="staticBackdrop${st1.id}"
								data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">Cập
												nhập loại</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form method="POST"
												action="/Web_QuanAo/categories/update?id=${st1.id}" enctype="multipart/form-data">
												<div>
													<label style="font-size: 25px">Tên danh mục</label> <br>
													<input class="form-control" type="text" name="ten" value="${st1.ten }"/>
												</div>
												<label>Hình ảnh</label>
												<div class="input-group">
													<input type="file" class="form-control" name="img" value="${st1.img }">
												</div>
												<button type="submit" class="btn btn-primary">Update</button>
											</form>
										</div>
									</div>
								</div>
							</div></td>
						<td><a class="btn btn-danger"
							href="/Web_QuanAo/categories/delete?id=${st1.id }">Xóa</a></td>
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