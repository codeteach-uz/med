package com.dataprizma.service;

import com.dataprizma.model.Product;
import com.dataprizma.model.ProductType;

import java.util.List;

/**
 * Created by Admin on 01/03/2015.
 */
public interface ProductManager extends GenericManager<Product, Long>{
    List<Product> getProductListByType(ProductType type);
}
