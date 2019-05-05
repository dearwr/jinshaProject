package jinsha.mapper;

import jinsha.pojo.Order;
import jinsha.pojo.OrderItem;
import java.util.List;

public interface OrderMapper {

    List<Order> selectAllByUid(int uid);

    List<OrderItem> selectOrderItemByOrderId(int orderId);
}
