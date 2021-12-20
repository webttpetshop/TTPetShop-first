<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>TTPetShop | Admin-Users</title>
    <jsp:include page="SUB_head.jsp" />
</head>

<body class="">

    <jsp:include page="SUB_header.jsp" />

    <!-- [ Main Content ] start -->
    <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
            <div class="pcoded-content">
                <div class="pcoded-inner-content">
                    <div class="main-body">
                        <div class="page-wrapper">
                            <!-- [ breadcrumb ] start -->
                            <div class="page-header">
                                <div class="page-block">
                                    <div class="row align-items-center">
                                        <div class="col-md-12">
                                            <div class="page-header-title">
                                                <h5>Home</h5>
                                            </div>
                                            <ul class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.html"><i
                                                            class="feather icon-home"></i></a></li>
                                                <li class="breadcrumb-item"><a href="#!">Analytics Dashboard</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- [ breadcrumb ] end -->
                            <!-- [ Main Content ] start -->
                            <div class="row">
                                <input class="form-control" style=" width: 85%; " id="myInput" type="text"
                                    placeholder="Search..">
                                <div class="dt-buttons btn-overlap btn-group">
                                    <div class="p-2">
                                        <button type="button"  data-toggle="modal" data-target="#addUser"
                                            class="dt-button buttons-colvis btn btn-white btn-primary1 btn-bold"
                                            data-toggle="tooltip" title='Add User'>
                                            <span>
                                                <i class="fa fa-plus-circle bigger-110 purple"></i>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="p-2">
                                        <button id="btndelete" type="button"
                                            class="dt-button buttons-htm15 btn btn-white btn-primary1 btn-bold">
                                            <span>
                                                <i class="fa fa-trash-o bigger-110 pink" data-toggle="tooltip"
                                                    title="Xóa Sản Phẩm"></i>
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- <br> -->
                                    <form id="the-form" method="post"
                                        action="${pageContext.request.contextPath }/admin-ListProduct?type=delete">
                                        <br>
                                        <table class="table table-condensed">
                                            <thead>
                                                <tr>
                                                    <th scope="col"><input type="checkbox" id="checkBoxAll" /></th>
                                                    <th>Username</th>
                                                    <th>Email</th>
                                                    <th>password</th>
                                                    <th>fullname</th>
                                                    <th>address</th>
                                                    <th>phone</th>
                                                    <!-- <th>coins</th> -->
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody id="myTable">
                                                <c:forEach items="${userList}" var="us">
                                                    <tr>
                                                        <td><input type="checkbox" class="chkCheckBoxId"
                                                                class="custom-control-input" name="username"
                                                                value="${us.username}"></td>
                                                        <td>${us.username}</td>
                                                        <td>${us.email}</td>
                                                        <td>${us.password}</td>
                                                        <td>${us.fullname}</td>
                                                        <td>${us.address}</td>
                                                        <td>${us.phone}</td>
                                                        <!-- <td>${us.coins}</td> -->
                                                        <td>
                                                            <!-- <c:url var="editURL" value="/admin-new">
                                                                <c:param name="type" value="edit" />
                                                                <c:param name="id" value="${us.username}" />
                                                            </c:url> -->
                                                            <button type="button" class="editUser btn btn-primary"  title="Edit" data-toggle="modal"
                                                            data-target="#updateUser"><i
                                                                    class="fa fa-pencil-square-o"
                                                                    style=" margin-right: 0;" aria-hidden="true"></i>
                                                            </button>
                                                            <!-- <button type="button" class="btn btn-primary"
                                                                data-catid="${us.username}" >
                                                                Xóa
                                                            </button> -->
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <!-- <li class="page-item"><a class="page-link" href="#">1</a></li>
                                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                                          <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                                            <c:forEach begin="1" end="${total}" var="i">
                                                <li class="page-item"><a class="page-link"
                                                        href="admin-home?page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- [ Main Content ] end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <form method="post" action="${pageContext.request.contextPath }/admin-ListUser?action=editUser">
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
                                name="Username" readonly>
                        </div>

                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" placeholder="Enter Fullname" id="fullname"
                                name="fullname">
                        </div>

                        <div class="form-group">
                            <label>Email address:</label>
                            <input type="email" class="form-control" placeholder="Enter email" id="Email" name="Email">
                        </div>

                        <div class="form-group">
                            <label>Password:</label>
                            <input type="text" class="form-control" placeholder="Enter password" id="password"
                                name="password">
                        </div>

                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" class="form-control" placeholder="Enter address" id="address"
                                name="address">
                        </div>

                        <div class="form-group">
                            <label>Phone:</label>
                            <input type="text" class="form-control" placeholder="Enter Phone Number" id="phone"
                                name="phone">
                        </div>

                        <!-- <div class="form-group">
                            <label>Coin:</label>
                            <input type="text" class="form-control" placeholder="Enter coin" id="coins"
                                name="coins">
                        </div> -->

                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input id="role" class="form-check-input" type="checkbox" name="role" value="1"> Set Admin
                            </label>
                        </div>
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

    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <form method="post" action="${pageContext.request.contextPath }/admin-ListUser?action=addUser">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create A New User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- <form method="post" action="${pageContext.request.contextPath }/admin-ListUser?action=addUser"> -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" class="form-control" placeholder="Enter username" id="Username"
                                name="Username">
                        </div>

                        <div class="form-group">
                            <label>Full Name:</label>
                            <input type="text" class="form-control" placeholder="Enter Fullname" id="fullname"
                                name="fullname">
                        </div>

                        <div class="form-group">
                            <label>Email address:</label>
                            <input type="email" class="form-control" placeholder="Enter email" id="Email" name="Email">
                        </div>

                        <div class="form-group">
                            <label>Password:</label>
                            <input type="text" class="form-control" placeholder="Enter password" id="password"
                                name="password">
                        </div>

                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" class="form-control" placeholder="Enter address" id="address"
                                name="address">
                        </div>

                        <div class="form-group">
                            <label>Phone:</label>
                            <input type="text" class="form-control" placeholder="Enter Phone Number" id="phone"
                                name="phone">
                        </div>

                        <div class="form-group form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="role" value="1"> Set Admin
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="the-submit-addUser" type="submit" class="btn btn-primary">Save changes</button>
                    </div>
                    <!-- </form> -->

                </form>
            </div>
        </div>
    </div>

    <!-- Required Js -->
    <jsp:include page="SUB_footer.jsp" />



    <!-- chart -->
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

    <!-- //search -->
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });


        $(document).ready(function () {
            $('#checkBoxAll').click(function () {
                if ($(this).is(":checked"))
                    $('.chkCheckBoxId').prop('checked', true);
                else
                    $('.chkCheckBoxId').prop('checked', false);
            });
        });
        
        $('td .btn-primary').on("click", function () {
            $(this).closest('tr').find('.chkCheckBoxId').prop("checked", true);
        })
        $('.editUser').click(function (e) {
            e.preventDefault();
            var username =$(this).closest('tr').find('.chkCheckBoxId').val();
            alert(username);
            $.ajax({
                url: "/TTPetShop/admin-ListUser",
                method: "POST",
                data: {
                    action: 'findUser',
                    Username: username
                },
                dataType: 'json',
                success: function (data) {
                    alert(data);
                     $('#updateUser #Username').val(data.username);
                     $('#updateUser #fullname').val(data.fullname);
                     $('#updateUser #Email').val(data.email);
                     $('#updateUser #password').val(data.password);
                     $('#updateUser #address').val(data.address);
                     $('#updateUser #phone').val(data.phone);
                     if(data.role == '1')
                        $('#updateUser #role').prop("checked", true);
                        else
                        $('#updateUser #role').prop("checked", false);
                }

            });
        });
    </script>

</body>

</html>