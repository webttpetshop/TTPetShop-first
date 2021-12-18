<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>TTPetShop | Profile</title>
	<jsp:include page="WEB_head.jsp" />
</head>

<body>
	<jsp:include page="WEB_header.jsp" />
	<div class="container">
        <div class="row">
            <div class="col-sm-3">
                <div class="user-profile__avatar shadow-effect text-center">
                    <img class="img-responsive center-block" src="https://i.pinimg.com/236x/af/d0/05/afd005db73d12eda451a94e9a892ce1e.jpg" alt="..."> John Doe
                    <p class="text-muted">Project Manager</p>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        User Menu
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li><a href="#"><i class="fa fa-user"></i> My Profile</a></li>
                            <li><a href="editProfile.jsp"><i class="fa fa-edit"></i> Edit Profile</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i> Messages</a></li>
                            <li><a href="#"><i class="fa fa-sign-out"></i> Sign Out</a></li>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-sm-6">

                        <!-- User name -->
                        <h3 class="user-profile__title">John Doe</h3>

                        <!-- User description -->
                        <p class="user-profile__desc">
                            Talented designer and passionate narrator.
                        </p>
                        <!-- User URL -->
                        <div class="user-profile__url">
                            <a href="https://bootdey.com/">https://bootdey.com/</a>
                        </div>
                        <!-- User social links -->
                        <div class="social">
                            <ul class="list-inline">
                                <li>
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#" class="pinterest"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">

                        <!-- Profile info -->
                        <ul class="user-profile__info">
                            <li>
                                <i class="fa fa-calendar-o"></i> Member for 365 days
                            </li>
                            <li>
                                <i class="fa fa-clock-o"></i> Last seen 1 year ago
                            </li>
                            <li>
                                <i class="fa fa-eye"></i> 1.000.000 profile views
                            </li>
                        </ul>
                    </div>
                    <div class="col-sm-12">
                        <div class="user-profile__tabs">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <!--<li role="presentation" class="active">
                                    <a href="#user-profile__portfolio" aria-controls="user-profile__portfolio" role="tab" data-toggle="tab" aria-expanded="true">My Portfolio</a>
                                </li>-->
                                <li role="presentation" class="active">
                                    <a href="#user-profile__shopping-cart" aria-controls="user-profile__shopping-cart" role="tab" data-toggle="tab" aria-expanded="false">My Shopping Cart</a>
                                </li>
                                <li role="presentation" class="">
                                    <a href="#user-profile__wait-confirm" aria-controls="user-profile__wait-confirm" role="tab" data-toggle="tab" aria-expanded="false">Wait for confirmation</a>
                                </li>
                                <li role="presentation" class="">
                                    <a href="#user-profile__delivering" aria-controls="user-profile__delivering" role="tab" data-toggle="tab" aria-expanded="false">Delivering</a>
                                </li>
                                <li role="presentation" class="">
                                    <a href="#user-profile__received" aria-controls="user-profile__received" role="tab" data-toggle="tab" aria-expanded="false">Received</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- / .tab-pane shopping cart-->
                                <div role="tabpanel" class="tab-pane fade active in" id="user-profile__shopping-cart">
                                    <div class="table-responsive">
                                        <table class="table table-bordered shopping-cart__table">
                                            <thead>
                                                <tr>
                                                    <th>Preview</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach begin="1" end="10" var="i">
                                                <tr class="js-shop__item">
                                                    <td>
                                                        <img class="img-responsive shopping-cart-item__img" src="https://via.placeholder.com/50x50/" width="100px" alt="...">
                                                    </td>
                                                    <td>
                                                        <div class="shopping-cart-item__title">
                                                            Product Title
                                                        </div>
                                                        <div class="shopping-cart-item__desc">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
                                                        </div>
                                                    </td>
                                                    <td>$<span class="js-shop-item__price">59.99</span></td>
                                                    <td>
                                                        <input type="number" class="js-shop-item__quantity form-control" min="1" max="100" step="1" value="1">
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- / .table-responsive -->
                                    <ul class="shopping-cart__checkout">
                                        <li><strong>Total Price</strong>: $<span class="js-shop__total-price"></span></li>
                                        <li><strong>Shipping</strong>: Free</li>
                                        <li>
                                            <a href="#" class="btn btn-secondary">Proceed to checkout</a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- / .tab-pane shopping cart -->

                                <!-- / .tab-pane wait confirm-->
                                <div role="tabpanel" class="tab-pane fade" id="user-profile__wait-confirm">
                                    <div class="table-responsive">
                                        <table class="table table-bordered wait-confirm__table">
                                            <thead>
                                                <tr>
                                                    <th>Preview</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Cancel</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach begin="1" end="10" var="i">
                                                <tr class="js-shop__item">
                                                    <td>
                                                        <img class="img-responsive wait-confirm-item__img" src="https://via.placeholder.com/50x50/" width="100px" alt="...">
                                                    </td>
                                                    <td>
                                                        <div class="wait-confirm-item__title">
                                                            Product Title
                                                        </div>
                                                        <div class="wait-confirm-item__desc">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
                                                        </div>
                                                    </td>
                                                    <td>$<span class="js-shop-item__price">59.99</span></td>
                                                    <td>
                                                        <p>1</p>
                                                    </td>
                                                    <td>
                                                        <button class="btnDel">Delete</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- / .tab-pane wait confirm -->

                                <!-- / .tab-pane delivering-->
                                <div role="tabpanel" class="tab-pane fade" id="user-profile__delivering">
                                    <div class="table-responsive">
                                        <table class="table table-bordered delivering__table">
                                            <thead>
                                                <tr>
                                                    <th>Preview</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach begin="1" end="10" var="i">
                                                <tr class="js-shop__item">
                                                    <td>
                                                        <img class="img-responsive delivering-item__img" src="https://via.placeholder.com/50x50/" width="100px" alt="...">
                                                    </td>
                                                    <td>
                                                        <div class="delivering-item__title">
                                                            Product Title
                                                        </div>
                                                        <div class="delivering-item__desc">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
                                                        </div>
                                                    </td>
                                                    <td>$<span class="js-shop-item__price">59.99</span></td>
                                                    <td>
                                                        <p>1</p>
                                                    </td>
                                                    <td>
                                                        <p>Delivering</p>
                                                        <button class="btnReceive">Receive</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                                                              
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- / .tab-pane delivering-->

                                <!-- / .tab-pane received-->
                                <div role="tabpanel" class="tab-pane fade" id="user-profile__received">
                                    <div class="table-responsive">
                                        <table class="table table-bordered received__table">
                                            <thead>
                                                <tr>
                                                    <th>Preview</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Rate product</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach begin="1" end="10" var="i">
                                                <tr class="js-shop__item">
                                                    <td>
                                                        <img class="img-responsive received-item__img" src="https://via.placeholder.com/50x50/" width="100px" alt="...">
                                                    </td>
                                                    <td>
                                                        <div class="received-item__title">
                                                            Product Title
                                                        </div>
                                                        <div class="received-item__desc">
                                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam id ipsum varius, tincidunt odio nec, placerat enim.
                                                        </div>
                                                    </td>
                                                    <td>$<span class="js-shop-item__price">59.99</span></td>
                                                    <td>
                                                        <p>1</p>
                                                    </td>
                                                    <td>
                                                        <button class="btnRate">Rate</button>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- / .tab-pane received-->
                            </div>
                            <!-- / .tab-content -->
                        </div>
                    </div>
                </div>
                <!-- / .row -->
            </div>
        </div>
        <!-- / .row -->
    </div>
        <jsp:include page="WEB_footerJS.jsp" />
</body>
</html>