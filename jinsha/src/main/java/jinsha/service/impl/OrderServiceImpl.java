package jinsha.service.impl;

import jinsha.mapper.OrderMapper;
import jinsha.pojo.Order;
import jinsha.pojo.OrderItem;
import jinsha.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> queryAllOrderByUid(Integer uid) {
        return orderMapper.selectAllByUid(uid);
    }

    @Override
    public List<OrderItem> queryOrderItemByOrderId(int orderId) {
        return orderMapper.selectOrderItemByOrderId(orderId);
    }

}
