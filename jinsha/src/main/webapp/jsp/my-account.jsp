<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>个人中心</title>

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
        var oldMenu = document.getElementById('myInfo');
        var oldShow = document.getElementById('myAccount');

        function showPage(t) {
            var parent = document.getElementById('menus');
            var children = parent.children;
            var urlId = t.getAttribute('href').substring(1);
            oldMenu.className = "";
            oldMenu = t;
            oldShow.className = "tab-pane fade";
            oldShow = document.getElementById(urlId);
            for (var i = 0; i < children.length; i++) {
                if (children[i] == t) {
                    children[i].className = "active";
                    document.getElementById(urlId).className = "tab-pane fade show active";
                }
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
            <div class="col-lg-12">
                <!-- My Account Page Start -->
                <div class="myaccount-page-wrapper">
                    <!-- My Account Tab Menu Start -->
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="myaccount-tab-menu nav" id="menus" role="tablist">
                                <a href="#myAccount" class="active" data-toggle="tab" onclick="showPage(this)" id="myInfo">我的资料</a>
                                <a href="#applay" data-toggle="tab" onclick="showPage(this)">申请代理</a>
                                <a href="#myGroup" data-toggle="tab" onclick="showPage(this)">团队详情</a>
                                <a href="#address-edit" data-toggle="tab" onclick="showPage(this)">地址管理</a>
                                <a href="#account-info" data-toggle="tab" onclick="showPage(this)">财务管理</a>
                                <a href="/user/doLoginOut">退出登录</a>
                            </div>
                        </div>
                        <!-- My Account Tab Menu End -->

                        <div class="col-lg-9 mt-15 mt-lg-0">
                            <!-- My Account Tab Content Start -->
                            <div class="tab-content" id="myaccountContent">
                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade show active" id="myAccount" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>我的资料</h3>
                                        <div class="welcome">
                                            <form action="/account/updateUser" method="post">
                                                <ul>
                                                    <li><img style=" border-radius:60px;width:60px;height:60px;" src="${user.picture}"/></li>
                                                    <hr>
                                                    <li><strong>姓名：<input type="text" value="${user.username}"></strong></li>
                                                    <hr>
                                                    <li><strong>代理商编号：${user.invitation}</strong></li>
                                                    <hr>
                                                    <li><strong>性别：<input type="text" value="${user.sexString}"></strong></li>
                                                    <hr>
                                                    <li><strong>年龄：<input type="text" value="${user.age}"></strong></li>
                                                    <hr>
                                                    <li><strong>我的积分（点击可提现）：<span onclick="tixian()">${user.integral}</span></strong></li>
                                                    <hr>
                                                    <li><input class="btn" type="submit" value="提交修改"></li>
                                                </ul>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->

                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade" id="applay" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>申请代理</h3>
                                            <form action="/account/applyProxy" method="post">
                                                    邀请码：<input type="text" name="invitation"><hr>
                                                    身份证号码：<input type="text" name="idCard"><hr>
                                                    真实姓名:<input type="text" name="realname"><hr>
                                                    手机号码：<input type="text" name="phone"><hr>
                                                    所在地区：<input type="text" name="address"><hr>
                                                    代理产品：<input type="text" name="proxytype"><hr>
                                                    申请理由：<input type="text" name="applyReason"><hr>
                                                    <input class="btn" type="submit" value="提交申请">
                                            </form>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->

                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade" id="myGroup" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>团队详情</h3>
                                            我的直接上级代理商：${user.parent.username}<hr>
                                            我的直接下属代理商：${user.children.size()}人<hr>
                                        <table class="table table-bordered">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>代理商编号</th>
                                                    <th>姓名</th>
                                                    <th>电话</th>
                                                    <th>地址</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${user.children}" var="child">
                                                <tr>
                                                    <td>${child.id}</td>
                                                    <td>${child.username}</td>
                                                    <td>${child.phone}</td>
                                                    <td>${child.address}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->

                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                    <div class="myaccount-content">
                                        <h3>地址管理</h3>
                                        <div class="account-details-form">
                                            <form action="account/updateAddress" method="post">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="single-input-item">
                                                            <label for="f_name" class="required">收货人姓名</label>
                                                            <input type="text" id="f_name" value="${user.consignee}"/>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="single-input-item">
                                                    <label for="street-address" class="required">收货地址</label>
                                                    <input type="text" id="street-address" value="${user.address}"/>
                                                </div>

                                                <div class="single-input-item">
                                                    <label for="street-address" class="required">收货人电话</label>
                                                    <input type="text" id="phone" value="${user.phone}"/>
                                                </div>
                                                <input class="btn" type="submit" value="确认修改">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->

                                <!-- Single Tab Content Start -->
                                <div class="tab-pane fade" id="account-info" role="tabpanel" >
                                    <div class="myaccount-content">
                                        <h3>财务管理</h3>
                                        <div>
                                            <nav class="product-teb-menu">
                                                <ul class="nav justify-content-center">
                                                    <li><a class="active" href="#earn" id="my-earning" data-toggle="tab">我的收益</a></li>
                                                    <li><a href="#apply" id="exit-apply" data-toggle="tab">提现申请</a></li>
                                                    <li><a href="#record" id="exit-record" data-toggle="tab">提现记录</a></li>
                                                </ul>
                                            </nav>

                                            <div class="tab-content" id="productContent">
                                                <div class="tab-pane fade show active" id="earn" role="tabpanel">
                                                    <div class="show-table">

                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="apply" role="tabpanel">
                                                    <div class="show-table">

                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="record" role="tabpanel">
                                                    <div class="show-table">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Tab Content End -->
                            </div>
                        </div>
                        <!-- My Account Tab Content End -->
                    </div>
                </div>
                <!-- My Account Page End -->
            </div>
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

