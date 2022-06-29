<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web_QuanAo</title>
<link rel="Stylesheet" href="/Web_QuanAo/css/carousel.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<div class="container">
		<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Web_QuanAo</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
					<div class="dropdown">
						<a class="btn dropdown-toggle mx-4" href="#" style="color: white;"
							role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
							aria-expanded="false" > <svg
								xmlns="http://www.w3.org/2000/svg" width="30" height="30"
								fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  					<path
									d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
					</svg>${user==null? "Tài khoản":user.hoTen}
						</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<c:if test="${empty user }"><li><a class="dropdown-item" href="/Web_QuanAo/login">Đăng nhập</a></li></c:if>
							<c:if test="${!empty user }"><li><a class="dropdown-item" href="/Web_QuanAo/LogoutServerlet">Đăng xuất</a></li></c:if>
							<c:if test="${!empty user }"><li><a class="dropdown-item" href="#">Đổi mật khẩu</a></li></c:if>
							<li><a class="dropdown-item" href="#">Quên mật khẩu</a></li>
							<li><a class="dropdown-item" href="#">Đăng kí</a></li>
							
						</ul>
					</div>
				</div>
			</div>
		</nav>
	</header>
	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel"">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://cdn.tokyolife.com.vn/forlife/media/banner/pc_banner/topbanner2_pc.jpg"
					class="d-block w-100" alt="...">
				<div class="container">
					<div class="carousel-caption">
						<c:if test="${empty user }">
							<p>
								<a class="btn btn-lg btn-primary" href="/Web_QuanAo/login">Đăng
									nhập ngay!</a>
							</p>
						</c:if>
						<c:if test="${!empty user }">

						</c:if>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://forlife-web-ec-store.s3.ap-southeast-1.amazonaws.com/forlife/media/banner/pc_banner/T4_2022/tkldeal_pc.jpg"
					class="d-block w-100" alt="...">
				<div class="container">
					<div class="carousel-caption">
						<c:if test="${empty user }">
							<p>
								<a class="btn btn-lg btn-primary" href="/Web_QuanAo/login">Đăng
									nhập ngay!</a>
							</p>
						</c:if>
						<c:if test="${!empty user }">

						</c:if>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://cdn.tokyolife.com.vn/forlife/media/banner/pc_banner/T4_2022/top_home4_pc.jpg"
					class="d-block w-100" alt="...">

				<div class="container">
					<div class="carousel-caption">
						<c:if test="${empty user }">
							<p>
								<a class="btn btn-lg btn-primary" href="/Web_QuanAo/login">Đăng
									nhập ngay!</a>
							</p>
						</c:if>
						<c:if test="${!empty user }">

						</c:if>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<div class="">
		<jsp:include page="${view }"></jsp:include>
	</div>
	<footer class="pt-4">
    <div class="row">
      <div class="col-2">
        <h5>Section</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
        </ul>
      </div>

      <div class="col-2">
        <h5>Section</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
        </ul>
      </div>

      <div class="col-2">
        <h5>Section</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Home</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Features</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Pricing</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">About</a></li>
        </ul>
      </div>

      <div class="col-4 offset-1">
        <form>
          <h5>Subscribe to our newsletter</h5>
          <p>Monthly digest of whats new and exciting from us.</p>
          <div class="d-flex w-100 gap-2">
            <label for="newsletter1" class="visually-hidden">Email address</label>
            <input id="newsletter1" type="text" class="form-control" placeholder="Email address">
            <button class="btn btn-primary" type="button">Subscribe</button>
          </div>
        </form>
      </div>
    </div>

    <div class="d-flex justify-content-between py-4 my-4 border-top">
      <p>&copy; 2021 Company, Inc. All rights reserved.</p>
      <ul class="list-unstyled d-flex">
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
        <li class="ms-3"><a class="link-dark" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
      </ul>
    </div>
  </footer>
	</div>
</body>
</html>