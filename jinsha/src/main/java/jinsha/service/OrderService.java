package jinsha.service;

import jinsha.pojo.Order;
import jinsha.pojo.OrderItem;

import java.util.List;

public interface OrderService {
    List<Order> queryAllOrderByUid(Integer id);

    List<OrderItem> queryOrderItemByOrderId(int orderId);
}
