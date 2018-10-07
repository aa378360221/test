package ssm.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.blog.dao.MessageDao;
import ssm.blog.domain.Message;
import ssm.blog.service.MessageService;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    MessageDao messageDao;
    public List<Message> selectMessages() {
        return messageDao.selectMessages();
    }

    public int insertMessage(Message message) {
        return messageDao.insertMessage(message);
    }

}
