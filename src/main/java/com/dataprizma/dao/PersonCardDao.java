package com.dataprizma.dao;

import com.dataprizma.model.PersonCard;

import java.util.List;

/**
 * Created by Admin on 28/02/2015.
 */
public interface PersonCardDao extends GenericDao<PersonCard, Long> {
    List<PersonCard> getAllByCreationDate();

    List<PersonCard> searchByWord(String word);
}
