<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">

    <title>我的订单</title>

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

    <style type="text/css">
        div.show-table{
            margin: 0 auto;
            width: 888px;
        }
        li.order-li{
            border: 2px solid gray;
            border-radius:15px;
            margin: 15px;
            box-shadow: darkgrey 5px 5px 5px 5px ;
        }
        div.top{
            height: 30px;
            font-family: -apple-system;
            margin-left: 10px;
            color: gray;
            border-bottom-style: dashed;
        }
        span.pay-money{
            margin-left: 715px;
        }
        div.body{
            height: 125px;
        }
        div.picture{
            margin: 10px 10px;
            align-content: center;
            width: 99px;
            float: left;
        }
        div.content{
            float: left;
            margin-top: 15px;
            margin-left: 50px;
            width: 300px;
        }
        div.item-title{
            float: left;
            margin-left: 225px;
            margin-top: 45px;
        }
        div.footer{
            border-top-style: dashed;
            height: 35px;
        }
        div.a-border{
            margin-top: 5px;
            margin-right: 50px;
            border-radius:10px;
            width: 50px;
            float: right;
            border: 1px solid red;
        }
        a.footer-a{
            margin: 2px 8px;
            text-decoration: none;
            color: red;
        }
        a.footer-a:link{
            color: red;
        }
        a.footer-a:hover{
            color: green;
        }
    </style>


</head>
<body>

<jsp:include page="header.jsp"/>
    <div>
        <nav class="product-teb-menu">
            <ul class="nav justify-content-center" role="tablist">
                <li><a class="active" href="#all-order" id="all" data-toggle="tab">全部</a></li>
                <li><a href="#wait-pay" id="pay" data-toggle="tab">待付款</a></li>
                <li><a href="#wait-deliver" id="deliver" data-toggle="tab">代发货</a></li>
                <li><a href="#wait-take" id="take" data-toggle="tab">待收货</a></li>
                <li><a href="#wait-comment" id="comment" data-toggle="tab">待评价</a></li>
            </ul>
        </nav>

        <div class="tab-content" id="productContent">
            <div class="tab-pane fade show active" id="all-order" role="tabpanel">
                <div class="show-table">
                   <ul class="order-ul ">
                       <c:forEach items="${totalOrders}" var="totalOrder">
                           <li class="order-li">
                               <div class="top">
                                   <span class="order-number">订单号：${totalOrder.orderId}</span>
                                   <span class="pay-money">￥${totalOrder.payment}</span>
                               </div>
                               <div class="body">
                                   <div class="picture"><a href="/product/showDetail?id=${totalOrder.orderItems.get(0).itemId}"><img src="${totalOrder.orderItems.get(0).item.image}.png" width="99px" height="99px"></a></div>
                                   <div class="content"><p>&nbsp;&nbsp;&nbsp;${totalOrder.orderItems.get(0).item.sellPoint}</p></div>
                                   <div class="item-title">${totalOrder.orderItems.get(0).title}&nbsp;*&nbsp;${totalOrder.orderItems.get(0).num}</div>
                               </div>
                               <div class="footer">
                                   <div class="a-border"><a href="#" class="footer-a">评价</a></div>
                                   <div class="a-border"><a href="#" class="footer-a">物流</a></div>
                               </div>
                           </li>
                       </c:forEach>
                   </ul>
                </div>
            </div>
            <div class="tab-pane fade" id="wait-pay" role="tabpanel">
                <div class="show-table">
                    <ul class="order-ul ">
                        <c:forEach items="${payOrders}" var="payOrder">
                            <li class="order-li">
                                <div class="top">
                                    <span class="order-number">订单号：${payOrder.orderId}</span>
                                    <span class="pay-money">￥${payOrder.payment}</span>
                                </div>
                                <div class="body">
                                    <div class="picture"><a href="/product/showDetail?id=${payOrder.orderItems.get(0).itemId}"><img src="${payOrder.orderItems.get(0).item.image}.png" width="99px" height="99px"></a></div>
                                    <div class="content"><p>&nbsp;&nbsp;${payOrder.orderItems.get(0).item.sellPoint}</p></div>
                                    <div class="item-title">${payOrder.orderItems.get(0).title}&nbsp;*&nbsp;${payOrder.orderItems.get(0).num}</div>
                                </div>
                                <div class="footer">
                                    <div class="a-border"><a href="#" class="footer-a">评价</a></div>
                                    <div class="a-border"><a href="#" class="footer-a">物流</a></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="tab-pane fade" id="wait-deliver" role="tabpanel">
                <div class="show-table">
                    <ul class="order-ul ">
                        <c:forEach items="${deliverOrders}" var="deliverOrder">
                            <li class="order-li">
                                <div class="top">
                                    <span class="order-number">订单号：${deliverOrder.orderId}</span>
                                    <span class="pay-money">￥${deliverOrder.payment}</span>
                                </div>
                                <div class="body">
                                    <div class="picture"><a href="/product/showDetail?id=${deliverOrder.orderItems.get(0).itemId}"><img src="${deliverOrder.orderItems.get(0).item.image}.png" width="99px" height="99px"></a></div>
                                    <div class="content"><p>&nbsp;&nbsp;${deliverOrder.orderItems.get(0).item.sellPoint}</p></div>
                                    <div class="item-title">${deliverOrder.orderItems.get(0).title}&nbsp;*&nbsp;${deliverOrder.orderItems.get(0).num}</div>
                                </div>
                                <div class="footer">
                                    <div class="a-border"><a href="#" class="footer-a">评价</a></div>
                                    <div class="a-border"><a href="#" class="footer-a">物流</a></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="tab-pane fade" id="wait-take" role="tabpanel">
                <div class="show-table">
                    <ul class="order-ul ">
                        <c:forEach items="${takeOrders}" var="takeOrder">
                            <li class="order-li">
                                <div class="top">
                                    <span class="order-number">订单号：${takeOrder.orderId}</span>
                                    <span class="pay-money">￥${takeOrder.payment}</span>
                                </div>
                                <div class="body">
                                    <div class="picture"><a href="/product/showDetail?id=${takeOrder.orderItems.get(0).itemId}"><img src="${takeOrder.orderItems.get(0).item.image}.png" width="99px" height="99px"></a></div>
                                    <div class="content"><p>&nbsp;&nbsp;${takeOrder.orderItems.get(0).item.sellPoint}</p></div>
                                    <div class="item-title">${takeOrder.orderItems.get(0).title}&nbsp;*&nbsp;${takeOrder.orderItems.get(0).num}</div>
                                </div>
                                <div class="footer">
                                    <div class="a-border"><a href="#" class="footer-a">评价</a></div>
                                    <div class="a-border"><a href="#" class="footer-a">物流</a></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="tab-pane fade" id="wait-comment" role="tabpanel">
                <div class="show-table">
                    <ul class="order-ul ">
                        <c:forEach items="${commentOrders}" var="commentOrder">
                            <li class="order-li">
                                <div class="top">
                                    <span class="order-number">订单号：${commentOrder.orderId}</span>
                                    <span class="pay-money">￥${commentOrder.payment}</span>
                                </div>
                                <div class="body">
                                    <div class="picture"><a href="/product/showDetail?id=${commentOrder.orderItems.get(0).itemId}"><img src="${commentOrder.orderItems.get(0).item.image}.png" width="99px" height="99px"></a></div>
                                    <div class="content"><p>&nbsp;&nbsp;${commentOrder.orderItems.get(0).item.sellPoint}</p></div>
                                    <div class="item-title">${commentOrder.orderItems.get(0).title}&nbsp;*&nbsp;${commentOrder.orderItems.get(0).num}</div>
                                </div>
                                <div class="footer">
                                    <div class="a-border"><a href="#" class="footer-a">评价</a></div>
                                    <div class="a-border"><a href="#" class="footer-a">物流</a></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

    </div>



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
