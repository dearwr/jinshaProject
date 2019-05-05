package jinsha.controller;

import jinsha.pojo.Item;
import jinsha.pojo.ShopCart;
import jinsha.pojo.User;
import jinsha.service.CartService;
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
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductService productService;

    @RequestMapping("/show")
    public String showCart(Model model, HttpSession session) {
        User user = (User) session.getAttribute("tmpUser");
        int uid = user.getId();
        List<ShopCart> shopCarts = cartService.showCartItems(uid);
        int itemId;
        Item tmpItem;
        for (ShopCart shopCart : shopCarts) {
            itemId = shopCart.getItemId();
            tmpItem = productService.queryItemById(itemId);
            shopCart.setItem(tmpItem);
        }
        model.addAttribute("shopCarts", shopCarts);
        return "cart";
    }

    @RequestMapping("/add")
    public void addItem(int id,HttpSession session) {
        ShopCart shopCart = builShopCart(id, 1, session);
        cartService.addItemById(shopCart);
    }

    @RequestMapping("/addAndGo")
    public String addAndGo(int itemId,int itemCount, Model model, HttpSession session) {
        System.out.println(itemId);
        ShopCart shopCart = builShopCart(itemId, itemCount, session);
        cartService.addItemById(shopCart);
        return showCart(model,session);
    }

    @RequestMapping("/update")
    public void updateCount(ShopCart shopCart) {
       cartService.updateItemCount(shopCart);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteOneShopCart(int id) {
        boolean flag =cartService.deleteOneShopCart(id);
        if (flag) {
            return "success";
        }
        return "false";
    }

    private ShopCart builShopCart(int itemId, int itemCount, HttpSession session) {
        User user = (User) session.getAttribute("tmpUser");
        ShopCart shopCart = new ShopCart();
        shopCart.setItemId(itemId);
        shopCart.setItemCount(itemCount);
        shopCart.setUserId(user.getId());
        shopCart.setCreated(new Date());
        return shopCart;
    }

}
