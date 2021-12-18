<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
	<link rel="stylesheet" href="assetsWEB/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="assetsWEB/css/slicknav.min.css" type="text/css">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="assetsWEB/css/styleEdit.css" type="text/css">
</head>

<body>
    <div class="container bootstrap snippets bootdey">
        <h1 class="text-edit">Edit Profile</h1>
        <hr>
        <div class="row">
            <!-- left column -->
            <div class="col-md-3">
                <div class="text-center">
                    <img src="https://i.pinimg.com/236x/af/d0/05/afd005db73d12eda451a94e9a892ce1e.jpg" class="avatar img-circle img-thumbnail" alt="avatar">
                    <h6>Upload a different photo...</h6>

                    <input type="file" class="form-control">
                </div>
            </div>

            <!-- edit form column -->
            <div class="col-md-9 personal-info">
                <h3>Personal info</h3>

                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">First name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="dey-dey">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Last name:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="bootdey">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Company:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email:</label>
                        <div class="col-lg-8">
                            <input class="form-control" type="text" value="janesemail@gmail.com">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Time Zone:</label>
                        <div class="col-lg-8">
                            <div class="ui-select">
                                <select id="user_time_zone" class="form-control">
                  <option value="Hawaii">(GMT-10:00) Hawaii</option>
                  <option value="Alaska">(GMT-09:00) Alaska</option>
                  <option value="Pacific Time (US &amp; Canada)">(GMT-08:00) Pacific Time (US &amp; Canada)</option>
                  <option value="Arizona">(GMT-07:00) Arizona</option>
                  <option value="Mountain Time (US &amp; Canada)">(GMT-07:00) Mountain Time (US &amp; Canada)</option>
                  <option value="Central Time (US &amp; Canada)" selected="selected">(GMT-06:00) Central Time (US &amp; Canada)</option>
                  <option value="Eastern Time (US &amp; Canada)">(GMT-05:00) Eastern Time (US &amp; Canada)</option>
                  <option value="Indiana (East)">(GMT-05:00) Indiana (East)</option>
                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <hr>
    <div class="mt-5d text-center"><button class="btn btn-primary">Save Profile</button></div>

    <script type="text/javascript">
    </script>
</body>

</html>