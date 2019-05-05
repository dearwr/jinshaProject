package jinsha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/news")
public class NewsController {


    @RequestMapping("/show")
    public String showNewsPage() {
        return "news";
    }

}
