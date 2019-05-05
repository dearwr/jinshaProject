<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>联系我们</title>

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
</head>
<body>

<jsp:include page="header.jsp"/>


<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper">
    <div class="container">
        <div class="row">

            <!-- Start Contact Form -->
            <div class="col-lg-6">
                <div class="contact-form-wrap contact-method">
                    <h2>意见反馈</h2>
                    <form action="/index" method="post" id="contact-form">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="single-input-item">
                                    <input type="text" name="first_name" placeholder="姓名" required />
                                </div>
                            </div>
                        </div>

                        <div class="single-input-item">
                            <input type="email" name="contact_email" placeholder="邮箱" required  />
                        </div>

                        <div class="single-input-item">
                            <textarea name="contact_message" cols="30" rows="4"
                                      placeholder="写下你的问题或者建议" required></textarea>
                        </div>

                        <div class="single-input-item">
                            <button class="btn" type="submit" name="submit">提交建议</button>
                        </div>
                        <!-- Show Succes or Error Message -->
                        <div class="form-message"></div>
                    </form>
                </div>
            </div>
            <!-- End Contact Form -->
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
