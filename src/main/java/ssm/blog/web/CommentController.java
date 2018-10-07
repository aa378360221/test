package ssm.blog.web;


import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ssm.blog.domain.Comment;
import ssm.blog.service.impl.CommentServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CommentController {

    @Autowired
    public CommentServiceImpl commentService;

    @RequestMapping(value = "/api/comment/add", method = RequestMethod.POST)
    @ResponseBody
    public Map commentAdd(HttpServletRequest request, HttpServletResponse response) throws  Exception{
        Comment comment=new Comment();
        comment.setArticleId(Integer.parseInt(request.getParameter("articleId")));
        comment.setContent(request.getParameter("content"));
        comment.setDate(new Date());
        comment.setName(request.getParameter("name"));
        Map map = new HashMap();
        if(commentService.insertComment(comment)>0){
            map.put("stateCode", "1");
        }else {
            map.put("stateCode", "0");
        }
        return map;
    }
    @RequestMapping(value = "/api/comment/del", method = RequestMethod.POST)
    @ResponseBody
    public Map commentDel(HttpServletRequest request, HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        Map map = new HashMap();
        if (commentService.delById(id)){
            map.put("stateCode", "1");
        }else {
            map.put("stateCode", "0");
        }
        return map;
    }
}
