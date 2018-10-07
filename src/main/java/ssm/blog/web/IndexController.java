package ssm.blog.web;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ssm.blog.domain.Article;
import ssm.blog.domain.Message;
import ssm.blog.service.impl.ArticleServiceImpl;
import ssm.blog.service.impl.CommentServiceImpl;
import ssm.blog.service.impl.MessageServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@RequestMapping("/home")
@Controller
public class IndexController {
    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private CommentServiceImpl commentService;
    @Autowired
    private MessageServiceImpl messageService;
    @RequestMapping("/zhuye")
    public ModelAndView index(@RequestParam(required=true,defaultValue="1") Integer page, @RequestParam(required=false,defaultValue="3") Integer pageSize){
        ModelAndView modelAndView =new ModelAndView("home");
        //静态方法接受page（跳转的页）和,pageSize属(页面长度)性。
        PageHelper.startPage(page, pageSize);
        List<Article> articles=articleService.queryAll();
        //接受该类型的集合
        PageInfo<Article> pageInfo=new PageInfo<Article>(articles);
        modelAndView.addObject("articles",articles);
        modelAndView.addObject("pageInfo",pageInfo);
        return modelAndView;
    }

    @RequestMapping("/detail")
    public String detail(){

        return "detail";
    }
    @RequestMapping("/message")
    public ModelAndView message(@RequestParam(required=true,defaultValue="1") Integer page, @RequestParam(required=false,defaultValue="5") Integer pageSize){
        //1.调用静态方法设置当前页面和每页长度。
        PageHelper.startPage(page, pageSize);
        List<Message> messages = messageService.selectMessages();
        //2.接收分页类型的list
        PageInfo<Message> pageInfo=new PageInfo<Message>(messages);
        ModelAndView mv = new ModelAndView("message");
        mv.addObject("messages",messages);
        //3.添加到域中
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }
    @RequestMapping(value="/message/add",method = RequestMethod.POST)
    @ResponseBody
    public Map messageAdd(HttpServletRequest request){
        Message message=new Message();
        message.setContent(request.getParameter("content"));
        message.setDate(new Date());
        message.setName(request.getParameter("name"));
        Map map = new HashMap();
        if(messageService.insertMessage(message)>0){
            map.put("stateCode", "1");
        }else {
            map.put("stateCode", "0");
        }
        return map;
    }
    @RequestMapping("/about")
    public String about(){
        return "about";
    }
    @RequestMapping(value = "/search")
    public ModelAndView articleSearch(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer page,
                                      @RequestParam(required=false,defaultValue="10") Integer pageSize){
        //1.调用静态方法设置当前页面和每页长度。
        PageHelper.startPage(page, pageSize);
        String word=request.getParameter("word");
        List<Article> articles=articleService.selectByWord(word);
        //2.接收分页类型的list
        PageInfo<Article> pageInfo=new PageInfo<Article>(articles);
        ModelAndView modelAndView = new ModelAndView("search");
        modelAndView.addObject("articles",articles);
        //3.添加到域中
        modelAndView.addObject("pageInfo",pageInfo);
        return modelAndView;
    }
    @RequestMapping(value = "/search/message")
    public ModelAndView searchMessage(HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer page,
                                      @RequestParam(required=false,defaultValue="10") Integer pageSize) {
        //1.调用静态方法设置当前页面和每页长度。
        PageHelper.startPage(page, pageSize);
        List<Article> articles=articleService.queryAll();
        //2.接收分页类型的list
        PageInfo<Article> pageInfo=new PageInfo<Article>(articles);
        ModelAndView modelAndView = new ModelAndView("search");
        modelAndView.addObject("articles",articles);
        //3.添加到域中
        modelAndView.addObject("pageInfo",pageInfo);
        return modelAndView;

    }

    @RequestMapping(value="/likeNum",method = RequestMethod.POST)
    public void likeNum(HttpServletRequest request,String articleId ){
        articleService.updateLikeNum(Integer.valueOf(articleId));
    }
}
