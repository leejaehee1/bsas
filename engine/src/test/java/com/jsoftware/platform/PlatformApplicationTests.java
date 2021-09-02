package com.jsoftware.platform;

import com.jsoftware.platform.model.Product;
import com.jsoftware.platform.repository.ProductRepositoryImpl;
import com.jsoftware.platform.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@Slf4j
@SpringBootTest
@RunWith(SpringRunner.class)
class PlatformApplicationTests {

    @Autowired
    private ProductRepositoryImpl productRepository;

    @Autowired
    private ProductService productService;

    @Test
    public void getProductById() {
        Product product = productRepository.selectProductById(1L);
        log.info("product : {}", product);
    }

    @Test
    public void getProductById2() {
        Product product = productService.getProductById(1L);
        log.info("product2 : {}", product);
    }

    @Test
    public void getProductById3() {
        List<Product> products = productService.getAllProducts();
        for (Product product : products) {
            log.info("product3 : {}", product);
        }
    }
}
