package ssm.blog.dao;

import org.springframework.stereotype.Repository;
import ssm.blog.domain.Admin;

import java.util.List;

@Repository
public interface AdminDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    List<Admin> getAdminAll();
}

