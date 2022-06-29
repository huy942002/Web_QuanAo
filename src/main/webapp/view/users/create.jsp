<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    session="true"
    %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<br>
<c:if test="${!empty sessionScope.error }">
<div class="alert alert-danger">
${sessionScope.error }
</div>
</c:if>
<c:if test="${!empty sessionScope.message }">
		<div class="alert alert-success">${sessionScope.message }</div>
		<c:remove var="message" scope="session" />
	</c:if>
<form method="Post" action="store" enctype="multipart/form-data">
		<label>Họ và tên</label> 
		<br> 
		<input class="form-control" type="text" name="hoTen">
		<br> 
		<label>Địa chỉ</label>
		 <br> 
		 <input class="form-control" type="text"name="diaChi"> 
		 <br> 
		 <label>Email</label> 
		 <br> 
		 <input class="form-control" type="email" name="email"> 
		 <br> 
		 <label>PassWord</label>
		 <br>
		 <input class="form-control" type="password" name="password">
		 <br>
		 <label>Số điện thoại</label>
		 <br>
		 <input class="form-control" type="text" name="sdt"> 
		 <br>
			<label>Giới Tính</label>
				<input type="radio" name="gioiTinh" value="0"> <label>
					Nam </label>
				<input type="radio" name="gioiTinh" value="1"> 
				<label> Nữ</label>
				<br>
		 <label>Hình ảnh</label>
		 <div class="input-group">
  		 <input class="form-control" type="file" class="form-control" name="avatar">
  		 <br>
		<button>Thêm mới</button>
	</form>