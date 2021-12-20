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
     <!--<input type="hidden" id="showModal" name="showModal" value="${showModal}"> show modal by attribute -->
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
                                <input class="form-control" style=" width: 85%; " id="myInput" type="text" placeholder="Search..">
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
                                        <div class"custom-width-star"><i data-star="4.5"></i></div>
                                        <br>
                                        <table class="table table-image">
                                            <thead>
                                                <tr>
                                                    <th scope="col"><input type="checkbox" id="checkBoxAll" /></th>
                                                    <th scope="col">Mã Sản Phẩm</th>
                                                    <th scope="col">Hình Ảnh</th>
                                                    <th scope="col">Tên SP</th>
                                                    <th scope="col">Giá</th>
                                                    <th scope="col">Mã Loại SP</th>
                                                    <th scope="col">Mô Tả</th>
                                                    <th scope="col">Số Lượng</th>
                                                    <th scope="col">Views</th>
                                                    <th scope="col">Rate</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                            </thead>

                                            <tbody id="myTable">
                                                <c:forEach items="${proList}" var="us">
                                                    <tr>
                                                        <td class="align-middle"><input type="checkbox" class="chkCheckBoxId"
                                                                class="custom-control-input" name="productID"
                                                                value="${us.productID}"></td>
                                                        <td class="align-middle">${us.productID}</td>
                                                        <td class="w-251 align-middle"">
                                                            <div class="full-div"><img src="data:image/jpeg;base64,${us.base64Image}"
                                                                    alt="${us.name}" title="${us.name}" /></div>
                                                        </td>
                                                        <td class="align-middle">${us.name}</td>
                                                        <td class="align-middle">${us.price} &#8363</td>
                                                        <td class="align-middle">${us.categoryID}</td>
                                                        <td class="align-middle">${us.description}</td>
                                                        <td class="align-middle">${us.quantity}</td>
                                                        <td class="align-middle">${us.viewed}</td>
                                                        <td class="align-middle"><div class"custom-width-star"><i data-star="${us.rate}"></i></div>(${us.rate})</td>                                                       
                                                        <td class="align-middle">
                                                            <c:url var="editURL" value="/admin-Inser-Pros">
                                                                <c:param name="type" value="edit" />
                                                                <c:param name="id" value="${us.productID}" />
                                                            </c:url>
                                                            <a class="btn btn-primary1 btn-edit" data-toggle="tooltip"
                                                                title="Edit" href=${editURL}><i
                                                                    class="fa fa-pencil-square-o"
                                                                    style=" margin-right: 0;" aria-hidden="true"></i>
                                                            </a>
                                                            <button type="button" class="btn btn-primary"
                                                                data-catid="${us.productID}" data-toggle="modal"
                                                                data-target="#exampleModal">
                                                                Xóa
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                            <c:forEach begin="1" end="${total}" var="i">
                                                <li class="page-item"><a class="page-link"
                                                        href="admin-ListProduct?page=${i}">${i}</a></li>
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
                    <p>Please enter all values in the fields.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
        $(document).ready(function () {
            $('#checkBoxAll').click(function () {
                if ($(this).is(":checked"))
                    $('.chkCheckBoxId').prop('checked', true);
                else
                    $('.chkCheckBoxId').prop('checked', false);
            });
        });
    </script>

    <script type="text/javascript">
        //check checkbox when button in same row clicked
        $('td .btn-primary').on("click", function () {
            $(this).closest('tr').find('.chkCheckBoxId').prop("checked", true);
        })

        //submit form outside modal
        $(function () {
            $('#the-submit').on('click', function (e) {
                $('#the-form').submit();
            });
        });

        // auto show modal when page load
        // $(window).on('load', function () {
        //     $('#exampleModal').modal('show');
        // });

        //check null value of parameter
        $('#btndelete').click(function () {
            // var test1 = $('#productID').val();
            var i = 0;
            var arr = [];
            $('.chkCheckBoxId:checked').each(function () {
                arr[i++] = $(this).val();
            });

            if (arr.length === 0) {
                $('#myModal').modal('show');
            } else {
                $('#the-form').submit();
            }
        });


        // Show modal by get parameter

        // function getParameterByName(name, url) {
        //     if (!url) url = window.location.href;
        //     name = name.replace(/[\[\]]/g, "\\$&");
        //     var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        //         results = regex.exec(url);
        //     if (!results) return null;
        //     if (!results[2]) return '';
        //     return decodeURIComponent(results[2].replace(/\+/g, " "));
        // }
        // $(window).on('load', function () {
        //     if(getParameterByName('foo') == null)
        //     {
        //         $('#exampleModal').modal('show');
        //     }
            
        // });
        

        // show modal by check value of input 
        // $(window).on('load', function () {
        //     var check = $( "#showModal" ).val();
        //     if(check != "")
        //     {
        //         $('#exampleModal').modal('show');
        //         //alert(check);
        //     }
        //     //alert(check);
        // });
    </script>


</body>

</html>