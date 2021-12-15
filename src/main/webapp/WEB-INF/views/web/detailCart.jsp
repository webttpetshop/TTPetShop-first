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
	<section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th scope="col"><input type="checkbox" id="checkBoxAll" /></th>
                                    <th class="shoping__product">Products</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${detailCartList}" var="dtC">
                                <tr>
                                    
                                        <td class="align-middle"><input type="checkbox" class="chkCheckBoxId" name="productID"
                                                value="${dtC.productID}"></td>
                                        <td class="shoping__cart__item align-middle">
                                            <div class="full-div-100px"><img src="data:image/jpeg;base64,${dtC.pro.base64Image}" alt="${dtC.pro.name}">
                                            <h5>${dtC.pro.name}</h5></div>
                                        </td>
                                        <td class="shoping__cart__price align-middle">
                                            ${dtC.pro.price}
                                        </td>
                                        <td class="shoping__cart__quantity align-middle">
                                            <div class="quantity">
                                                <div class="pro-qty">
                                                    <input type="text" value="${dtC.quantity}">
                                                </div>
                                            </div>
                                        </td>
                                        <td class="shoping__cart__total align-middle">
                                            ${dtC.pro.price*dtC.quantity}
                                        </td>
                                        <td class="shoping__cart__item__close align-middle">
                                            <span class="icon_close"></span>
                                        </td>
                                        
                                    
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="#">
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>$454.98</span></li>
                            <li>Total <span>$454.98</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    <jsp:include page="WEB_footerJS.jsp" />
</body>
</html>