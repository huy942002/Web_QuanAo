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
<form  method="POST" action="/Web_QuanAo/Products/update?id=${pd.id}" enctype="multipart/form-data">
		<label>Tên sản phẩm</label> 
		<br> 
		<input class="form-control" type="text" name="ten" value="${pd.ten }">
		<br> 
		<label>Thể loại</label>
		 <br> 
		 <select name="category_id">
		 <c:forEach items="${ctg }" var="ct" >
		 	<option value="${ct.id }" 
		 	${ ct.id == pd.category.id? "selected":""}>
		 		${ct.ten }
		 	</option>
		 </c:forEach>
		 </select>
		 <br> 
		 <label>Số lượng</label> 
		 <br> 
		 <input class="form-control" type="number" name="soLuong" value="${pd.soLuong }"> 
		 <br> 
		 <label>Đơn giá</label>
		 <br>
		 <input class="form-control" type="number" name="donGia" value="${pd.donGia }">
		 <br>
		 <label>Màu sắc</label>
		 <br>
		 <input class="form-control" type="text" name="maSac" value="${pd.maSac }"> 
		 <br>
		 <label>Kích Thước</label>
	     <input class="form-control" type="text" name="kichThuoc" value="${pd.kichThuoc }">
		 <br>
		 <label>Hình ảnh</label>
		 <div class="input-group">
  		 <input type="file" class="form-control" name="img" value="${pd.img }">
		 </div>
		<button>Thêm mới</button>
</form>
</body>
</html>