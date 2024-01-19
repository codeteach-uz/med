package com.dataprizma.webapp.controller.editor;

import com.dataprizma.model.Region;
import com.dataprizma.service.RegionManager;
import com.dataprizma.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.beans.PropertyEditorSupport;

/**
 * Created by Admin on 01/03/2015.
 */
@Component
public class RegionEditor extends PropertyEditorSupport {

    @Autowired
    private RegionManager regionManager;


    @Override
    public String getAsText() {
        Region region = (Region) getValue();
        return (region != null) ? region.getId().toString() : null ;
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if(!StringUtils.isBlank(text)) {
            Long regionId = Long.parseLong(text);
            Region region = regionManager.get(regionId);
            setValue(region);
        }
    }
}