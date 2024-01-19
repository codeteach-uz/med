package com.dataprizma.service;

import com.dataprizma.model.PersonCard;

import java.util.List;

/**
 * Created by Admin on 28/02/2015.
 */
public interface PersonCardManager extends GenericManager<PersonCard, Long> {
    List<PersonCard> getAllByCreationDate();
    List<PersonCard> searchByWord(String word);
}
