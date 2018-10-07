import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import ssm.blog.dao.*;
import ssm.blog.domain.Admin;
import ssm.blog.domain.AdminLoginLog;
import ssm.blog.service.impl.ArticleServiceImpl;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class TestSpring {
    @Autowired
    private Admin admin;
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private AdminLoginLog adminLoginLog;
    @Autowired
    private AdminLoginLogDao adminLoginLogDao;
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private CatalogDao catalogDao;
    @Autowired
    private CommentDao commentDao;
    @Autowired
    private ArticleServiceImpl articleService;
    @Test
    public void TestSpring(){

        System.out.println(commentDao.selectByPrimaryKey(101));
    }
}
