package ssm.blog.service;


import ssm.blog.domain.Article;

import java.util.ArrayList;
import java.util.List;

public interface ArticleService {

    Article selectById(Integer id);

    Article selectLastArticle(Integer id);

    Article selectNextArticle(Integer id);

    List<Article> queryAll();

    int countAllNum();

    boolean updateArticle(Article article);

    int deleteById(Integer id);

    int selectCount();

    List<Article> selectByWord(String word);

    boolean insert(Article article);
    int updateLikeNum(int id);
}
