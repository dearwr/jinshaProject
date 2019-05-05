package jinsha.service;

import jinsha.pojo.ShopCart;
import java.util.List;

public interface CartService {

    boolean addItemById(ShopCart shopCart);

    List<ShopCart> showCartItems(int uid);

    boolean updateItemCount(ShopCart shopCart);

    boolean deleteOneShopCart(int id);
}
