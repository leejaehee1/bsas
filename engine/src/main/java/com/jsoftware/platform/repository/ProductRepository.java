package com.jsoftware.platform.repository;

import com.jsoftware.platform.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductRepository {

    Product selectProductById(long id);

    List<Product> selectAllProducts();

    void insertProduct(Product product);
}