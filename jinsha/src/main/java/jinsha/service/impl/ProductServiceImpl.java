package jinsha.service.impl;

import jinsha.mapper.CommentMapper;
import jinsha.mapper.ProductMapper;
import jinsha.pojo.Item;
import jinsha.pojo.ItemCat;
import jinsha.pojo.ItemComment;
import jinsha.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 查询所有的商品目录
     * @return
     */
    @Override
    public List<ItemCat> queryAllItemCats() {
        //查询pid为0的商品目录
        return productMapper.selectAllByPid(0);
    }

    /**
     * 查询轮播图要展示的商品
     * @return
     */
    @Override
    public List<Item> queryShowItems() {
        List<Item> items = queryNewItems();
        List<Item> showItems = new ArrayList<Item>(3);
        for (int i = 0; i < 3; i++) {
            showItems.add(items.get(i));
        }
        return showItems;
    }

    /**
     * 查询最新的商品
     * @return
     */
    @Override
    public List<Item> queryNewItems() {
        return productMapper.selectNewItems();
    }

    /**
     * 查询热销的商品
     * @return
     */
    @Override
    public List<Item> queryHotItems() {
        return productMapper.selectHotItems();
    }

    /**
     * 查询好评的商品
     * @return
     */
    @Override
    public List<Item> queryGoodItems() {
        return null;
    }

    /**
     * 根据目录id查询该目录下的商品列表
     * @param id
     * @return
     */
    @Override
    public List<Item> queryListByItemCatId(int id) {
        return productMapper.selectListByItemCatId(id);
    }

    /**
     * 根据id查询对应的商品
     * @param id
     * @return
     */
    @Override
    public Item queryItemById(int id) {
        return productMapper.selectItemById(id);
    }

    /**
     * 根据id查询出对应的所有评价
     * @param id
     * @return
     */
    @Override
    public List<ItemComment> queryAllComments(int id) {
        return commentMapper.selectAllByItemId(id);
    }

    /**
     * 根据标题匹配类似的商品
     * @param title
     * @return
     */
    @Override
    public List<Item> queryByItemTitle(String title) {
        return productMapper.selectByLikeTitle(title);
    }

    /**
     * 根据名字匹配类似的商品目录
     * @param name
     * @return
     */
    @Override
    public List<ItemCat> queryByItemCatName(String name) {
        return productMapper.selectByLikeName(name);
    }

    /**
     * 查询所有评分的商品
     * @return
     */
    @Override
    public List<ItemComment> queryAlLCommentItems() {
        return productMapper.selectGoodItems();
    }


}
