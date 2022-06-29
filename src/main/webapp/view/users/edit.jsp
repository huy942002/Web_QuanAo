<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<form method="Post" action="/Web_QuanAo/users/update?id=${user.id}" enctype="multipart/form-data">
		<label>Họ và tên</label> 
		<br> 
		<input class="form-control" type="text" name="hoTen" value="${user.hoTen }">
		<br> 
		<label>Địa chỉ</label>
		 <br> 
		 <input class="form-control" type="text"name="diaChi" value="${user.diaChi }"> 
		 <br> 
		 <label>Email</label> 
		 <br> 
		 <input class="form-control" type="email" name="email" value="${user.email }"> 
		 <br> 
		 <label>PassWord</label>
		 <br>
		 <input class="form-control" type="password" name="password" value="${user.password }">
		 <br>
		 <label>Số điện thoại</label>
		 <br>
		 <input class="form-control" type="text" name="sdt" value="${user.sdt }"> 
		 <br>
			<label>Giới tính</label>
		<input type="radio" name="gt" value="1"
			${ user.gioiTinh == 0 ? "checked" : "" }/>
		<label>Nam</label>
		<input type="radio" name="gt" value="0"
			${ user.gioiTinh == 1 ? "checked" : "" }/>
		<label>Nữ</label>
				<br>
				<label>Hình ảnh</label>
		 <div class="input-group">
  		 <input class="form-control" type="file" class="form-control" name="avatar">
  		 <br>
		<button>Cập Nhập</button>
	</form>