package com.dataprizma.service.impl;

import com.dataprizma.dao.RegionDao;
import com.dataprizma.model.Region;
import com.dataprizma.service.RegionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Admin on 01/03/2015.
 */
@Service("regionManager")
public class RegionManagerImpl extends GenericManagerImpl<Region, Long> implements RegionManager {
    private RegionDao regionDao;

    @Autowired
    public void setRegionDao(RegionDao regionDao){
        this.dao = regionDao;
        this.regionDao = regionDao;
    }
}
