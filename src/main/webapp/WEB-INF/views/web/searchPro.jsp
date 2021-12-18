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
	
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>Department</h4>
                            <ul>
                                <li><a href="#">Fresh Meat</a></li>
                                <li><a href="#">Vegetables</a></li>
                                <li><a href="#">Fruit & Nut Gifts</a></li>
                                <li><a href="#">Fresh Berries</a></li>
                                <li><a href="#">Ocean Foods</a></li>
                                <li><a href="#">Butter & Eggs</a></li>
                                <li><a href="#">Fastfood</a></li>
                                <li><a href="#">Fresh Onion</a></li>
                                <li><a href="#">Papayaya & Crisps</a></li>
                                <li><a href="#">Oatmeal</a></li>
                            </ul>
                        </div>
                        <!-- <form id="the-form" action="./User-Search" method="get"></form> -->
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div class="price-range-wrap">
                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="10000" data-max="5000000">
                                    <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                    <span tabindex="0" class="ui-slider-handle ui-corner-all ui-state-default"></span>
                                </div>
                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount" name="min">
                                        <input type="text" id="maxamount" name="max">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar__item sidebar__item__color--option">
                            <h4>Choose Rating</h4>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate" id="flexRadioDefault1" value="5">
                                <label class="form-check-label" for="flexRadioDefault1">
                                    <i data-star="5"></i>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate" id="flexRadioDefault2" value="4">
                                <label class="form-check-label" for="flexRadioDefault2">
                                    <i data-star="4"></i>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate" id="flexRadioDefault3" value="3">
                                <label class="form-check-label" for="flexRadioDefault3">
                                    <i data-star="3"></i>
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate" id="flexRadioDefault4" value="2">
                                <label class="form-check-label" for="flexRadioDefault4">
                                    <i data-star="2"></i>
                                </label>
                            </div>
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="rate" id="flexRadioDefault5" value="1">
                                <label class="form-check-label" for="flexRadioDefault5">
                                    <i data-star="1"></i>
                                </label>
                              </div>
                        </div>
                        <div class="sidebar__item">
                            <h4>Lọc dữ liệu</h4>
                            <button class="FilterPro" style=" width: 100%; ">Lọc</button>
                        </div>
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" = id="productList">
                        <c:forEach items="${proList}" var="us">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <input type="hidden" class="productID" value="${us.productID}" />
                                <div class="product__item__pic set-bg" data-setbg="data:image/jpeg;base64,${us.base64Image}">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">${us.name}</a></h6>
                                    <h5>${us.price}</h5>
                                    <div class"custom-width-star"><i data-star="${us.rate}"></i></div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->	
	
	<jsp:include page="WEB_footerJS.jsp" />

	<script type="text/javascript">
		$(document).ready(function(){
            
			$("input[name='rate']").change(function(){
				alert($(this).val());
			})
		});
	
        $('.FilterPro').click(function (e) {
            e.preventDefault();
            // var selectedVal = null;
            // var selected = $("#radioDiv input[type='radio']:checked");
            // // if (selected.length > 0) {
            // //     selectedVal = selected.val();
            // // }
            var rates = document.getElementsByName('rate');
            var rate_value= 0;
            for(var i = 0; i < rates.length; i++){
                if(rates[i].checked){
                    rate_value = rates[i].value;
                }
            }
            var mindata= $("#minamount").val();
            alert(rate_value);
            var maxdata= $("#maxamount").val();
            // var SendData = {
            //                    rate: $.trim(selectedVal),
            //                    min: $.trim(min),
            //                    max: $.trim(max)
            // };
          /*  $.ajax({
                url: "/TTPetShop/User-Search",
                method: "GET",
                data: {
                    min: mindata,
                    max: maxdata
                },
                // success: function (data) {
                // }

            });*/
            url =  "/TTPetShop/User-Search?min=" + mindata + "&max=" + maxdata + "&rate=" + rate_value;
            window.location = url;
        });
        // $('.FilterPro').click(function (e) {
        //     var selectedVal = null;
        //     var selected = $(".form-check-input input[type='radio']:checked");
        //     if (selected.length > 0) {
        //         selectedVal = selected.val();
        //     }
        //     alert(selectedVal);
        //     $('#the-form').submit();
        // });
	</script>

</body>
</html>