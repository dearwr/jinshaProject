<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>商品详情</title>

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
            var path = '/cart/addAndGo?itemId=' + t.getAttribute('itemid');
            var count = document.getElementById('qty').value;
            path = path + '&itemCount=' + count;
            window.location.href = path;
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
            <!-- Single Product Page Content Start -->
            <div class="col-lg-12">
                <div class="single-product-page-content">
                    <div class="row">
                        <!-- Product Thumbnail Start -->
                        <div class="col-lg-5">
                            <div class="product-thumbnail-wrap">
                                <div class="product-thumb-carousel owl-carousel">
                                    <div class="single-thumb-item">
                                        <a href="/product/showDetail?id=${item.id}"><img class="img-fluid" src="${item.image}.png" alt="Product" /></a>
                                    </div>

                                    <div class="single-thumb-item">
                                        <a href="/product/showDetail?id=${item.id}"><img class="img-fluid" src="${item.image}1.png" alt="Product" /></a>
                                    </div>

                                    <div class="single-thumb-item">
                                        <a href="/product/showDetail?id=${item.id}"><img class="img-fluid" src="${item.image}2.png" alt="Product" /></a>
                                    </div>

                                    <div class="single-thumb-item">
                                        <a href="/product/showDetail?id=${item.id}"><img class="img-fluid" src="${item.image}3.png" alt="Product" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Product Thumbnail End -->

                        <!-- Product Details Start -->
                        <div class="col-lg-7">
                            <div class="product-details">
                                <h2><a href="/product/showDetail?id=${item.id}">${item.title}</a></h2>

                                <div class="rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>

                                <span class="price">${item.price}元</span>

                                <div class="product-info-stock-sku">
                                    <span class="product-stock-status text-success">销量：${item.saleCount}</span>
                                </div>
                                <div class="product-info-stock-sku">
                                    <span class="product-stock-status text-success">库存：${item.num}</span>
                                </div>

                                <p class="products-desc">${item.sellPoint}</p>

                                <div class="product-quantity d-flex align-items-center">
                                    <div class="quantity-field">
                                        <label for="qty">购买数量</label>
                                        <input type="number" id="qty" min="1" max="100" value="1" />
                                    </div>

                                    <a itemid="${item.id}" class="btn btn-cart-large" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i>加入购物车</a>
                                </div>

                                <div class="product-btn-group">
                                    <a itemid="${item.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart"><i class="fa fa-heart"></i>收藏</a>
                                </div>
                            </div>
                        </div>
                        <!-- Product Details End -->
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Product Full Description Start -->
                            <div class="product-full-info-reviews">
                                <!-- Single Product tab Menu -->
                                <nav class="nav" id="nav-tab">
                                    <a class="active" id="description-tab" data-toggle="tab" href="#description">商品描述</a>
                                    <a id="reviews-tab" data-toggle="tab" href="#reviews">评价</a>
                                </nav>
                                <!-- Single Product tab Menu -->

                                <!-- Single Product tab Content -->
                                <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="description">
                                        <img src="${item.desc}">
                                    </div>

                                    <div class="tab-pane fade" id="reviews">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <div class="product-ratting-wrap">
                                                    <div class="pro-avg-ratting">
                                                        <span>
                                                            <c:choose>
                                                                <c:when test="${itemCommentList.size()>0}">
                                                                    共${itemCommentList.size()}个评价
                                                                </c:when>
                                                                <c:otherwise>
                                                                    该商品还没有被评价过
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </span>
                                                    </div>
                                                    <div class="ratting-list">
                                                        <c:choose>
                                                            <c:when test="${avalRecord eq 0}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(5)</span>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${avalRecord eq 1}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(1)</span>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${avalRecord eq 2}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(2)</span>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${avalRecord eq 3}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(3)</span>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${avalRecord eq 4}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(4)</span>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${avalRecord eq 5}">
                                                                <div class="sin-list float-left">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <span>(5)</span>
                                                                </div>
                                                            </c:when>
                                                        </c:choose>

                                                    </div>
                                                    <div class="rattings-wrapper">
                                                        <c:forEach items="${itemCommentList}" var="comment">
                                                            <div class="sin-rattings">
                                                                <div class="ratting-author">
                                                                    <h3>${comment.user.username}</h3>
                                                                    <h4 style="margin-left: 350px"><fmt:formatDate value='${comment.time}' pattern='yyyy-MM-dd HH:mm:ss'/></h4>
                                                                    <c:choose>
                                                                        <c:when test="${comment.record eq 0}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(5)</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${comment.record eq 1}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(1)</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${comment.record eq 2}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(2)</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${comment.record eq 3}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(3)</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${comment.record eq 4}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(4)</span>
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${comment.record eq 5}">
                                                                            <div class="sin-list float-left">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <span>(5)</span>
                                                                            </div>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <p>${comment.content}</p>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Single Product tab Content -->
                            </div>
                            <!-- Product Full Description End -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Product Page Content End -->
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

