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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
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
	<main>
		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<c:forEach items="${ cate }" var="ct" begin="0" step="1" end="2">
					<div class="col-lg-4">
						<img alt="" src="/Web_QuanAo/images/${ct.img }"
							class="bd-placeholder-img rounded-circle" width="250"
							height="250" aria-label="Placeholder: 250x250"
							preserveAspectRatio="xMidYMid slice" style="width: 70%; height: 70% ">
						<h2>${ct.ten }</h2>
							<a class="btn btn-secondary" href="#">View details &raquo;</a>
						</p>
					</div>
					<!-- /.col-lg-4 -->
				</c:forEach>
			</div>
			<!-- /.row -->


			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">
			<c:forEach items="${listP }" var="p">
				<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						${p.ten } 
					</h2>
					<p class="lead">${p.donGia }đ</p>
				</div>
				<div class="col-md-5">
				<img alt="" src="/Web_QuanAo/images/${p.img }" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						role="img" aria-label="Placeholder: 500x500"
						preserveAspectRatio="xMidYMid slice">
				</div>
			</div>
			<hr class="featurette-divider">
			</c:forEach>
			

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->
	</main>
	<script src="/Web_QuanAo/js/sidebars.js"></script>
	<script type="" src="/Web_QuanAo/js/jquery.min.js"></script>
	<script type="" src="/Web_QuanAo/js/popper.min.js"></script>
	<script type="" src="/Web_QuanAo/js/bootstrap.min.js"></script>
</body>

</html>