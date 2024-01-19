package com.dataprizma.dao.hibernate;

import com.dataprizma.dao.ProductDao;
import com.dataprizma.model.Product;
import com.dataprizma.model.ProductType;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Admin on 01/03/2015.
 */
@Repository("productDao")
public class ProductDaoHibernate extends GenericDaoHibernate<Product, Long> implements ProductDao {
    public ProductDaoHibernate(){
        super(Product.class);
    }

    @Override
    public List<Product> getProductListByType(ProductType type) {
        Query query = getSession().createQuery("from Product p where p.productType=:productType")
                .setParameter("productType", type);
        return (List<Product>)query.list();
    }
}

