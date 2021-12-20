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
                                    <a href="#user-profile__shopping-cart" aria-controls="user-profile__shopping-cart" role="tab" data-toggle="tab" aria-expanded="false">User Profile</a>
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
                                    <div class="table-responsive"><form>
                                        <!-- 2 column grid layout with text inputs for the first and last names -->
                                        <div class="row mb-4">
                                          <div class="col">
                                            <div class="form-outline">
                                              <input type="text" id="form6Example1" class="form-control" value="${USERMODEL.username}" readonly/>
                                              <label class="form-label" for="form6Example1">Username</label>
                                            </div>
                                          </div>
                                          <div class="col">
                                            <div class="form-outline">
                                              <input type="text" id="form6Example2" class="form-control"  value="${USERMODEL.fullname}" readonly/>
                                              <label class="form-label" for="form6Example2">Full name</label>
                                            </div>
                                          </div>
                                        </div>

                                        
                                        <div class="row mb-4">
                                            <div class="col">
                                              <div class="form-outline">
                                                <input type="password" id="form6Example3" class="form-control" value="${USERMODEL.password}" readonly/>
                                                <label class="form-label" for="form6Example3">PassWord</label>
                                              </div>
                                            </div>
                                            <div class="col">
                                              <div class="form-outline">
                                                <input type="text" id="form6Example6" class="form-control" value="${USERMODEL.phone}" readonly/>
                                                <label class="form-label" for="form6Example6">Phone Number</label>
                                              </div>
                                            </div>
                                          </div>
                                        <!-- Text input -->
                                        <!-- <div class="form-outline mb-4">
                                          <input type="text" id="form6Example3" class="form-control" />
                                          <label class="form-label" for="form6Example3">Company name</label>
                                        </div> -->
                                      
                                        <!-- Text input -->
                                        <div class="form-outline mb-4">
                                          <input type="text" id="form6Example4" class="form-control" value="${USERMODEL.address}" readonly/>
                                          <label class="form-label" for="form6Example4">Address</label>
                                        </div>
                                      
                                        <!-- Email input -->
                                        <div class="form-outline mb-4">
                                          <input type="email" id="form6Example5" class="form-control" value="${USERMODEL.email}" readonly/>
                                          <label class="form-label" for="form6Example5">Email</label>
                                        </div>
                                      
                                        <!-- Number input -->
                                        <!-- <div class="form-outline mb-4">
                                          <input type="text" id="form6Example6" class="form-control" />
                                          <label class="form-label" for="form6Example6">Phone</label>
                                        </div> -->
                                      
                                        <!-- Submit button -->
                                        <button type="button"  data-toggle="modal"
                                        data-target="#updateUser"class="btn btn-primary btn-block mb-4">Edit Profile</button>
                                      </form>
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
                                        <c:forEach items="${list_wait}" var="us">
                                            <form>
                                                <input type="hidden" class="billID" value="${us.billID}">
                                            <table class="table table-bordered wait-confirm__table">
                                            <thead>
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${us.dtBill}" var="dtB">
                                                <tr class="js-shop__item">
                                                    <td>
                                                        <img class="img-responsive wait-confirm-item__img" src="data:image/jpeg;base64,${dtB.products.base64Image}" width="100px" alt="${dtB.products.name}">
                                                    </td>
                                                    <td>
                                                        <div class="wait-confirm-item__title">
                                                            ${dtB.products.name}
                                                        </div>
                                                        <div class="wait-confirm-item__desc">
                                                            ${dtB.products.description}
                                                        </div>
                                                    </td>
                                                    <td><span class="js-shop-item__price">${dtB.products.price*dtB.quantity}</span>Đ</td>
                                                    <td>
                                                        <p>1</p>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                                
                                            </tbody>
                                                
                                            <!-- / .table-responsive -->
                                            <ul class="shopping-cart__checkout" style="margin-bottom: 10px; ">
                                                <li><strong>Bill ID:</strong>${us.billID}</li>
                                                <li><strong>Time:</strong>${us.date}</li>
                                                <li><strong>Subtotal:</strong>${us.discountID}</li>
                                                <li><strong>Total Price:</strong>${us.total}<span class="js-shop__total-price"></span></li>
                                                <li>
                                                    <button id="order" type="button" class="btn btn-secondary">Cancel This Order</a>
                                                </li>
                                            </ul>
                                        </form>
                                        </table>
                                        </c:forEach>
                                    </div>
                                </div>
                                <!-- / .tab-pane wait confirm -->

                                <!-- / .tab-pane delivering-->
                                <div role="tabpanel" class="tab-pane fade" id="user-profile__delivering">
                                    <div class="table-responsive">
                                        <c:forEach items="${list_delivering}" var="us">
                                            <form  method="post"
                                            action="${pageContext.request.contextPath }/User-profile?action=received">
                                                <input type="hidden" name="IDBILL" class="billID" value="${us.billID}">
                                        <table class="table table-bordered delivering__table">
                                            <thead>
                                                <tr>
                                                    <th>Image</th>
                                                    <th>Item</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tbody>
                                                    <c:forEach items="${us.dtBill}" var="dtB">
                                                    <tr class="js-shop__item">
                                                        <td>
                                                            <img class="img-responsive wait-confirm-item__img" src="data:image/jpeg;base64,${dtB.products.base64Image}" width="100px" alt="${dtB.products.name}">
                                                        </td>
                                                        <td>
                                                            <div class="wait-confirm-item__title">
                                                                ${dtB.products.name}
                                                            </div>
                                                            <div class="wait-confirm-item__desc">
                                                                ${dtB.products.description}
                                                            </div>
                                                        </td>
                                                        <td><span class="js-shop-item__price">${dtB.products.price*dtB.quantity}</span>Đ</td>
                                                        <td>
                                                            <p>1</p>
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
                                                    
                                                </tbody>
                                                
                                            <!-- / .table-responsive -->
                                            <ul class="shopping-cart__checkout" style="margin-bottom: 10px; ">
                                                <li><strong>Bill ID:</strong>${us.billID}</li>
                                                <li><strong>Time:</strong>${us.date}</li>
                                                <li><strong>Subtotal:</strong>${us.discountID}</li>
                                                <li><strong>Total Price:</strong>${us.total}<span class="js-shop__total-price"></span></li>
                                            </ul>
                                            <button id="received" type="submit" class="btn btn-secondary">Received</a>
                                        </form>
                                        </table>
                                        </c:forEach>
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
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="post" action="${pageContext.request.contextPath }/User-profile?action=CancelOrder">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông Báo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- <form method="post" action="${pageContext.request.contextPath }/adminListProduct?type=delete"> -->
                <div class="modal-body">
                    <div class="text-center">
                        are u sure???
                    </div>
                    <input type="hidden" name="billID" id="idsp">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="the-submit" type="button" class="btn btn-primary">Save changes</button>
                </div>
                <!-- </form> -->
            </form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <form method="post" action="${pageContext.request.contextPath }/User-profile?action=editUser">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- <form method="post" action="${pageContext.request.contextPath }/adminListProduct?type=delete"> -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" class="form-control" placeholder="Enter username" id="Username"
                                name="Username" value="${USERMODEL.username}" readonly>
                        </div>

                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" placeholder="Enter Fullname" id="fullname"
                                name="fullname" value="${USERMODEL.fullname}">
                        </div>

                        <div class="form-group">
                            <label>Email address:</label>
                            <input type="email" class="form-control" placeholder="Enter email" id="Email" name="Email" value="${USERMODEL.email}">
                        </div>

                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" class="form-control" placeholder="Enter password" id="password"
                                name="password" value="${USERMODEL.password}">
                        </div>

                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" class="form-control" placeholder="Enter address" id="address"
                                name="address" value="${USERMODEL.address}">
                        </div>

                        <div class="form-group">
                            <label>Phone:</label>
                            <input type="text" class="form-control" placeholder="Enter Phone Number" id="phone"
                                name="phone" value="${USERMODEL.phone}">
                        </div>

                        <!-- <div class="form-group">
                            <label>Coin:</label>
                            <input type="text" class="form-control" placeholder="Enter coin" id="coins"
                                name="coins">
                        </div> -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="the-submit-editUser" type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                    <!-- </form> -->

                </form>
            </div>
        </div>
    </div>
        <jsp:include page="WEB_footerJS.jsp" />
        <script>
            // $(document).on("click", "#the-submit", function(event){
            //     alert( "GO" ); 
            // });
        $('#order').click(function (e) {
            var billID= $(this).closest('form').find('.billID').val();
            alert(billID);
            $('#exampleModal').modal('show');
            $('#exampleModal #idsp').val(billID);
        });
        $('#the-submit').click(function (e) {
            var billID= $('#idsp').val();
            alert(billID);
            $.ajax({
                url: "/TTPetShop/User-profile",
                method: "POST",
                data: {
                    action: 'CancelOrder',
                    billID: billID
                },
                //dataType: 'json',
                success: function (data) {
                }
            });
        });
        </script>
</body>
</html>



