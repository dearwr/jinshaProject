package jinsha.service;

import jinsha.pojo.Item;
import jinsha.pojo.ItemCat;
import jinsha.pojo.ItemComment;

import java.util.List;

public interface ProductService {

    List<ItemCat> queryAllItemCats();

    List<Item> queryShowItems();

    List<Item> queryNewItems();

    List<Item> queryHotItems();

    List<Item> queryGoodItems();

    List<Item> queryListByItemCatId(int id);

    Item queryItemById(int id);

    List<ItemComment> queryAllComments(int id);

    List<Item> queryByItemTitle(String title);

    List<ItemCat> queryByItemCatName(String str);

    List<ItemComment> queryAlLCommentItems();
}
