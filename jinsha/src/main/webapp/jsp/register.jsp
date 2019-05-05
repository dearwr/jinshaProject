<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>注册</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="../assets/img/favicon.ico" type="image/x-icon" />

    <!--== Google Fonts ==-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">

    <!--=== Bootstrap CSS ===-->
    <link href="../assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!--=== Font-Awesome CSS ===-->
    <link href="../assets/css/vendor/font-awesome.css" rel="stylesheet">
    <!--=== Plugins CSS ===-->
    <link href="../assets/css/plugins.css" rel="stylesheet">
    <!--=== Helper CSS ===-->
    <link href="../assets/css/helper.min.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="../assets/css/style.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>

    <script>
        window.onload = function (ev) {

        };


       <!-- 校验电话号码长度 -->
        function checkLength(t) {
            var textLength = t.value.length;
            if (textLength != 11) {
                document.getElementById("phoneTip").innerHTML = '电话号码长度不对';
            }else {
                document.getElementById("phoneTip").innerHTML = '';
            }
        }
    </script>

</head>

<body>


<jsp:include page="header.jsp"/>

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper">
    <div class="container">
        <div class="row">
            <!-- Register Content Start -->
            <div class="col-lg-6 mt-30 mt-lg-0">
                <div class="login-reg-form-wrap">
                    <form action="/user/doRegister" method="post">
                        <div><span style="color: red">${statue}</span></div>
                        <div class="single-input-item">
                            <input onblur="checkLength(this)" type="text" placeholder="电话号码" required name="phone"/>
                            <span style="color: red;" id="phoneTip"></span>
                        </div>

                        <div class="single-input-item">
                            <input type="text" placeholder="用户名" required name="username" />
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="single-input-item">
                                    <input type="password" placeholder="密码" required name="password"/>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="single-input-item">
                                    <input type="password" placeholder="确认密码" required />
                                </div>
                            </div>
                        </div>

                        <div class="single-input-item">
                            <div class="login-reg-form-meta">
                                <div class="remember-meta">
                                    <div class="custom-control custom-checkbox">
                                        <input checked="checked" type="checkbox" class="custom-control-input" id="subnewsletter">
                                        <label class="custom-control-label" for="subnewsletter">同意协议</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="single-input-item">
                            <button class="btn">注册</button>
                        </div>
                    </form>
                    <div style="margin-top: 15px;" >
                        <a>已有账号？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/user/login" class="forget-pwd">前往登陆</a>
                    </div>
                </div>
            </div>
            <!-- Register Content End -->
        </div>
    </div>
</div>
<!--== Page Content Wrapper End ==-->

<!--=======================Javascript============================-->
<!--=== Jquery Min Js ===-->
<script src="../assets/js/vendor/jquery-3.3.1.min.js"></script>
<!--=== Jquery Migrate Min Js ===-->
<script src="../assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<!--=== Popper Min Js ===-->
<script src="../assets/js/vendor/popper.min.js"></script>
<!--=== Bootstrap Min Js ===-->
<script src="../assets/js/vendor/bootstrap.min.js"></script>
<!--=== Ajax Mail Js ===-->
<script src="../assets/js/ajax-mail.js"></script>
<!--=== Plugins Min Js ===-->
<script src="../assets/js/plugins.js"></script>

<!--=== Active Js ===-->
<script src="../assets/js/active.js"></script>

</body>
</html>
