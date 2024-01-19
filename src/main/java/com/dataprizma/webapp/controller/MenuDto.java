package com.dataprizma.webapp.controller;

import java.io.Serializable;

/**
 * Created by Sherzod Nurjonov
 */
public class MenuDto implements Serializable {
    private String name;
    private Double quantity=0.0;
    private Double belki=0.0;
    private Double jiri=0.0;
    private Double uglevodi=0.0;
    private Double kkal=0.0;

    public MenuDto() {
    }

    public MenuDto(String name, Double quantity, Double belki, Double jiri, Double uglevodi, Double kkal) {
        this.name = name;
        this.quantity = quantity;
        this.belki = belki;
        this.jiri = jiri;
        this.uglevodi = uglevodi;
        this.kkal = kkal;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getBelki() {
        return belki;
    }

    public void setBelki(Double belki) {
        this.belki = belki;
    }

    public Double getJiri() {
        return jiri;
    }

    public void setJiri(Double jiri) {
        this.jiri = jiri;
    }

    public Double getUglevodi() {
        return uglevodi;
    }

    public void setUglevodi(Double uglevodi) {
        this.uglevodi = uglevodi;
    }

    public Double getKkal() {
        return kkal;
    }

    public void setKkal(Double kkal) {
        this.kkal = kkal;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof MenuDto)) return false;

        MenuDto menuDto = (MenuDto) o;

        if (belki != null ? !belki.equals(menuDto.belki) : menuDto.belki != null) return false;
        if (jiri != null ? !jiri.equals(menuDto.jiri) : menuDto.jiri != null) return false;
        if (kkal != null ? !kkal.equals(menuDto.kkal) : menuDto.kkal != null) return false;
        if (name != null ? !name.equals(menuDto.name) : menuDto.name != null) return false;
        if (uglevodi != null ? !uglevodi.equals(menuDto.uglevodi) : menuDto.uglevodi != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (belki != null ? belki.hashCode() : 0);
        result = 31 * result + (jiri != null ? jiri.hashCode() : 0);
        result = 31 * result + (uglevodi != null ? uglevodi.hashCode() : 0);
        result = 31 * result + (kkal != null ? kkal.hashCode() : 0);
        return result;
    }
}
