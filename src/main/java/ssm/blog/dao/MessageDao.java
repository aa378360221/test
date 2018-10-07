package ssm.blog.dao;

import org.springframework.stereotype.Repository;
import ssm.blog.domain.Message;

import java.util.List;

@Repository
public interface MessageDao {

    public List<Message> selectMessages();
    public int insertMessage(Message message);
}
