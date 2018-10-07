package ssm.blog.dao;

import org.springframework.stereotype.Repository;
import ssm.blog.domain.AdminLoginLog;

import java.util.List;

@Repository
public interface AdminLoginLogDao {
    //通过id删除
    int deleteByPrimaryKey(Integer id);
    //插入记录
    int insert(AdminLoginLog record);

    int insertSelective(AdminLoginLog record);
    //查询
    AdminLoginLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminLoginLog record);

    int updateByPrimaryKey(AdminLoginLog record);

    List<AdminLoginLog> queryAll();
    //查询此管理员所有的登录信息
    List<AdminLoginLog> selectRencent(Integer adminId);
    //查询此管理员登录的次数
    int selectCountByAdminId(Integer adminId);
}
