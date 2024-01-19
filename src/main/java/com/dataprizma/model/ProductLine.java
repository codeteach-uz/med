package com.dataprizma.model;

import javax.persistence.*;

/**
 * Created by Sherzod Nurjonov
 */
@Entity
@Table(name = "product_lines")
@SequenceGenerator(name = "LineSeq", sequenceName = "seq_line")
public class ProductLine {

    private Long id;
    private Double quantity;
    private Product product;
    private PersonCard personCard;

    public ProductLine() {
    }

    public ProductLine(Double quantity, Product product, PersonCard personCard) {
        this.quantity = quantity;
        this.product = product;
        this.personCard = personCard;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LineSeq")
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    @ManyToOne
    @JoinColumn(name = "product_id")
    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @ManyToOne
    @JoinColumn(name = "person_card_id")
    public PersonCard getPersonCard() {
        return personCard;
    }

    public void setPersonCard(PersonCard personCard) {
        this.personCard = personCard;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ProductLine)) return false;

        ProductLine that = (ProductLine) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (personCard != null ? !personCard.equals(that.personCard) : that.personCard != null) return false;
        if (product != null ? !product.equals(that.product) : that.product != null) return false;
        if (quantity != null ? !quantity.equals(that.quantity) : that.quantity != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (quantity != null ? quantity.hashCode() : 0);
        result = 31 * result + (product != null ? product.hashCode() : 0);
        result = 31 * result + (personCard != null ? personCard.hashCode() : 0);
        return result;
    }
}
