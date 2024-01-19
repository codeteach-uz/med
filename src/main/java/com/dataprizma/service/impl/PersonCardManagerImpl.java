package com.dataprizma.service.impl;

import com.dataprizma.dao.PersonCardDao;
import com.dataprizma.model.PersonCard;
import com.dataprizma.service.PersonCardManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Admin on 28/02/2015.
 */
@Service("personCardManager")
public class PersonCardManagerImpl extends GenericManagerImpl<PersonCard, Long> implements PersonCardManager {
    private PersonCardDao personCardDao;

    @Autowired
    public void setPersonCardDao(PersonCardDao personCardDao) {
        this.dao = personCardDao;
        this.personCardDao = personCardDao;
    }

    @Override
    public List<PersonCard> getAllByCreationDate() {
        return personCardDao.getAllByCreationDate();
    }

    @Override
    public List<PersonCard> searchByWord(String word) {
        if (word == null || "".equals(word.trim())) {
            return getAllByCreationDate();
        }
        return personCardDao.searchByWord(word);
    }
}
