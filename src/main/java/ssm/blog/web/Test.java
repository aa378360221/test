package ssm.blog.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import ssm.blog.domain.Article;
import ssm.blog.service.impl.ArticleServiceImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Test")
public class Test {
    @Autowired
    private ArticleServiceImpl articleService;
    @RequestMapping("/Test")
    public String test1(HttpServletRequest request) {
        return "admin/login";
    }
    @RequestMapping("/Test1")
    public String test2(HttpServletRequest request) {
        return "index";
    }
    @RequestMapping("/Test2")
    public String test3(HttpServletRequest request) {
        return "about";
    }

}
