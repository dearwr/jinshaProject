<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <title>头部</title>

</head>

<body>

    <!-- Start PreHeader Area -->
    <div class="preheader-area">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-lg-6 mt-xs-10">
                    <div class="site-setting-menu">
                        <ul class="nav justify-content-center justify-content-md-end">
                            <li><a href="/index">首页</a></li>
                            <li><a href="/account/show">个人中心</a></li>
                            <li><a href="/cart/show">购物车</a></li>
                            <li><a href="/order/show">我的订单</a></li>
                            <li><a href="/collection/show">我的收藏</a></li>
                            <li><a href="/user/register">注册</a></li>
                            <li><a href="/user/login"><c:if test="${empty tmpUser}">登录</c:if></a></li>
                            <li>
                                <div>
                                    <c:choose>
                                        <c:when test="${not empty tmpUser}">
                                            <img style=" border-radius:35px;width:35px;height:35px;"
                                                 src="${tmpUser.picture}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img style=" border-radius:35px;width:35px;height:35px;"
                                                 src="../assets/img/universal.PNG"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </li>
                            <li><a><c:if test="${not empty tmpUser}">用户：<span style="color: green;">${tmpUser.username}</span></c:if>  </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- End header -->

</body>
</html>
