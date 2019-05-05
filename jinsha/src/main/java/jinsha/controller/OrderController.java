package jinsha.controller;

import jinsha.pojo.Item;
import jinsha.pojo.Order;
import jinsha.pojo.OrderItem;
import jinsha.pojo.User;
import jinsha.service.OrderService;
import jinsha.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    //展示所有订单
    @RequestMapping("/show")
    public String showOrderPage(Model model, HttpSession session) {
        User user = (User) session.getAttribute("tmpUser");
        List<Order> totalOrders = orderService.queryAllOrderByUid(user.getId());
        List<Order> payOrders = new ArrayList<Order>();
        List<Order> deliverOrders = new ArrayList<Order>();
        List<Order> takeOrders = new ArrayList<Order>();
        List<Order> commentOrders = new ArrayList<Order>();
        int orderId;
        int orderType;
        int isComment;
        int itemId;
        Item item;
        List<OrderItem> orderItemlist;
        for (Order order : totalOrders) {
            orderId = order.getOrderId();
            orderItemlist = orderService.queryOrderItemByOrderId(orderId);
            order.setOrderItems(orderItemlist);
            for (OrderItem orderItem : orderItemlist) {
                itemId = orderItem.getItemId();
                item = productService.queryItemById(itemId);
                orderItem.setItem(item);
            }
            orderType = order.getOrderType();
            isComment = order.getBuyerComment();
            if (orderType == 1){
                payOrders.add(order);
            }else if (orderType == 2){
                deliverOrders.add(order);
            }else if (orderType == 3){
                takeOrders.add(order);
            }else if (orderType == 5 && isComment == 0){
                commentOrders.add(order);
            }
        }

        model.addAttribute("totalOrders",totalOrders);
        model.addAttribute("payOrders",payOrders);
        model.addAttribute("deliverOrders",deliverOrders);
        model.addAttribute("takeOrders",takeOrders);
        model.addAttribute("commentOrders",commentOrders);
        return "order";
    }


    @RequestMapping("/checkout")
    public String checkOut(Model model, HttpServletRequest req) {
        String[] itemIds = req.getParameterValues("itemId");
        String[] titles = req.getParameterValues("title");
        String[] nums = req.getParameterValues("num");
        String[] prices = req.getParameterValues("price");
        String[] totalFees = req.getParameterValues("totalFee");
        String preTotal = req.getParameter("preTotal");
        String privilege = req.getParameter("privilege");
        String needPay = req.getParameter("needPay");
        int count = Integer.parseInt(req.getParameter("count"));
        List<OrderItem> orderItems = new ArrayList<OrderItem>();
        OrderItem orderItem;
        for (int i = 0; i < count; i++) {
            orderItem = new OrderItem();
            orderItem.setItemId(Integer.parseInt(itemIds[i]));
            orderItem.setNum(Integer.parseInt(nums[i]));
            orderItem.setTitle(titles[i]);
            orderItem.setPrice(Integer.parseInt(prices[i]));
            orderItem.setTotalFee(Integer.parseInt(totalFees[i]));
            orderItems.add(orderItem);
        }
        model.addAttribute(orderItems);
        model.addAttribute("preTotal",preTotal);
        model.addAttribute("privilege",privilege);
        model.addAttribute("needPay",needPay);
        return "checkout";
    }

}
