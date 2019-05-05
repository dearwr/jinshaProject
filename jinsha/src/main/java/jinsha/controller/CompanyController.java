package jinsha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CompanyController {


    @RequestMapping("/show")
    public String showAboutUs() {
        return "about";
    }

    @RequestMapping("/contact")
    public String contactUs() {
        return "contact";
    }

}
