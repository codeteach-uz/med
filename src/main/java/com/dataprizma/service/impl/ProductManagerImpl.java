package com.dataprizma.service.impl;

import com.dataprizma.dao.ProductDao;
import com.dataprizma.dao.RegionDao;
import com.dataprizma.model.Product;
import com.dataprizma.model.ProductType;
import com.dataprizma.model.Region;
import com.dataprizma.service.ProductManager;
import com.dataprizma.service.RegionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Admin on 01/03/2015.
 */
@Service("productManager")
public class ProductManagerImpl extends GenericManagerImpl<Product, Long> implements ProductManager {
    private ProductDao productDao;

    @Autowired
    public void setProductDao(ProductDao productDao){
        this.dao = productDao;
        this.productDao = productDao;
    }

    @Override
    public List<Product> getProductListByType(ProductType type) {
        return productDao.getProductListByType(type);
    }
}
