<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
    <jsp:include page="/WEB-INF/views/admin/SUB_head.jsp" />
</head>
<body>
<!-- [ auth-signin ] start -->
<div class="auth-wrapper">
	<div class="auth-content container">
		<div class="card">
			<div class="row align-items-center">
				<div class="col-md-6">
					<div class="card-body">
						<form action="" class="login100-form validate-form" method="POST">
							
							<c:if test="${not empty alert }">
							<div class="alert alert-${alert}">
							  <strong>${message}</strong>
							</div>
							</c:if>
							<img src="assets1/images/logo-dark.png" alt="" class="img-fluid mb-4">
							<h4 class="mb-3 f-w-400">Login into your account</h4>
							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Username" name="username">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="feather icon-lock"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Password"  name="pass">
							</div>
							
							<div class="form-group text-left mt-2">
								<div class="checkbox checkbox-primary d-inline">
									<input type="checkbox" name="checkbox-fill-1" id="checkbox-fill-a1" checked="">
									<label for="checkbox-fill-a1" class="cr"> Save credentials</label>
								</div>
							</div>
							<input type="hidden" value="login" name="action"/>
							<button class="btn btn-primary mb-4">Login</button>
							<p class="mb-2 text-muted">Forgot password? <a href="auth-reset-password.html" class="f-w-400">Reset</a></p>
							<p class="mb-0 text-muted">Don’t have an account? <a href='<c:url value="/signup"/>' class="f-w-400">Signup</a></p>
						</form>
					</div>
				</div>
				<div class="col-md-6 d-none d-md-block">
					<img src="assets1/images/auth-bg.jpg" alt="" class="img-fluid">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- [ auth-signin ] end -->
	<jsp:include page="/WEB-INF/views/admin/SUB_footer.jsp" />
</body>
</html>