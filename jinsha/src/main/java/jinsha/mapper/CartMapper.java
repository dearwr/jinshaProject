package jinsha.mapper;

import jinsha.pojo.ShopCart;
import java.util.List;

public interface CartMapper {

    List<ShopCart> selectAllCartItems(int uid);

    ShopCart selectOneByUidItemId(int uid, int itemId);

    boolean updateOneItemCount(int id, int count);

    boolean insertOneItem(ShopCart shopCart);

    boolean deleteOneShopCart(int id);
}
