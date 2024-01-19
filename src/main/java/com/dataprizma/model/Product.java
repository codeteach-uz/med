package com.dataprizma.model;

import javax.persistence.*;

/**
 * Created by Sherzod Nurjonov
 */
@Entity
@Table(name = "products")
@SequenceGenerator(name = "ProductSeq", sequenceName = "seq_product")
public class Product {

    private Long id;
    private String name;
    private Double belki;
    private Double jiri;
    private Double uglevodi;
    private Double kkal;
    private ProductType productType;

    public Product() {
    }

    public Product(Long id, String name, Double belki, Double jiri, Double uglevodi, Double kkal, ProductType productType) {
        this.id = id;
        this.name = name;
        this.belki = belki;
        this.jiri = jiri;
        this.uglevodi = uglevodi;
        this.kkal = kkal;
        this.productType = productType;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ProductSeq")
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column
    public Double getBelki() {
        return belki;
    }

    public void setBelki(Double belki) {
        this.belki = belki;
    }

    @Column
    public Double getJiri() {
        return jiri;
    }

    public void setJiri(Double jiri) {
        this.jiri = jiri;
    }

    @Column
    public Double getUglevodi() {
        return uglevodi;
    }

    public void setUglevodi(Double uglevodi) {
        this.uglevodi = uglevodi;
    }

    @Column
    public Double getKkal() {
        return kkal;
    }

    public void setKkal(Double kkal) {
        this.kkal = kkal;
    }

    @Enumerated(EnumType.STRING)
    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;

        Product product = (Product) o;

        if (id != null ? !id.equals(product.id) : product.id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
