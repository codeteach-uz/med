package com.dataprizma.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by Admin on 27/02/2015.
 */
@Embeddable
public class TestPsix {
    private Integer ques1;
    private Integer ques2;
    private Integer ques3;
    private Integer ques4;
    private Integer ques5;
    private Integer ques6;
    private Integer ques7;
    private Double averg;
    private Integer urovenStress;
    private Integer fizCase;
    private Integer psixCase;
    private Integer socialCase;
    private Double ifs;
    private Integer ufs;
    private Double ap;
    private Integer apType;

    @Column
    public Integer getQues1() {
        return ques1;
    }

    public void setQues1(Integer ques1) {
        this.ques1 = ques1;
    }

    @Column
    public Integer getQues2() {
        return ques2;
    }

    public void setQues2(Integer ques2) {
        this.ques2 = ques2;
    }

    @Column
    public Integer getQues3() {
        return ques3;
    }

    public void setQues3(Integer ques3) {
        this.ques3 = ques3;
    }

    @Column
    public Integer getQues4() {
        return ques4;
    }

    public void setQues4(Integer ques4) {
        this.ques4 = ques4;
    }

    @Column
    public Integer getQues5() {
        return ques5;
    }

    public void setQues5(Integer ques5) {
        this.ques5 = ques5;
    }

    @Column
    public Integer getQues6() {
        return ques6;
    }

    public void setQues6(Integer ques6) {
        this.ques6 = ques6;
    }

    @Column
    public Integer getQues7() {
        return ques7;
    }

    public void setQues7(Integer ques7) {
        this.ques7 = ques7;
    }

    @Column
    public Double getAverg() {
        return averg;
    }

    public void setAverg(Double averg) {
        this.averg = averg;
    }

    @Column
    public Integer getUrovenStress() {
        return urovenStress;
    }

    public void setUrovenStress(Integer urovenStress) {
        this.urovenStress = urovenStress;
    }

    @Column
    public Integer getFizCase() {
        return fizCase;
    }

    public void setFizCase(Integer fizCase) {
        this.fizCase = fizCase;
    }

    @Column
    public Integer getPsixCase() {
        return psixCase;
    }

    public void setPsixCase(Integer psixCase) {
        this.psixCase = psixCase;
    }

    @Column
    public Integer getSocialCase() {
        return socialCase;
    }

    public void setSocialCase(Integer socialCase) {
        this.socialCase = socialCase;
    }

    @Column
    public Double getIfs() {
        return ifs;
    }

    public void setIfs(Double ifs) {
        this.ifs = ifs;
    }

    @Column
    public Integer getUfs() {
        return ufs;
    }

    public void setUfs(Integer ufs) {
        this.ufs = ufs;
    }

    @Column
    public Double getAp() {
        return ap;
    }

    public void setAp(Double ap) {
        this.ap = ap;
    }

    @Column
    public Integer getApType() {
        return apType;
    }

    public void setApType(Integer apType) {
        this.apType = apType;
    }
}
