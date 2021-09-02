package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Product;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductRepositoryImpl implements ProductRepository {

    final SqlSessionFactory sqlSessionFactory;

    final SqlSessionTemplate sqlSessionTemplate;

    public ProductRepositoryImpl(SqlSessionFactory sqlSessionFactory, SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionFactory = sqlSessionFactory;
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    @Override
    public Product selectProductById(long id) {
        Product product = new Product();
        product.setProdId(id);
        product.setProdPrice(2700);
//        return sqlSession.openSession().selectOne("selectProductById", product);
        return sqlSessionTemplate.selectOne("selectProductById", product);
    }

    @Override
    public List<Product> selectAllProducts() {
        return sqlSessionTemplate.selectList("selectAllProducts");
    }

    @Override
    public void insertProduct(Product product) {
        sqlSessionTemplate.insert("insertProduct", product);
    }

}