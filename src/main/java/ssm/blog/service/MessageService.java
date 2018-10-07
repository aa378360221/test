package ssm.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.blog.domain.Message;

import java.util.List;

public interface MessageService {
    public List<Message> selectMessages();
    public int insertMessage(Message message);
}
