<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>商品列表</title>

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

        function addToCollection(t) {
            var path = '/collection/add?id=' + t.getAttribute('itemid');
            $.ajax({
                url: path,
                data: {},
                success: function(){

                },
                error: function(){

                }
            });
        }
    </script>

</head>

<body>

<jsp:include page="header.jsp"/>

<jsp:include page="search.jsp"/>

<!--== Page Content Wrapper Start ==-->
<div id="page-content-wrapper">
    <div class="container">
        <div class="row">
            <!-- Start Shop Page Content -->
            <div class="col-lg-10 m-auto">
                <div class="shop-page-content-wrap">
                    <div class="products-settings-option d-block d-md-flex">
                        <div class="product-cong-left d-flex align-items-center">
                            <ul class="product-view d-flex align-items-center">
                                <li class="list current"><i class="fa fa-list-ul"></i></li>
                                <li class="box-gird"><i class="fa fa-th"></i></li>
                            </ul>
                        </div>

                        <div class="product-sort_by d-flex align-items-center mt-3 mt-md-0">
                            <label for="sort">排序:</label>
                            <select name="sort" id="sort">
                                <option value="Position">默认</option>
                                <option value="Name Ascen">时间</option>
                                <option value="Name Decen">销量</option>
                                <option value="Price Ascen">热度</option>
                            </select>
                        </div>
                    </div>

                    <div class="shop-page-products-wrap">
                        <div class="products-wrapper products-list-view">
                            <div class="row">
                                <c:forEach items="${items}" var="item">
                                    <div class="col-lg-4 col-sm-6">
                                        <div class="single-product-item">
                                            <figure class="product-thumb">
                                                <a href="/product/showDetail?id=${item.id}"><img src="${item.image}.png" alt="商品图片"></a>
                                                <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                        class="fa fa-eye"></i></a>
                                            </figure>
                                            <div class="product-details">
                                                <h2 class="product-title"><a href="/product/showDetail?id=${item.id}">${item.title}</a></h2>
                                                <div class="rating">
                                                    <c:choose>
                                                        <c:when test="${item.record eq 5}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:when test="${item.record eq 4}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:when test="${item.record eq 3}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:when test="${item.record eq 2}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:when test="${item.record eq 1}">
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:when test="${item.record eq 0}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <span class="product-price">${item.price}元</span>
                                                <span class="product-stock-status text-success">销量：${item.saleCount}</span>
                                                <span style="margin-left: 35px" class="product-stock-status text-success">库存：${item.num}</span>

                                                <p class="pro-desc">${item.sellPoint}</p>

                                                <div class="product-meta">
                                                    <a itemid="${item.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                    <a itemid="${item.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="products-settings-option d-block d-md-flex">
                        <nav class="page-pagination">
                            <ul class="pagination">
                                <li><a href="#" aria-label="Previous">&laquo;</a></li>
                                <li><a class="current" href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#" aria-label="Next">&raquo;</a></li>
                            </ul>
                        </nav>

                        <div class="product-per-page d-flex align-items-center mt-3 mt-md-0">
                            <label for="show-per-page">每页展示</label>
                            <select name="sort" id="show-per-page">
                                <option value="5">6</option>
                                <option value="10">12</option>
                                <option value="15">18</option>
                                <option value="20">24</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Shop Page Content -->
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

