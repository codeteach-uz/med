package com.dataprizma.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by Admin on 27/02/2015.
 */
@Embeddable
public class BloodAnalyze {
    private Double hgb; // gemoglobin
    private Double rbc; //eritrosit
    private Double wbc; //leykosit
    private Double soe; //SOE
    private Double pti;
    private Double xolesterin;
    private Double saxar;

    @Column(name = "blood_hgb")
    public Double getHgb() {
        return hgb;
    }

    public void setHgb(Double hgb) {
        this.hgb = hgb;
    }

    @Column(name = "blood_rbc")
    public Double getRbc() {
        return rbc;
    }

    public void setRbc(Double rbc) {
        this.rbc = rbc;
    }

    @Column(name = "blood_wbc")
    public Double getWbc() {
        return wbc;
    }

    public void setWbc(Double wbc) {
        this.wbc = wbc;
    }

    @Column(name = "blood_soe")
    public Double getSoe() {
        return soe;
    }

    public void setSoe(Double soe) {
        this.soe = soe;
    }

    @Column(name = "blood_pti")
    public Double getPti() {
        return pti;
    }

    public void setPti(Double pti) {
        this.pti = pti;
    }

    @Column
    public Double getXolesterin() {
        return xolesterin;
    }

    public void setXolesterin(Double xolesterin) {
        this.xolesterin = xolesterin;
    }

    @Column(name = "blood_saxar")
    public Double getSaxar() {
        return saxar;
    }

    public void setSaxar(Double saxar) {
        this.saxar = saxar;
    }
}
