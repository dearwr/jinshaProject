package jinsha.controller;


import jinsha.pojo.Item;
import jinsha.pojo.ItemCat;
import jinsha.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private ProductService productService;

    // 根据名称搜索
    @RequestMapping("/byTitle")
    public String searchByItemTitle(String title, Model model, String tmpUrl) {
        List<ItemCat> itemCats = productService.queryByItemCatName(title);
        List<Item> items = new ArrayList<Item>();
        int itemCatId;
        if (itemCats.size() > 0) {
            for (ItemCat itemCat : itemCats) {
                itemCatId = itemCat.getId();
                items.addAll(productService.queryListByItemCatId(itemCatId));
            }
        } else {
            items = productService.queryByItemTitle(title);
        }
        model.addAttribute("items", items);
        if (items.size() > 0) {
            model.addAttribute("fail", "");
            return "product-list";
        }
        model.addAttribute("fail","换个名字试试吧" );
        if (tmpUrl.equals("index")) {
            return "forward:/index";
        }
        return "forward:/product/showList?id=0";
    }

}
