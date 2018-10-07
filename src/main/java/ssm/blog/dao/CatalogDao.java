package ssm.blog.dao;
import org.springframework.stereotype.Repository;
import ssm.blog.domain.Catalog;

@Repository
public interface CatalogDao {

    int deleteByPrimaryKey(Integer id);

    int insert(Catalog record);

    int insertSelective(Catalog record);

    Catalog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Catalog record);

    int updateByPrimaryKeyWithBLOBs(Catalog record);

    int updateByPrimaryKey(Catalog record);
}