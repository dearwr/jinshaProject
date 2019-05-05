<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>创建订单</title>

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
            <!-- Checkout Billing Details -->
            <div class="col-lg-6">
                <div class="checkout-billing-details-wrap">
                    <h2>收货详情</h2>
                    <div class="billing-form-wrap">
                        <form action="#">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="single-input-item">
                                        <label for="f_name" class="required">收货人姓名</label>
                                        <input type="text" id="f_name" placeholder="必填"/>
                                    </div>
                                </div>

                            </div>

                            <div class="single-input-item">
                                <label for="street-address" class="required">收货地址</label>
                                <input type="text" id="street-address" placeholder="必填"/>
                            </div>

                            <div class="single-input-item">
                                <label for="street-address" class="required">收货人电话</label>
                                <input type="text" id="phone" placeholder="必填"/>
                            </div>

                            <div class="single-input-item">
                                <label for="ordernote">买家留言</label>
                                <textarea name="ordernote" id="ordernote" cols="30" rows="3" placeholder="选填，请先和商家协商一致"></textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Order Summary Details -->
            <div class="col-lg-6 mt-5 mt-lg-0">
                <div class="order-summary-details">
                    <h2>支付详情</h2>
                    <div class="order-summary-content">
                        <!-- Order Summary Table -->
                        <div class="order-summary-table table-responsive text-center">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>商品条目</th>
                                    <th>合计</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${orderItemList}" var="orderItem">
                                    <tr>
                                        <td><a href="/product/showDetail?id=${orderItem.itemId}">${orderItem.title}<strong> × ${orderItem.num}</strong></a></td>
                                        <td>${orderItem.totalFee}元</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td>总合计</td>
                                    <td><strong>${preTotal}元</strong></td>
                                </tr>

                                <tr>
                                    <td>优惠</td>
                                    <td class="d-flex justify-content-center">
                                        <ul class="shipping-type">
                                            <li>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="flatrate" name="shipping" class="custom-control-input" checked />
                                                    <label class="custom-control-label" for="flatrate">满减：${privilege}元</label>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="freeshipping" name="shipping" class="custom-control-input" />
                                                    <label class="custom-control-label" for="freeshipping">包邮</label>
                                                </div>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <td>需支付</td>
                                    <td><strong>${needPay}</strong></td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>

                        <!-- Order Payment Method -->
                        <div class="order-payment-method">
                            <div class="single-payment-method show">
                                <div class="payment-method-name">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="cashon" name="paymentmethod" value="cash" class="custom-control-input" checked />
                                        <label class="custom-control-label" for="cashon">支付宝</label>
                                    </div>
                                </div>
                                <div class="payment-method-details" data-method="cash">
                                    <p>选择支付宝支付</p>
                                </div>
                            </div>

                            <div class="single-payment-method">
                                <div class="payment-method-name">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="directbank" name="paymentmethod" value="bank" class="custom-control-input" />
                                        <label class="custom-control-label" for="directbank">微信</label>
                                    </div>
                                </div>
                                <div class="payment-method-details" data-method="bank">
                                    <p>选择微信支付</p>
                                </div>
                            </div>

                            <div class="single-payment-method">
                                <div class="payment-method-name">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="checkpayment" name="paymentmethod" value="check" class="custom-control-input" />
                                        <label class="custom-control-label" for="checkpayment">银行卡</label>
                                    </div>
                                </div>
                                <div class="payment-method-details" data-method="check">
                                    <p>选择银行卡支付</p>
                                </div>
                            </div>

                            <div class="summary-footer-area">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" checked="checked" class="custom-control-input" id="terms" required />
                                    <label class="custom-control-label" for="terms">我已经阅读过支付协议<a style="color:green;font-size: 20px;margin-left: 25px" href="/cart/show">返回购物车</a></label>
                                </div>

                                <a href="#" class="btn">现在支付</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--== Checkout Page Content End ==-->
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
