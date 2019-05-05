<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索栏</title>
</head>
<body>

<!-- Start Header Middle Area -->
<div class="header-middle-area">
    <div class="container">
        <div class="row">
            <!-- Logo Area Start -->
            <div class="col-4 col-md-2 col-xl-3 m-auto text-center text-lg-left">
                <a href="/index" class="logo-wrap d-block">
                    <img src="../assets/img/logo.png" alt="Logo" class="img-fluid" />
                </a>
            </div>
            <!-- Logo Area End -->

            <!-- Search Box Area Start -->
            <div class="col-8 col-md-7 col- m-auto ">
                <div class="search-box-wrap">
                    <form class="search-form d-flex" action="/search/byTitle" method="get">
                        <span style="color: red; position: fixed; top: 70px; left: 626px; width: 505px;">${fail}</span>
                        <input type="text" name="tmpUrl" value="${tmpUrl}" style="display: none">
                        <input type="search" name="title" placeholder="商品/商品目录" />
                        <button class="btn btn-search"><img src="../assets/img/icons/icon-search.png" alt="Search Icon" />
                        </button>
                    </form>
                </div>
            </div>
            <!-- Search Box Area End -->

        </div>
    </div>
</div>
<!-- End Header Middle Area -->

</body>
</html>
