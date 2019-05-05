<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>购物车</title>

    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="../../assets/img/favicon.ico" type="image/x-icon" />

    <!--== Google Fonts ==-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,500,600,700" rel="stylesheet">

    <!--=== Bootstrap CSS ===-->
    <link href="../../assets/css/vendor/bootstrap.min.css" rel="stylesheet">
    <!--=== Font-Awesome CSS ===-->
    <link href="../../assets/css/vendor/font-awesome.css" rel="stylesheet">
    <!--=== Plugins CSS ===-->
    <link href="../../assets/css/plugins.css" rel="stylesheet">
    <!--=== Helper CSS ===-->
    <link href="../../assets/css/helper.min.css" rel="stylesheet">
    <!--=== Main Style CSS ===-->
    <link href="../../assets/css/style.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="../../assets/js/vendor/modernizr-2.8.3.min.js"></script>

    <script>

        var preTotal = 0;
        var privilege = 0;
        var oldRowPrice = 0;

        function caculateMoney(t){
            var table = document.getElementById('cartTable');
            var rowIndex = t.getAttribute("index");
            var rowPrice = table.rows[rowIndex].cells[5].children[0].innerHTML;
            if (t.checked){
                preTotal = parseInt(preTotal) + parseInt(rowPrice);
            } else {
                preTotal = parseInt(preTotal) - parseInt(rowPrice);
            }
            document.getElementById('preTotal').innerHTML = preTotal + '元';
            document.getElementById('privilege').innerHTML = privilege + '元';
            document.getElementById('needPay').innerHTML = parseInt(preTotal) - parseInt(privilege) + '元';
        }

        function changeCount(t) {
            var table = document.getElementById('cartTable');
            var oldCount = t.getAttribute('oldCount');
            var newCount = t.value;
            var rowIndex = t.getAttribute("index");
            var singlePrice = table.rows[rowIndex].cells[3].children[0].innerHTML;
            var newRowPrice = parseInt(newCount) * parseInt(singlePrice);
            table.rows[rowIndex].cells[5].children[0].innerHTML = newRowPrice;
            var rowCheckBox = table.rows[rowIndex].cells[0].children[0];
            if (rowCheckBox.checked) {
                preTotal = parseInt(preTotal) + parseInt(newRowPrice) - parseInt(oldRowPrice);
                document.getElementById('preTotal').innerHTML = preTotal + '元';
                document.getElementById('privilege').innerHTML = privilege + '元';
                document.getElementById('needPay').innerHTML = parseInt(preTotal) - parseInt(privilege) + '元';
            }
            oldRowPrice = newRowPrice;
            t.setAttribute('oldCount', newCount);
            var shopCart = t.getAttribute('itemid');
            <!-- 更新数据库数量 -->
            $.ajax({
                url: '/cart/update?id=' + shopCart +'&itemCount=' + (parseInt(newCount) - parseInt(oldCount)),
                data: {

                },
                success: function(){

                },
                error: function(){

                }
            });
        }

        function caculateAgain(t){
            var checkedAll = t.checked;
            var table = document.getElementById('cartTable');
            for (var i=1; i<table.rows.length; i++){
                var rowCheckBox = table.rows[i].cells[0].children[0];
                if (rowCheckBox.checked != checkedAll){
                    rowCheckBox.checked = checkedAll;
                    caculateMoney(rowCheckBox);
                }
            }
        }

        <!-- 下单传值 -->
        function checkOut() {
            var table = document.getElementById('cartTable');
            var path = '/order/checkout?';
            var count = 0;
            for (var i=1; i<table.rows.length; i++){
                <!-- 判断选中下单的商品 -->
                if (table.rows[i].cells[0].children[0].checked){
                    var itemName = table.rows[i].cells[2].children[0].innerHTML;
                    if (count === 0){
                        path = path + 'title=' + itemName;
                    }else {
                        path = path + '&title=' + itemName;
                    }
                    count = parseInt(count) + 1;
                    var itemId = table.rows[i].cells[2].children[0].getAttribute('itemid');
                    path = path + '&itemId=' + itemId;
                    var itemNum = table.rows[i].cells[4].children[0].children[0].value;
                    path = path + '&num=' + itemNum;
                    var itemPrice = table.rows[i].cells[3].children[0].innerHTML;
                    path = path + '&price=' + itemPrice;
                    var totalFee = table.rows[i].cells[5].children[0].innerHTML;
                    path = path + '&totalFee=' + totalFee;
                }
            }
            var needPay = document.getElementById('needPay').innerHTML;
            path = path + '&count=' + count + '&preTotal=' + preTotal + '&privilege=' + privilege + '&needPay=' + needPay;
            if (count > 0){
                window.location.href = path;
            }


        }

        function delectOneItem(t) {
            var shopCartId = t.getAttribute('shopCartId');
            $.ajax({
                url: '/cart/delete',
                data: {id:shopCartId},
                dataType: 'text',
                success: function(data){
                    if (data ===  "success") {
                        var index = t.parentNode.parentNode.rowIndex;
                        var table = document.getElementById('cartTable');
                        table.deleteRow(index);
                    }
                },
                error: function(){

                }
            });
        }


    </script>

</head>

<body>

<jsp:include page="header.jsp"/>

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper">
    <div class="container">
        <!-- Cart Page Content Start -->
        <div class="row">
            <div class="col-lg-12">
                <!-- Cart Table Area -->
                <div class="cart-table table-responsive">
                    <table class="table table-bordered" id="cartTable">
                        <thead>
                            <tr>
                                <td>全选&nbsp;&nbsp;<input type="checkbox" id="checkAll" onchange="caculateAgain(this)"></td>
                                <th class="pro-thumbnail">商品详情</th>
                                <th class="pro-title">商品名称</th>
                                <th class="pro-price">商品单价</th>
                                <th class="pro-quantity">数量</th>
                                <th class="pro-subtotal">合计</th>
                                <th class="pro-remove">删除</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${shopCarts}" var="shopCart" varStatus="statue">
                                <tr>
                                    <td><input type="checkbox" index="${statue.count}" onchange="caculateMoney(this)"></td>
                                    <td class="pro-thumbnail"><a href="/product/showDetail?id=${shopCart.itemId}"><img class="img-fluid" src="${shopCart.item.image}.png" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="/product/showDetail?id=${shopCart.itemId}" itemid="${shopCart.itemId}" >${shopCart.item.title}</a></td>
                                    <td class="pro-price"><span>${shopCart.item.price}</span></td>
                                    <td class="pro-quantity">
                                        <div class="pro-qty"><input type="text" value="${shopCart.itemCount}" oldCount="${shopCart.itemCount}" itemid="${shopCart.id}" index="${statue.count}" onchange="changeCount(this)"></div>
                                    </td>
                                    <td class="pro-subtotal"><span>${shopCart.item.price * shopCart.itemCount}</span></td>
                                    <td class="pro-remove"><a shopCartId="${shopCart.id}" onclick="delectOneItem(this)"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 ml-auto">
                <!-- Cart Calculation Area -->
                <div class="cart-calculator-wrapper">
                    <h3>下单合计</h3>
                    <div class="cart-calculate-items">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <td>总价</td>
                                    <td id="preTotal"></td>
                                </tr>
                                <tr>
                                    <td>优惠</td>
                                    <td id="privilege"></td>
                                </tr>
                                <tr>
                                    <td>需支付</td>
                                    <td class="total-amount" id="needPay"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <a class="btn" onclick="checkOut()">下单</a>
                </div>
            </div>
        </div>
        <!-- Cart Page Content End -->
    </div>
</div>
<!--== Page Content Wrapper End ==-->

<!--=======================Javascript============================-->
<!--=== Jquery Min Js ===-->
<script src="../../assets/js/vendor/jquery-3.3.1.min.js"></script>
<!--=== Jquery Migrate Min Js ===-->
<script src="../../assets/js/vendor/jquery-migrate-1.4.1.min.js"></script>
<!--=== Popper Min Js ===-->
<script src="../../assets/js/vendor/popper.min.js"></script>
<!--=== Bootstrap Min Js ===-->
<script src="../../assets/js/vendor/bootstrap.min.js"></script>
<!--=== Ajax Mail Js ===-->
<script src="../../assets/js/ajax-mail.js"></script>
<!--=== Plugins Min Js ===-->
<script src="../../assets/js/plugins.js"></script>

<!--=== Active Js ===-->
<script src="../../assets/js/active.js"></script>
</body>
</html>
