<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>我的收藏</title>

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
        function addToCart(t) {
            var path = '/cart/add?id=' + t.getAttribute('itemid');
            $.ajax({
                url: path,
                data: {

                },
                success: function(){

                },
                error: function(){

                }
            });
        }

        function delectOneItem(t) {
            var collectItemId = t.getAttribute('collectItemId');
            $.ajax({
                url: '/collection/delete',
                data: {id:collectItemId},
                dataType: 'text',
                success: function(data){
                    if (data ===  "success") {
                        var index = t.parentNode.parentNode.rowIndex;
                        var table = document.getElementById('CollectionTable');
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
        <!-- Wishlist Page Content Start -->
        <div class="row">
            <div class="col-lg-12">
                <!-- Wishlist Table Area -->
                <div class="cart-table table-responsive">
                    <table class="table table-bordered" id="CollectionTable">
                        <thead>
                        <tr>
                            <th class="pro-thumbnail">商品详情</th>
                            <th class="pro-title">商品名</th>
                            <th class="pro-price">价格</th>
                            <th class="pro-quantity">库存</th>
                            <th class="pro-subtotal">添加购物车</th>
                            <th class="pro-remove">移出收藏</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${collectItemList}" var="collectItem">
                                <tr>
                                    <td class="pro-thumbnail"><a href="/product/showDetail?id=${collectItem.itemId}"><img class="img-fluid" src="${collectItem.item.image}.png" alt="Product" /></a></td>
                                    <td class="pro-title"><a href="/product/showDetail?id=${collectItem.itemId}">${collectItem.item.title}</a></td>
                                    <td class="pro-price"><span>${collectItem.item.price}</span></td>
                                    <td class="pro-quantity"><span class="text-success">${collectItem.item.num}</span></td>
                                    <td class="pro-subtotal"><a itemid="${collectItem.itemId}" onclick="addToCart(this)" class="btn">加入</a></td>
                                    <td class="pro-remove"><a collectItemId="${collectItem.id}" onclick="delectOneItem(this)"><i class="fa fa-trash-o"></i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- Wishlist Page Content End -->
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

