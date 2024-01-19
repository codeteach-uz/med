package com.dataprizma.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by Admin on 02/03/2015.
 */
@Embeddable
public class Urinalisis {
    private Double udves;
    private Double leyk;
    private Integer belok;
    private Integer saxar;
    private Integer erit;

    @Column(name = "urin_udves")
    public Double getUdves() {
        return udves;
    }

    public void setUdves(Double udves) {
        this.udves = udves;
    }

    @Column(name = "urin_leyk")
    public Double getLeyk() {
        return leyk;
    }

    public void setLeyk(Double leyk) {
        this.leyk = leyk;
    }

    @Column(name = "urin_belok")
    public Integer getBelok() {
        return belok;
    }

    public void setBelok(Integer belok) {
        this.belok = belok;
    }

    @Column(name = "urin_saxar")
    public Integer getSaxar() {
        return saxar;
    }

    public void setSaxar(Integer saxar) {
        this.saxar = saxar;
    }

    @Column(name = "urin_erit")
    public Integer getErit() {
        return erit;
    }

    public void setErit(Integer erit) {
        this.erit = erit;
    }
}
