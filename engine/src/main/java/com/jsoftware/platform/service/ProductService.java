package com.jsoftware.platform.service;

import com.jsoftware.platform.model.Product;
import com.jsoftware.platform.repository.ProductRepositoryImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductService {

    private final ProductRepositoryImpl productRepository;

    public ProductService(ProductRepositoryImpl productRepository) {
        this.productRepository = productRepository;
    }

    public Product getProductById(Long id) {
        return productRepository.selectProductById(1);
    }

    public List<Product> getAllProducts() {
        return productRepository.selectAllProducts();
    }

    @Transactional
    public void addProduct(Product product) {
        productRepository.insertProduct(product);
    }
}