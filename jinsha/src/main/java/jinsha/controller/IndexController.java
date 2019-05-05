package jinsha.controller;

import jinsha.pojo.Item;
import jinsha.pojo.ItemCat;
import jinsha.pojo.ItemComment;
import jinsha.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ProductService productService;

    //访问首页
    @RequestMapping("/index")
    public String accesIndex(Model model) {
        //查询出所有的商品目录
        List<ItemCat> itemCats = productService.queryAllItemCats();
        model.addAttribute("itemCats", itemCats);
        List<ItemComment> itemComments;
        int itemId;

        //查询轮播图展示的商品
        List<Item> showItems = productService.queryShowItems();
        model.addAttribute("showItems", showItems);

        //查询最新商品
        List<Item> newItems = productService.queryNewItems();
        for (Item item : newItems) {
            itemId = item.getId();
            itemComments = productService.queryAllComments(itemId);
            item.setRecord(caculateAvgRecord(itemComments));
        }
        model.addAttribute("newItems", newItems);

        //查询热销商品
        List<Item> hotItems = productService.queryHotItems();
        for (Item item : hotItems) {
            itemId = item.getId();
            itemComments = productService.queryAllComments(itemId);
            item.setRecord(caculateAvgRecord(itemComments));
        }
        model.addAttribute("hotItems", hotItems);

        //查询好评商品
        List<Item> goodItems = new ArrayList<Item>();
        itemComments = productService.queryAlLCommentItems();
        Item item;
        for (ItemComment ic : itemComments) {
            itemId = ic.getItemId();
            item = productService.queryItemById(itemId);
            item.setRecord((int) ic.getAvgRecord());
            goodItems.add(item);
        }
        model.addAttribute("goodItems", goodItems);

        model.addAttribute("tmpUrl", "index");

        return "index";
    }

    public int caculateAvgRecord(List<ItemComment> comments) {
        int tmpRecord = 0;
        for (ItemComment comment : comments) {
            tmpRecord += comment.getRecord();
        }
        if (comments.size() > 0){
            //计算平均评价分
            tmpRecord = tmpRecord / comments.size();
        }
        return tmpRecord;
    }

}
