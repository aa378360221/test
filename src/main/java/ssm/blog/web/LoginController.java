package ssm.blog.web;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ssm.blog.domain.AdminLoginLog;
import ssm.blog.service.impl.AdminLoginLogServiceImpl;
import ssm.blog.service.impl.AdminServiceImpl;
import ssm.blog.service.impl.ArticleServiceImpl;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;


@Controller

public class LoginController {
    @Autowired
    AdminServiceImpl adminService;
    @Autowired
    AdminLoginLogServiceImpl adminLoginLogService;
    JSONObject jsonObject = null;
    @RequestMapping(value = {"/admin/index","/admin","/admin/login"})
    public String toIndex(HttpServletRequest request) {

        return "admin/login";


    }

    // 0:用户不存在  1:密码错误 2:登陆成功
    @RequestMapping(value = "/api/loginCheck", method = RequestMethod.POST)
    @ResponseBody
    public  Object loginCheck(HttpServletRequest request,HttpServletResponse response) throws Exception{
        int id=Integer.parseInt(request.getParameter("id"));
        String passwd = request.getParameter("password");
        jsonObject = new JSONObject();
        if(adminService.getById(id)==null){
            jsonObject.put("stateCode", "0");
        }
        else if(!adminService.getById(id).getPassword().equals(passwd)){
            jsonObject.put("stateCode", "1");
        }else {
            String ip=request.getRemoteAddr();
            AdminLoginLog adminLoginLog=new AdminLoginLog();
            adminLoginLog.setAdminId(id);
            adminLoginLog.setDate(new Date());
            adminLoginLog.setIp(ip);
            int log=adminLoginLogService.insert(adminLoginLog);
            Cookie cookie = new Cookie("userId",""+id);
            cookie.setMaxAge(3600*24);
            response.addCookie(cookie);
            //把名字放在session中
            request.getSession().setAttribute("admin",adminService.getById(id));
            jsonObject.put("stateCode", "2");
            //设置编码格式
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print(jsonObject.toJSONString());
        }

    return null;
    }

    @RequestMapping(value = {"/admin/logout"})
    public String logout(HttpServletRequest request,HttpServletResponse response) {
        request.getSession().removeAttribute("admin");
        return "redirect:/admin";

    }

}