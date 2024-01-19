package com.dataprizma.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by Admin on 27/02/2015.
 */
@Embeddable
public class TestTexas {
    private Integer answer1;
    private Integer answer2;
    private Integer answer3;
    private Integer answer4;
    private Integer answer5;
    private Integer answer6;
    private Integer answer7;
    private Integer answer8;
    private Integer answer9;
    private Integer total;
    private Integer answer11;
    private Integer answer12;
    private Integer answer13;
    private Integer answer14;
    private Integer biologicAge;
    private Integer dbv;

    @Column
    public Integer getAnswer1() {
        return answer1;
    }

    public void setAnswer1(Integer answer1) {
        this.answer1 = answer1;
    }

    @Column
    public Integer getAnswer2() {
        return answer2;
    }

    public void setAnswer2(Integer answer2) {
        this.answer2 = answer2;
    }

    @Column
    public Integer getAnswer3() {
        return answer3;
    }

    public void setAnswer3(Integer answer3) {
        this.answer3 = answer3;
    }

    @Column
    public Integer getAnswer4() {
        return answer4;
    }

    public void setAnswer4(Integer answer4) {
        this.answer4 = answer4;
    }

    @Column
    public Integer getAnswer5() {
        return answer5;
    }

    public void setAnswer5(Integer answer5) {
        this.answer5 = answer5;
    }

    @Column
    public Integer getAnswer6() {
        return answer6;
    }

    public void setAnswer6(Integer answer6) {
        this.answer6 = answer6;
    }

    @Column
    public Integer getAnswer7() {
        return answer7;
    }

    public void setAnswer7(Integer answer7) {
        this.answer7 = answer7;
    }

    @Column
    public Integer getAnswer8() {
        return answer8;
    }

    public void setAnswer8(Integer answer8) {
        this.answer8 = answer8;
    }

    @Column
    public Integer getAnswer9() {
        return answer9;
    }

    public void setAnswer9(Integer answer9) {
        this.answer9 = answer9;
    }

    @Column
    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    @Column
    public Integer getAnswer11() {
        return answer11;
    }

    public void setAnswer11(Integer answer11) {
        this.answer11 = answer11;
    }

    @Column
    public Integer getAnswer12() {
        return answer12;
    }

    public void setAnswer12(Integer answer12) {
        this.answer12 = answer12;
    }

    @Column
    public Integer getAnswer13() {
        return answer13;
    }

    public void setAnswer13(Integer answer13) {
        this.answer13 = answer13;
    }

    @Column
    public Integer getAnswer14() {
        return answer14;
    }

    public void setAnswer14(Integer answer14) {
        this.answer14 = answer14;
    }

    @Column
    public Integer getBiologicAge() {
        return biologicAge;
    }

    public void setBiologicAge(Integer biologicAge) {
        this.biologicAge = biologicAge;
    }

    @Column
    public Integer getDbv() {
        return dbv;
    }

    public void setDbv(Integer dbv) {
        this.dbv = dbv;
    }
}
