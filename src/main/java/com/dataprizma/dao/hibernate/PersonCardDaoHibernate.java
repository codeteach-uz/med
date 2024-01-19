package com.dataprizma.dao.hibernate;

import com.dataprizma.dao.PersonCardDao;
import com.dataprizma.model.PersonCard;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Admin on 28/02/2015.
 */
@Repository("personCardDao")
public class PersonCardDaoHibernate extends GenericDaoHibernate<PersonCard, Long> implements PersonCardDao {
    public PersonCardDaoHibernate() {
        super(PersonCard.class);
    }

    @Override
    public List<PersonCard> getAllByCreationDate() {
        Query query = getSession().createQuery("from PersonCard p order by p.id desc");
        return query.list();
    }

    @Override
    public List<PersonCard> searchByWord(String word) {
        Query query = getSession().createQuery("from PersonCard p where p.fullName like :word OR p.nAmbCard like :word order by p.id desc");
        query.setParameter("word", "%" + word + "%");
        return (List<PersonCard>) query.list();
    }
}
