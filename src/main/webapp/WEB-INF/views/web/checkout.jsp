<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <jsp:include page="WEB_head.jsp" />
    <title>TTPetShop | Homepage</title>
</head>
<body>
	<jsp:include page="WEB_header.jsp" />
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="assetsWEB/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Billing Details</h4>
                <form action="#">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Username<span>*</span></p>
                                        <input type="text" value="${USERMODEL.username}" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Full Name<span>*</span></p>
                                        <input type="text" value="${USERMODEL.fullname}" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" value="${USERMODEL.address}" readonly>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" value="${USERMODEL.phone}" readonly>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" value="${USERMODEL.email}" readonly>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="checkout__order">
                            <table class="table table-condensed">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${detailCartList}" var="us">
                                                <tr>
                                                    <td class="shoping__cart__item align-middle">
                                                        <div class="full-div-100px"><img style=" width: 50px; margin-right: 10px; height: 50px; " src="data:image/jpeg;base64,${us.pro.base64Image}" alt="${us.pro.name}">
                                                        <h5>${us.pro.name}</h5></div>
                                                    <td class="align-middle">${us.quantity}</td>
                                                    <td class="align-middle">${us.pro.price*us.quantity}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <button id="order" type="button" class="site-btn">ORDER NOW</button>
                              </table>
                                <div class="checkout__order__subtotal">Subtotal <c:if test="${not empty USERMODEL.cartID.discountID }"><span>-${USERMODEL.cartID.discount.quanlity}%</span></c:if></div>
                                <div class="checkout__order__total">Total <span>${USERMODEL.cartID.total}</span></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- <form method="post" action="${pageContext.request.contextPath }/adminListProduct?type=delete"> -->
                <div class="modal-body">
                    <div class="text-center">
                        are u sua???
                    </div>
                    <input type="hidden" name="idsp" id="idsp" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="the-submit" type="button" class="btn btn-primary">Save changes</button>
                </div>
                <!-- </form> -->
            </div>
        </div>
    </div>
    <div class="modal" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thông Báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="bookId" class="custom-p"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="WEB_footerJS.jsp" />
    <script>
        $('#order').click(function (e) {
            $('#exampleModal').modal('show');
        });

        $('#the-submit').click(function (e) {
            $('#exampleModal').modal('hide');
            $.ajax({
                url: "/TTPetShop/User-CheckOut",
                method: "POST",
                success: function (data) {
                    $('#myModal').modal('show');
                    $(".modal-body #bookId").html(data).show();
                }

            });
        });
        $('#myModal').on('hidden.bs.modal', function (e) {
            window.location.href = '';
        });
    </script>
</body>
</html>