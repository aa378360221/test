package ssm.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ssm.blog.dao.AdminLoginLogDao;
import ssm.blog.domain.AdminLoginLog;
import ssm.blog.service.AdminLoginLogService;

import java.util.List;

@Service
public class AdminLoginLogServiceImpl implements AdminLoginLogService {

    @Autowired
    public AdminLoginLogDao adminLoginLogDao;
    public List<AdminLoginLog> selectRencent(Integer adminId) {
        return adminLoginLogDao.selectRencent(adminId);
    }

    public int insert(AdminLoginLog adminLoginLog) {
        return adminLoginLogDao.insert(adminLoginLog);
    }

    public int selectCountByAdminId(int adminId) {
        return adminLoginLogDao.selectCountByAdminId(adminId);
    }
}
