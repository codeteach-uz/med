package com.dataprizma.model;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.*;

/**
 * Created by Admin on 27/02/2015.
 */
@Entity
@Table(name = "personcards")
@SequenceGenerator(name = "PersonCardSeq", sequenceName = "seq_person_card")
@XmlRootElement
public class PersonCard{
    private Long id;
    private Date dateOfFill;
    private String nAmbCard;
    private String fullName;
    private Date dateOfBirth;
    private Integer age;
    private Integer sex;
    private Integer height;
    private Double massBody;
    private Double bmi;
    private Double sad;
    private Double dad;
    private Double pulse;
    private Double adp;
    private Double ads;
    private Double waistCircum;
    private Double hipCircum;
    private Double waistHip;
    private Integer zdv;
    private Integer staticBalance;
    private TestTexas testTexas = new TestTexas();
    private TestTable testTable = new TestTable();
    private TestPsix testPsix = new TestPsix();
    private BloodAnalyze bloodAnalyze = new BloodAnalyze();
    private Urinalisis urinalisis = new Urinalisis();
    private Double score;
    private Integer label;
    private Region region;
    private Date dateOfSaved;
    private Integer healthIndex;


    private List<ProductLine> productLines = new ArrayList<>();

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "PersonCardSeq")
//    @GeneratedValue(strategy=GenerationType.IDENTITY) // for mysql
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column
    public Date getDateOfFill() {
        return dateOfFill;
    }

    public void setDateOfFill(Date dateOfFill) {
        this.dateOfFill = dateOfFill;
    }

    @Column
    public String getnAmbCard() {
        return nAmbCard;
    }

    public void setnAmbCard(String nAmbCard) {
        this.nAmbCard = nAmbCard;
    }

    @Column(length = 150)
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Column
    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Column
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Column
    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Column
    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    @Column
    public Double getMassBody() {
        return massBody;
    }

    public void setMassBody(Double massBody) {
        this.massBody = massBody;
    }

    @Column
    public Double getBmi() {
        return bmi;
    }

    public void setBmi(Double bmi) {
        this.bmi = bmi;
    }

    @Column
    public Double getSad() {
        return sad;
    }

    public void setSad(Double sad) {
        this.sad = sad;
    }

    @Column
    public Double getDad() {
        return dad;
    }

    public void setDad(Double dad) {
        this.dad = dad;
    }

    @Column
    public Double getPulse() {
        return pulse;
    }

    public void setPulse(Double pulse) {
        this.pulse = pulse;
    }

    @Column
    public Double getAdp() {
        return adp;
    }

    public void setAdp(Double adp) {
        this.adp = adp;
    }

    @Column
    public Double getAds() {
        return ads;
    }

    public void setAds(Double ads) {
        this.ads = ads;
    }

    @Column
    public Double getWaistCircum() {
        return waistCircum;
    }

    public void setWaistCircum(Double waistCircum) {
        this.waistCircum = waistCircum;
    }

    @Column
    public Double getHipCircum() {
        return hipCircum;
    }

    public void setHipCircum(Double hipCircum) {
        this.hipCircum = hipCircum;
    }

    @Column
    public Double getWaistHip() {
        return waistHip;
    }

    public void setWaistHip(Double waistHip) {
        this.waistHip = waistHip;
    }

    @Column
    public Integer getZdv() {
        return zdv;
    }

    public void setZdv(Integer zdv) {
        this.zdv = zdv;
    }

    @Column
    public Integer getStaticBalance() {
        return staticBalance;
    }

    public void setStaticBalance(Integer staticBalance) {
        this.staticBalance = staticBalance;
    }


    @Embedded
    public TestTexas getTestTexas() {
        return testTexas;
    }

    public void setTestTexas(TestTexas testTexas) {
        this.testTexas = testTexas;
    }

    @Embedded
    public TestTable getTestTable() {
        return testTable;
    }

    public void setTestTable(TestTable testTable) {
        this.testTable = testTable;
    }

    @Embedded
    public TestPsix getTestPsix() {
        return testPsix;
    }

    public void setTestPsix(TestPsix testPsix) {
        this.testPsix = testPsix;
    }

    @Embedded
    public BloodAnalyze getBloodAnalyze() {
        return bloodAnalyze;
    }

    public void setBloodAnalyze(BloodAnalyze bloodAnalyze) {
        this.bloodAnalyze = bloodAnalyze;
    }

    @Embedded
    public Urinalisis getUrinalisis() {
        return urinalisis;
    }

    public void setUrinalisis(Urinalisis urinalisis) {
        this.urinalisis = urinalisis;
    }

    @Column
    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    @Column
    public Integer getLabel() {
        return label;
    }

    public void setLabel(Integer label) {
        this.label = label;
    }

    @ManyToOne
    @JoinColumn(name = "region_id")
    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    @Column
    public Date getDateOfSaved() {
        return dateOfSaved;
    }

    public void setDateOfSaved(Date dateOfSaved) {
        this.dateOfSaved = dateOfSaved;
    }

    @Column(name = "health_index")
    public Integer getHealthIndex() {
        return healthIndex;
    }

    public void setHealthIndex(Integer healthIndex) {
        this.healthIndex = healthIndex;
    }

    @OneToMany(cascade = CascadeType.MERGE, mappedBy = "personCard")
    public List<ProductLine> getProductLines() {
        return productLines;
    }

    public void setProductLines(List<ProductLine> productLines) {
        this.productLines = productLines;
    }


}
