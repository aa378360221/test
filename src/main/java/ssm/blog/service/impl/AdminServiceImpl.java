package ssm.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.blog.dao.AdminDao;
import ssm.blog.domain.Admin;
import ssm.blog.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    public AdminDao adminDao;
    public Admin getById(Integer id) {
        return adminDao.selectByPrimaryKey(id);
    }
}
