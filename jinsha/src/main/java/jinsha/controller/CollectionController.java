package jinsha.controller;

import jinsha.pojo.CollectItem;
import jinsha.pojo.Item;
import jinsha.pojo.User;
import jinsha.service.CollectionService;
import jinsha.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/collection")
public class CollectionController {

    @Autowired
    private CollectionService collectionService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/show")
    public String showCollections(Model model, HttpSession session) {
        User user = (User) session.getAttribute("tmpUser");
        List<CollectItem> collectItems = collectionService.queryAll(user.getId());
        int itemId;
        Item item;
        for (CollectItem collectItem : collectItems) {
            itemId = collectItem.getItemId();
            item = productService.queryItemById(itemId);
            collectItem.setItem(item);
        }
        model.addAttribute(collectItems);
        return "collection";
    }

    @RequestMapping("/add")
    public void addToCollection(int id, HttpSession session) {
        User user = (User) session.getAttribute("tmpUser");
        CollectItem collectItem = new CollectItem();
        collectItem.setItemId(id);
        collectItem.setUid(user.getId());
        collectItem.setTime(new Date());
        collectionService.addToCollection(collectItem);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteOneCollectItem(int id) {
        boolean flag = collectionService.deleteOneCollectItem(id);
        if (flag) {
            return "success";
        }
        return "false";
    }

}
