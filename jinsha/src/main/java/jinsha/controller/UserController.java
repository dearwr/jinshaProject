package jinsha.controller;

import jinsha.pojo.User;
import jinsha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private IndexController indexController;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    //登录
    @RequestMapping("/doLogin")
    public String doLogin(User user, Model model, HttpSession session) {
        User tmpUser = userService.doLogin(user.getUsername(), user.getPassword());
        if (tmpUser != null) {
            session.setAttribute("tmpUser", tmpUser);
            model.addAttribute("statue", "登录成功");
            return indexController.accesIndex(model);
        }
        model.addAttribute("statue", "登陆失败，用户名或密码错误...");
        return "login";
    }

    //注册
    @RequestMapping("/doRegister")
    public String doRegister(User user, Model model) {
        boolean flag = userService.doRegister(user);
        if (flag) {
            model.addAttribute("statue", "注册成功");
            return login();
        }
        model.addAttribute("statue", "注册失败，已存在该用户名...");
        return "register";
    }

    //退出登录
    @RequestMapping("/doLoginOut")
    public String doLoginOut(HttpSession session) {
        session.setAttribute("tmpUser", null);
        return "redirect:/user/login";
    }
}
