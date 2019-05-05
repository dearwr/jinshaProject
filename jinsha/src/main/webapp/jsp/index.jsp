<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>首页</title>

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

    <header id="header-area">

        <jsp:include page="search.jsp"/>

    <!-- Start Main Menu Area -->
    <div class="navigation-area" id="fixheader">
        <div class="container">
            <div class="row">
                <!-- Categories List Start -->
                <div class="col-10 col-lg-3">
                    <div class="categories-list-wrap">
                        <button class="btn btn-category d-none d-lg-inline-block"><i class="fa fa-bars"></i> 商品目录
                        </button>
                        <ul class="category-list-menu">
                            <c:forEach items="${itemCats}" var="itemCat">
                                <li class="category-item-parent dropdown-show">
                                    <a href="/product/showList?id=${itemCat.id}" class="category-item">
                                        <span>${itemCat.itemName}</span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- Categories List End -->

                <!-- Main Menu Start -->
                <div class="col-2 col-lg-9 d-none d-lg-block">
                    <div class="main-menu-wrap">
                        <nav class="mainmenu">
                            <ul class="main-navbar clearfix">
                                <li><a href="/news/show">新闻公告</a></li>
                                <li><a href="/company/show">关于我们</a></li>
                                <li><a href="/company/contact">联系我们</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Main Menu End -->
            </div>
        </div>
    </div>
    <!-- End Main Menu Area -->
</header>
<!--== End Header Section ==-->
n
<!--== Start Slider Area ==-->
<div class="slider-area-wrap">
    <div class="home-slider-carousel owl-carousel">
        <c:forEach items="${showItems}" var="showItem">
            <div class="single-slide-item" style="background-image: url('${showItem.image}.png')">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="slider-text" >
                                <h2>${showItem.title}</h2>
                                <h3>${showItem.sellPoint}</h3>
                                <a href="/product/showDetail?id=${showItem.id}" class="btn">去看看</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--== End Slider Area ==-->

<!--== Start Products  Area ==-->
<div id="product-area-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product-content-wrap">
                    <!-- Product Tab Menu Start -->
                    <nav class="product-teb-menu">
                        <ul class="nav justify-content-center" role="tablist">
                            <li><a class="active" href="#new-products" id="new-product-tab" data-toggle="tab">新品</a></li>
                            <li><a href="#sale-products" id="sale-product-tab" data-toggle="tab">热销</a></li>
                            <li><a href="#feature-products" id="feature-product-tab" data-toggle="tab">好评</a></li>
                        </ul>
                    </nav>
                    <!-- Product Tab Menu End -->

                    <!-- Product Tab Content Start -->
                    <div class="tab-content" id="productContent">
                        <div class="tab-pane fade show active" id="new-products" role="tabpanel">
                            <div class="products-wrapper">
                                <!-- 第一行 -->
                                <div class="product-carousel owl-carousel">
                                    <c:forEach items="${newItems}" begin="0" end="3" var="newItem1">
                                        <div class="single-product-item">
                                            <figure class="product-thumb">
                                                <a href="/product/showDetail?id=${newItem1.id}"><img src="${newItem1.image}.png" alt="商品图片"></a>
                                                <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                        class="fa fa-eye"></i></a>
                                            </figure>
                                            <div class="product-details">
                                                <h2 class="product-title"><a href="/product/showDetail?id=${newItem1.id}">${newItem1.title}</a></h2>
                                                <div class="rating">
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 5}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 4}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 3}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 2}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 1}">
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem1.record eq 0}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <span class="product-price">${newItem1.price}元</span>
                                                <span class="product-stock-status text-success">销量：${newItem1.saleCount}</span>

                                                <div class="product-meta">
                                                    <a itemid="${newItem1.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                    <a itemid="${newItem1.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!--第二行-->
                                <div class="product-carousel owl-carousel">
                                    <c:forEach items="${newItems}" begin="4" end="7" var="newItem2">
                                        <div class="single-product-item">
                                            <figure class="product-thumb">
                                                <a href="/product/showDetail?id=${newItem2.id}"><img src="${newItem2.image}.png" alt="商品图片"></a>
                                                <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                        class="fa fa-eye"></i></a>
                                            </figure>
                                            <div class="product-details">
                                                <h2 class="product-title"><a href="/product/showDetail?id=${newItem2.id}">${newItem2.title}</a></h2>
                                                <div class="rating">
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 5}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 4}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 3}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 2}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 1}">
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:choose>
                                                        <c:when test="${newItem2.record eq 0}">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <span class="product-price">${newItem2.price}元</span>
                                                <span class="product-stock-status text-success">销量：${newItem2.saleCount}</span>

                                                <div class="product-meta">
                                                    <a itemid="${newItem2.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                    <a itemid="${newItem2.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="sale-products" role="tabpanel">
                            <div class="products-wrapper">
                                    <!-- 第一行 -->
                                    <div class="product-carousel owl-carousel">
                                        <c:forEach items="${hotItems}" begin="0" end="3" var="hotItem1">
                                            <div class="single-product-item">
                                                <figure class="product-thumb">
                                                    <a href="/product/showDetail?id=${hotItem1.id}"><img src="${hotItem1.image}.png" alt="商品图片"></a>
                                                    <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                            class="fa fa-eye"></i></a>
                                                </figure>
                                                <div class="product-details">
                                                    <h2 class="product-title"><a href="/product/showDetail?id=${hotItem1.id}">${hotItem1.title}</a></h2>
                                                    <div class="rating">
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 5}">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 4}">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 3}">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 2}">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 1}">
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                        <c:choose>
                                                            <c:when test="${hotItem1.record eq 0}">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                    <span class="product-price">${hotItem1.price}元</span>
                                                    <span class="product-stock-status text-success">销量：${hotItem1.saleCount}</span>

                                                    <div class="product-meta">
                                                        <a itemid="${hotItem1.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                        <a itemid="${hotItem1.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                        <!--第二行-->
                                        <div class="product-carousel owl-carousel">
                                            <c:forEach items="${hotItems}" begin="4" end="7" var="hotItem2">
                                                <div class="single-product-item">
                                                    <figure class="product-thumb">
                                                        <a href="/product/showDetail?id=${hotItem2.id}"><img src="${hotItem2.image}.png" alt="商品图片"></a>
                                                        <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                                class="fa fa-eye"></i></a>
                                                    </figure>
                                                    <div class="product-details">
                                                        <h2 class="product-title"><a href="/product/showDetail?id=${hotItem2.id}">${hotItem2.title}</a></h2>
                                                        <div class="rating">
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 5}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 4}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 3}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 2}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 1}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                            <c:choose>
                                                                <c:when test="${hotItem2.record eq 0}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                            </c:choose>
                                                        </div>
                                                        <span class="product-price">${hotItem2.price}元</span>
                                                        <span class="product-stock-status text-success">销量：${hotItem2.saleCount}</span>

                                                        <div class="product-meta">
                                                            <a itemid="${hotItem2.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                            <a itemid="${hotItem2.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                         </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="feature-products" role="tabpanel">
                            <div class="products-wrapper">
                                <div class="product-carousel owl-carousel">
                                    <c:forEach items="${goodItems}" begin="0" end="3" var="goodItem1">
                                        <div class="single-product-item">
                                            <figure class="product-thumb">
                                                <a href="/product/showDetail?id=${goodItem1.id}"><img src="${goodItem1.image}.png" alt="商品图片"></a>
                                                <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                        class="fa fa-eye"></i></a>
                                            </figure>
                                            <div class="product-details">
                                                <h2 class="product-title"><a href="/product/showDetail?id=${goodItem1.id}">${goodItem1.title}</a></h2>
                                                <c:choose>
                                                    <c:when test="${goodItem1.record eq 5}">
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${goodItem1.record eq 4}">
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${goodItem1.record eq 3}">
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${goodItem1.record eq 2}">
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${goodItem1.record eq 1}">
                                                        <div class="rating">
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                    </c:when>
                                                </c:choose>
                                                <span class="product-price">${goodItem1.price}</span>
                                                <span class="product-stock-status text-success">销量：${goodItem1.saleCount}</span>

                                                <div class="product-meta">
                                                    <a itemid="${goodItem1.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                    <a itemid="${goodItem1.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                    <!--第二行-->
                                    <div class="product-carousel owl-carousel">
                                        <c:forEach items="${goodItems}" begin="4" end="7" var="goodItem2">
                                            <div class="single-product-item">
                                                <figure class="product-thumb">
                                                    <a href="/product/showDetail?id=${goodItem2.id}"><img src="${goodItem2.image}.png" alt="商品图片"></a>
                                                    <a href="#" class="btn btn-round btn-cart" title="Quick View" data-toggle="modal" data-target="#quickView"><i
                                                            class="fa fa-eye"></i></a>
                                                </figure>
                                                <div class="product-details">
                                                    <h2 class="product-title"><a href="/product/showDetail?id=${goodItem2.id}">${goodItem2.title}</a></h2>
                                                    <c:choose>
                                                        <c:when test="${goodItem2.record eq 5}">
                                                            <div class="rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${goodItem2.record eq 4}">
                                                            <div class="rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${goodItem2.record eq 3}">
                                                            <div class="rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${goodItem2.record eq 2}">
                                                            <div class="rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${goodItem2.record eq 1}">
                                                            <div class="rating">
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                    <span class="product-price">${goodItem2.price}</span>
                                                    <span class="product-stock-status text-success">销量：${goodItem2.saleCount}</span>

                                                    <div class="product-meta">
                                                        <a itemid="${goodItem2.id}" class="btn btn-round btn-cart" title="加入购物车" onclick="addToCart(this)"><i class="fa fa-shopping-cart"></i></a>
                                                        <a itemid="${goodItem2.id}" onclick="addToCollection(this)" class="btn btn-round btn-cart" title="加入收藏"><i class="fa fa-heart"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <!-- Product Tab Content End -->
                </div>
            </div>
        </div>
    </div>
</div>
<!--== End Products  Area ==-->


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


