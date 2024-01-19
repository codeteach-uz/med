package com.dataprizma.dao.hibernate;

import com.dataprizma.dao.RegionDao;
import com.dataprizma.model.Region;
import org.springframework.stereotype.Repository;

/**
 * Created by Admin on 01/03/2015.
 */
@Repository("regionDao")
public class RegionDaoHibernate extends GenericDaoHibernate<Region, Long> implements RegionDao {
    public RegionDaoHibernate(){
        super(Region.class);
    }
}

