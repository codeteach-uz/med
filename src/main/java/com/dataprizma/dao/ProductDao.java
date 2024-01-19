package com.dataprizma.dao;

import com.dataprizma.model.Product;
import com.dataprizma.model.ProductType;

import java.util.List;

/**
 * Created by Admin on 01/03/2015.
 */
public interface ProductDao extends GenericDao<Product, Long> {

    List<Product> getProductListByType(ProductType type);
}
