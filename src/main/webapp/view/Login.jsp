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
<div class="row">
	<div class="col-3"></div>
	<div class="col-6" style="border: 1px outset #222021;">
	<h1 style="text-align: center;">ĐĂNG NHẬP</h1>
		<form method="Post" action="login" style="text-align: center;">

			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label" style="float: left;">Email
					address</label>
				<div class="">
					<input type="email" class="form-control"
						id="exampleFormControlInput1" placeholder="name@example.com"
						name="email">
				</div>
			</div>
			<div class="mb-3">
				<label for="inputPassword" class="col-sm-2 col-form-label" style="float: left;">Password</label>
				<div class="">
					<input type="password" class="form-control" id="inputPassword"
						name="password">
				</div>
			</div>
			<div class="mb-3">
				<p style="float: left;">Quên mật khẩu?</p> <a style="color: green;float: left;">Vào đây</a>
				<a style="color: green;float: right ;">Dăng kí</a><p style="float: right ;">Chưa có tài khoản?</p> 
			</div>
			<br>
			<br>
			<div class="col-auto">
				<button type="submit" class="btn btn-primary mb-3">Login</button>
			</div>
		</form>
	</div>
	<div class="col-3"></div>

</div>

