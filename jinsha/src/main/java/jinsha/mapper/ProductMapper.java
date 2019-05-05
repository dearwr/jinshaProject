package jinsha.mapper;

import jinsha.pojo.Item;
import jinsha.pojo.ItemCat;
import jinsha.pojo.ItemComment;

import java.util.List;

public interface ProductMapper {

    List<ItemCat> selectAllByPid(int pid);

    List<Item> selectNewItems();

    List<Item> selectHotItems();

    List<Item> selectListByItemCatId(int id);

    Item selectItemById(int id);

    List<Item> selectByLikeTitle(String title);

    List<ItemCat> selectByLikeName(String name);

    List<ItemComment> selectGoodItems();
}
