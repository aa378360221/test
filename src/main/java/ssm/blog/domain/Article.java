package ssm.blog.domain;

import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class Article {
    private Integer id;

    private String title;

    private String keywords;

    private String desci;
    //图文
    private String pic;
    //点击数
    private Integer click;
    //时间
    private Date time;
    //目录id
    private Integer catalogId;
    //评论
    private String content;
    //点赞数
    private Integer likeNum;


    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getDesci() {
        return desci;
    }

    public void setDesci(String desci) {
        this.desci = desci;
    }

    public void setdesci(String desci) {
        this.desci = desci == null ? null : desci.trim();
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public Date getTime() {
        return time;
    }

    public String getLocalTime() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-M-dd HH:mm");//设置日期格式
        String date = df.format(time);
        return date;

    }


    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", keywords='" + keywords + '\'' +
                ", desci='" + desci + '\'' +
                ", pic='" + pic + '\'' +
                ", click=" + click +
                ", time=" + time +
                ", catalogId=" + catalogId +
                ", content='" + content + '\'' +
                '}';
    }
}