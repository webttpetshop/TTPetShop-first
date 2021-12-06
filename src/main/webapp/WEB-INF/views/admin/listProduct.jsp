<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="SUB_head.jsp" />
    <title>List Products</title>

    <!-- <link rel="stylesheet" href="https://cdn.metroui.org.ua/v4/css/metro-all.min.css"> -->
</head>

<body>
    <jsp:include page="SUB_header.jsp" />
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
                            <!-- [ breadcrumb ] end
                            [ Main Content ] start
                            <div class="row">
                                
                            </div> -->

                            <div class="row">
                                <div class="col-md-12">
                                    <input class="form-control" id="myInput" type="text" placeholder="Search..">
                                    <br>
                                    <form method="post"action="${pageContext.request.contextPath }/adminListProduct?type=delete">
                                        <div class="dt-buttons btn-overlap btn-group">
                                            <div class="p-2">
                                                <a flag="info" href="admin-Inser-Pros?type=insert"
                                                    class="dt-button buttons-colvis btn btn-white btn-primary1 btn-bold"
                                                    data-toggle="tooltip" title='Thêm Sản Phẩm'>
                                                    <span>
                                                        <i class="fa fa-plus-circle bigger-110 purple"></i>
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="p-2">
                                                <button id="btndelete" type="submit" value="submit"
                                                    class="dt-button buttons-htm15 btn btn-white btn-primary1 btn-bold"
                                                    data-toggle="tooltip" title="Xóa Sản Phẩm">
                                                    <span>
                                                        <i class="fa fa-trash-o bigger-110 pink"></i>
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                        <br>
                                        <div class"custom-width-star"><i data-star="4.5"></i></div>
                                            <br>
                                        <table class="table table-image">
                                            <thead>
                                                <tr>
                                                    <th scope="col"><input type="checkbox" id= "checkBoxAll" /></th>
                                                    <th scope="col">Mã Sản Phẩm</th>
                                                    <th scope="col">Hình Ảnh</th>
                                                    <th scope="col">Tên SP</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Mã Loại SP</th>
                                                    <th scope="col">Mô Tả</th>
                                                    <th scope="col">Số Lượng</th>
                                                    <th scope="col">Views</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                            </thead>

                                            <tbody id="myTable">
                                                <c:forEach items="${proList}" var="us">
                                                    <tr>
                                                        <td><input type="checkbox" class="chkCheckBoxId" class="custom-control-input" name="productID"value="${us.productID}"></td>
                                                        <td>${us.productID}</td>
                                                        <td class="w-251">
                                                            <div><img src="data:image/jpeg;base64,${us.base64Image}"
                                                                    alt="${us.name}" title="${us.name}" /></div>
                                                        </td>
                                                        <td>${us.name}</td>
                                                        <td>${us.price}</td>
                                                        <td>${us.categoryID}</td>
                                                        <td>${us.description}</td>
                                                        <td>${us.quantity}</td>
                                                        <td>${us.viewed}</td>
                                                        <td>
                                                            <c:url var="editURL" value="/admin-Inser-Pros">
                                                                <c:param name="type" value="edit" />
                                                                <c:param name="id" value="${us.productID}" />
                                                            </c:url>
                                                            <a class="btn btn-primary1 btn-edit"
                                                                data-toggle="tooltip" title="Edit" href=${editURL}><i
                                                                    class="fa fa-pencil-square-o"
                                                                    style=" margin-right: 0;" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <!-- <li class="page-item"><a class="page-link" href="#">1</a></li>
                                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                                      <li class="page-item"><a class="page-link" href="#">3</a></li> -->
                                            <c:forEach begin="1" end="${total}" var="i">
                                                <li class="page-item"><a class="page-link"
                                                        href="adminListUserByPage?page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="SUB_footer.jsp" />
    <!-- <script src="https://cdn.metroui.org.ua/v4.3.2/js/metro.min.js"></script> -->
    <!-- <script src="assets1/star/star.js"></script> -->
    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <script type="text/javascript">
    $(document).ready (function () {
        $('#checkBoxAll').click (function () {
        if ($(this).is(":checked"))
                $('.chkCheckBoxId').prop('checked', true);
            else
                $('.chkCheckBoxId').prop('checked', false);
        });
    });
    </script>


</body>

</html>