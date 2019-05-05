package jinsha.controller;

import jinsha.pojo.User;
import jinsha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private UserService userService;

    @RequestMapping("/show")
    public String showMyAccount(HttpSession session, Model model) {
        User user = (User) session.getAttribute("tmpUser");
        User parent = userService.queryOneUser(user.getPid());
        List<User> users = userService.queryUsersByPid(user.getId());
        user.setParent(parent);
        user.setChildren(users);
        model.addAttribute("user", user);

        return "my-account";
    }

}
