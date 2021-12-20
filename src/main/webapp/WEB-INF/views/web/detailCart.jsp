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
    <input type="hidden" id="showModal" name="showModal" value="${showModal}">
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
                            <form action="#" >
                                <input type="text" placeholder="Enter your coupon code" name="discountID" id="discountID" value="${USERMODEL.cartID.discountID }">
                            	<span id="here1">
                                <c:if test="${not empty USERMODEL.cartID.discountID }">
                                    <i id="removeDiscount" class="fa fa-trash-o bigger-110 pink" data-toggle="tooltip"
                                                        title="Xóa Sản Phẩm" style=" margin-right: 15px; "></i>
                                </c:if>
                            	</span> 
                                <button type="button" class="addDiscount site-btn">APPLY COUPON</button>
                            </form>
                            <span id="desDiscount" class="text-danger"></span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6" >
                <div id="totalHere">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal 
                            <c:if test="${not empty USERMODEL.cartID.discountID }">
                                <span>-${USERMODEL.cartID.discount.quanlity}%</span>
                            </c:if>
                            </li>
                            <li>Total <span id="here">${USERMODEL.cartID.total}</span></li>
                        </ul>
                        <!-- <a href="#" class="primary-btn">PROCEED TO CHECKOUT</a> -->
                        <form action="./User-Cart" method="post">
                            <input type="hidden" name="action" value="checkout">
                            <button type="submit" class="primary-btn" style=" border: none; width: 100%; ">Check Out</button>
                        </form>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- <form method="post" action="${pageContext.request.contextPath }/adminListProduct?type=delete"> -->
                <div class="modal-body">
                    <div class="text-center">${showModal}
                    </div>
                    <!-- <input type="hidden" name="idsp" id="idsp" value=""> -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <!-- <button id="the-submit" type="button" class="btn btn-primary">Save changes</button> -->
                </div>
                <!-- </form> -->
            </div>
        </div>
    </div>
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

        $('.addDiscount').click(function (e) {
            e.preventDefault();
            var disID = $('#discountID').val();
            alert(disID);
            $.ajax({
                url: "/TTPetShop/User-Cart",
                method: "POST",
                data: {
                    action: "addDiscountID",
                    discountID: disID
                },
                success: function (data) {
                    alert(data);
                    $("#here1").load(window.location.href + " #here1" ); 
                    $("#totalHere").load(window.location.href + " #totalHere" );  
                    $('#desDiscount').fadeIn().html(data);  

                    //$('#myModal').modal('show');
                    //$(".modal-body #bookId").html(data).show();
                    //alert('shown');
                }

            });
        });

        $(document).on('click',"#removeDiscount",function(){
            var disID = $('#discountID').val();
            $.ajax({
                url: "/TTPetShop/User-Cart",
                method: "POST",
                data: {
                    action: "removeDiscountID",
                    discountID: disID
                },
                success: function (data) {
                    alert(data);
                    //$("#discountID").load(window.location.href + " #discountID" ); 
                    $("#discountID").val('');
                    $("#here1").load(window.location.href + " #here1" ); 
                    $("#totalHere").load(window.location.href + " #totalHere" );  
                    $('#desDiscount').fadeIn().html(data);  
                          setTimeout(function(){  
                               $('#desDiscount').fadeOut("Slow");  
                          }, 2000); 
                    //$('#myModal').modal('show');
                    //$(".modal-body #bookId").html(data).show();
                    //alert('shown');
                }

            });
        });

        // $('#removeDiscount').click(function (e){
        //     e.preventDefault();
        //     var disID = $('#discountID').val();
        //     $.ajax({
        //         url: "/TTPetShop/User-Cart",
        //         method: "POST",
        //         data: {
        //             action: "removeDiscountID",
        //             discountID: disID
        //         },
        //         success: function (data) {
        //             alert(data);
        //             $("#discountID").load(window.location.href + " #discountID" ); 
        //             $("#here1").load(window.location.href + " #here1" ); 
        //             $("#totalHere").load(window.location.href + " #totalHere" );  
        //             $('#desDiscount').fadeIn().html(data);  

        //             //$('#myModal').modal('show');
        //             //$(".modal-body #bookId").html(data).show();
        //             //alert('shown');
        //         }

        //     });
        // });

        

       // show modal by check value of input 
        $(window).on('load', function () {
            var check = $( "#showModal" ).val();
            if(check != "")
            {
                $('#exampleModal').modal('show');
                //alert(check);
            }
            //alert(check);
        });
    </script>
</body>
</html>