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
                                <tr class="product_data">
                                    
                                        <td class="align-middle"><input type="checkbox" class="chkCheckBoxId" name="productID"
                                                value="${dtC.productID}"></td>
                                        <td class="shoping__cart__item align-middle">
                                            <div class="full-div-100px"><img src="data:image/jpeg;base64,${dtC.pro.base64Image}" alt="${dtC.pro.name}">
                                            <h5>${dtC.pro.name}</h5></div>
                                        </td>
                                        <td id="price_item${dtC.productID}" class="shoping__cart__price align-middle">
                                            ${dtC.pro.price}
                                        </td>
                                        <td class="shoping__cart__quantity align-middle">
                                            <input type="hidden" value="${dtC.pro.quantity}" id="Amount${dtC.productID}"/>
                                        
                                            <div class="quantity">
                                                <div class="pro-qty" max="${dtC.pro.quantity}">
                                                    <input type="text" value="${dtC.quantity}">
                                                </div>
                                            </div>
                                        </td>
                                        <td id="final_price${dtC.productID}" class="shoping__cart__total align-middle">
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
                            <li>Total <span id="here">${USERMODEL.cartID.total}</span></li>
                        </ul>
                        <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
    <jsp:include page="WEB_footerJS.jsp" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#checkBoxAll').click(function () {
                if ($(this).is(":checked"))
                    $('.chkCheckBoxId').prop('checked', true);
                else
                    $('.chkCheckBoxId').prop('checked', false);
            });
        });
        $('.chkCheckBoxId').click(function() {
            var checkedValue = $(this).closest('.product_data').find('.chkCheckBoxId').val();
            if(this.checked){
            //alert(checkedValue);
            $.ajax({
                url: "/TTPetShop/User-Cart",
                method: "POST",
                data: {
                    productID: checkedValue,
                    status: "1",
                    action: "changeStatus"
                },
                success: function (data) {
                	$("#here").load(window.location.href + " #here" );
                    $('#myModal').modal('show');
                    //$(".modal-body #bookId").html(data).show();
                    //alert('shown');
                }

            });
            }else{
                $.ajax({
                    url: "/TTPetShop/User-Cart",
                    method: "POST",
                    data: {
                        productID: checkedValue,
                        status: "0",
                        action: "changeStatus"
                    },
                    success: function (data) {
                    	$("#here").load(window.location.href + " #here" );
                        $('#myModal').modal('show');
                        //$(".modal-body #bookId").html(data).show();
                        //alert('shown');
                    }

                });
            }
        });

        /*-------------------
    		Quantity change
    	--------------------- */
        var proQty = $('.pro-qty');
        proQty.prepend('<span class="dec qtybtn">-</span>');
        proQty.append('<span class="inc qtybtn">+</span>');
        proQty.on('click', '.qtybtn', function () {
            var $button = $(this);
    		var checkedValue = $(this).closest('.product_data').find('.chkCheckBoxId').val();
            var oldValue = $button.parent().find('input').val();
            var max = document.getElementById("Amount" + checkedValue).value; 
            //alert(parseFloat(oldValue));
            if ($button.hasClass('inc')) {
                if(parseInt(oldValue)<max){
                    var newVal = parseFloat(oldValue) + 1;
                    $.ajax({
                        url: "/TTPetShop/User-Cart",
                        method: "POST",
                        data: {
                            productID: checkedValue,
                            quantity: "1",
                            action: "changeQuantity"
                        },
                        success: function (data) {
                            $("#here").load(window.location.href + " #here" );
                        }

                    });

                }else{
                	newVal=max;
                	return;
                }
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 1) {
                    var newVal = parseFloat(oldValue) - 1;
                    $.ajax({
                        url: "/TTPetShop/User-Cart",
                        method: "POST",
                        data: {
                            productID: checkedValue,
                            quantity: "-1",
                            action: "changeQuantity"
                        },
                        success: function (data) {
                        	$("#here").load(window.location.href + " #here" );
                        }

                    });
                } else {
                    newVal = 1;
                }
            }
            $button.parent().find('input').val(newVal);
        	var final_price = document.getElementById("final_price" + checkedValue);
        	var price_item = Number(document.getElementById("price_item" + checkedValue).innerHTML); 
        	final_price.innerText= price_item*newVal;
        });
    </script>
</body>
</html>