package jinsha.service.impl;

import jinsha.mapper.CartMapper;
import jinsha.pojo.ShopCart;
import jinsha.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    /**
     * 增加一个商品入购物车
     *
     * @param shopCart
     * @return
     */
    @Override
    public boolean addItemById(ShopCart shopCart) {
        int uid = shopCart.getUserId();
        int itemId = shopCart.getItemId();
        ShopCart tmp = cartMapper.selectOneByUidItemId(uid, itemId);
        if (tmp != null) {
            int count = shopCart.getItemCount();
            int id = tmp.getId();
            return cartMapper.updateOneItemCount(id, count);
        }
        return cartMapper.insertOneItem(shopCart);
    }

    /**
     * 显示购物车中的所有商品
     * @param uid
     * @return
     */
    @Override
    public List<ShopCart> showCartItems(int uid) {
        return cartMapper.selectAllCartItems(uid);
    }

    /**
     * 更新购物车商品数量
     * @param shopCart
     * @return
     */
    @Override
    public boolean updateItemCount(ShopCart shopCart) {
        return cartMapper.updateOneItemCount(shopCart.getId(), shopCart.getItemCount());
    }

    /**
     * 删除一条购物车记录
     * @param id
     * @return
     */
    @Override
    public boolean deleteOneShopCart(int id) {
        return cartMapper.deleteOneShopCart(id);
    }
}
