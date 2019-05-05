package jinsha.controller;

import jinsha.pojo.Item;
import jinsha.pojo.ItemComment;
import jinsha.pojo.User;
import jinsha.service.ProductService;
import jinsha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private IndexController indexController;

    //展示商品详情
    @RequestMapping("/showDetail")
    public String showProductDetail(int id, Model model) {
        Item item = productService.queryItemById(id);
        List<ItemComment> comments = productService.queryAllComments(id);
        int tmpRecord = 0;
        User user;
        int uid;
        for (ItemComment comment : comments) {
            tmpRecord += comment.getRecord();
            uid = comment.getUserId();
            user = userService.queryOneUser(uid);
            comment.setUser(user);
        }
        if (comments.size() > 0){
            //计算平均评价分
            tmpRecord = tmpRecord / comments.size();
        }
        model.addAttribute("item", item);
        model.addAttribute(comments);
        model.addAttribute("avalRecord", tmpRecord);
        return "product-detail";
    }

    //展示商品列表
    @RequestMapping("/showList")
    public String showProductList(int id , Model model) {
        List<Item> items = productService.queryListByItemCatId(id);
        int itemId;
        List<ItemComment> itemComments;
        for (Item item : items) {
            itemId = item.getId();
            itemComments = productService.queryAllComments(itemId);
            item.setRecord(indexController.caculateAvgRecord(itemComments));
        }
        model.addAttribute("items", items);
        model.addAttribute("tmpUrl", "showList");
        return "product-list";
    }

}
