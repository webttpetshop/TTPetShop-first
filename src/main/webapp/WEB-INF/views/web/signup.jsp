<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

	<title>TTPetShop | Sign up</title>
	<jsp:include page="/WEB-INF/views/admin/SUB_head.jsp" />
	
</head>

<!-- [ auth-signup ] start -->
<div class="auth-wrapper">
	<div class="auth-content container">
		<div class="card">
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="card-body">
					<form action="${pageContext.request.contextPath}/insertUser" class="signup100-form validate-form" method="POST">
						<img src="assets1/images/logo-dark.png" alt="" class="img-fluid mb-4">
						<h4 class="mb-3 f-w-400">Sign up into your account</h4>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Username" name="username">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-mail"></i></span>
							</div>
							<input type="email" class="form-control" placeholder="Email address" name="email">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-lock"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="Password" name="password">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-file-text"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Fullname" name="fullname">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-phone"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Phone number" name="phone">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="feather icon-home"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="Home address" name="adress">
						</div>
						<div class="form-group text-left mt-2">
							<div class="checkbox checkbox-primary d-inline">
								<input type="checkbox" name="checkbox-fill-2" id="checkbox-fill-2">
								<label for="checkbox-fill-2" class="cr">Send me the <a href="#!"> Newsletter</a> weekly.</label>
							</div>
						</div>
						<button class="btn btn-primary mb-4" type="submit">Sign up</button>
						<p class="mb-2">Already have an account? <a href="log-in" class="f-w-400">Log in</a></p>
					</form>
					</div>
				</div>
				<div class="col-md-6 d-none d-md-block">
					<img src="https://lvpet.vn/thumbs/797x462x1/upload/photo/slide-2460.jpg" alt="" class="img-fluid">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signup ] end -->
	<jsp:include page="/WEB-INF/views/admin/SUB_footer.jsp" />

</body>

</html>
