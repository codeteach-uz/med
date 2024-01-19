/*
package com.dataprizma.model;

import javax.persistence.*;

*/
/**
 * Created by Admin on 27/02/2015.
 *//*

@Entity
@Table(name = "questions")
public class Question {
    private Long id;
    private String question;
    private Integer answer;
    private PersonCard personCard;

    @Id
    @Column
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(length = 1000)
    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @Column
    public Integer getAnswer() {
        return answer;
    }

    public void setAnswer(Integer answer) {
        this.answer = answer;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "person_card_id")
    public PersonCard getPersonCard() {
        return personCard;
    }

    public void setPersonCard(PersonCard personCard) {
        this.personCard = personCard;
    }
}
*/
