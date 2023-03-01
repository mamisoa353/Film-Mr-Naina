package hibernate.dao;

import hibernate.interfaceDao.InterfaceDao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;

//Hibernate 3.0
public class HibernateDao implements InterfaceDao {

    private SessionFactory sessionFactory;

    @Override
    public <T> T create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    @Override
    public <T> T findById(Class<T> clazz, Serializable id) {
        T entity;
        Session session = sessionFactory.openSession();
        entity = (T) session.get(clazz, id);
        session.close();
        return entity;
    }

    @Override
    public <T> List<T> findAll(Class<T> tClass) {
        List<T> results;
        Session session = sessionFactory.openSession();
        results = session.createCriteria(tClass).list();
        session.close();
        return results;
    }

    @Override
    public <T> List<T> findWhere(T entity) {
        List<T> results;
        Session session = sessionFactory.openSession();
        Example example = Example.create(entity).ignoreCase();
        results = session.createCriteria(entity.getClass()).add(example).list();
        session.close();
        return results;
    }

    @Override
    public <T> List<T> paginateWhere(T entity, int offset, int size) {
        List<T> results;
        Session session = sessionFactory.openSession();
        Example example = Example.create(entity).ignoreCase();
        results = session.createCriteria(entity.getClass())
                .add(example)
                .setFirstResult(offset)
                .setMaxResults(size).list();
        session.close();
        return results;
    }

    @Override
    public <T> List<T> paginate(Class<T> clazz, int offset, int size) {
        List<T> results;
        Session session = sessionFactory.openSession();
        results = session.createCriteria(clazz)
                .setFirstResult(offset)
                .setMaxResults(size).list();
        session.close();
        return results;
    }

    @Override
    public <T> List<T> paginate(Class<T> clazz, int offset, int size, int status) {
        List<T> results;
        Session session = sessionFactory.openSession();
        System.out.println("Status = " + status);
        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.or(Restrictions.sqlRestriction("datepublication < '" + Timestamp.valueOf(LocalDateTime.now()) + "'"), Restrictions.sqlRestriction("datepublication  IS NULL")), Restrictions.eq("status", String.valueOf(status))))
                .addOrder(Order.desc("importance"))
                .setFirstResult(offset)
                .setMaxResults(size).list();
        session.close();
        return results;
    }

    public <T> List<T> getDetail(Class<T> clazz, int idfilm, int idplateau) {
        List<T> results;
        Session session = sessionFactory.openSession();

        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.eq("filmidfilm", idfilm), Restrictions.eq("idplateau", idplateau))).list();
        session.close();
        return results;
    }
    
    public <T> List<T> getSuggestion(Class<T> clazz, int idfilm) {
        List<T> results;
        Session session = sessionFactory.openSession();

        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.eq("filmidfilm", idfilm))).list();
        session.close();
        return results;
    }
    public <T> List<T> getDetailFilm(Class<T> clazz, int idfilm) {
        List<T> results;
        Session session = sessionFactory.openSession();

        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.eq("idFilm", idfilm))).list();
        session.close();
        return results;
    }
    
    public <T> List<T> getDetailScene(Class<T> clazz, int idScene) {
        List<T> results;
        Session session = sessionFactory.openSession();

        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.eq("sceneidscene", idScene))).list();
        session.close();
        return results;
    }

    @Override
    public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc) {
        List<T> results;
        Session session = sessionFactory.openSession();
        Order order = (orderAsc) ? Order.asc(orderBy) : Order.desc(orderBy);
        results = session.createCriteria(clazz)
                .addOrder(order)
                .setFirstResult(offset)
                .setMaxResults(size).list();
        session.close();
        return results;
    }

    @Override
    public void deleteById(Class tClass, Serializable id) {
        delete(findById(tClass, id));
    }

    @Override
    public void delete(Object entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(entity);
        transaction.commit();
        session.close();
    }

    @Override
    public <T> T update(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
        session.close();
        return entity;
    }

    public <T> List<T> findWhereLike(T obj, HashMap<String, Object> likeParams, Integer offset, Integer size) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(obj.getClass());
        Disjunction or = Restrictions.disjunction();
        if (likeParams != null) {
            for (String key : likeParams.keySet()) {
                or.add(Restrictions.ilike(key, likeParams.get(key)));
            }
            criteria.add(or);
        }
        if (offset != null && size != null) {
            criteria.setFirstResult(offset);
            criteria.setMaxResults(size);
        } else if (offset == null) {
            criteria.setFirstResult(0);
            criteria.setMaxResults(size);
        }
        List<T> results = criteria.list();
        session.close();
        return results;
    }

    public int countLikes(Object obj, HashMap<String, Object> likeParams) {
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(obj.getClass());
        Disjunction or = Restrictions.disjunction();
        if (likeParams != null) {
            for (String key : likeParams.keySet()) {
                or.add(Restrictions.ilike(key, likeParams.get(key)));
            }
            criteria.add(or);
        }
        List<Object> results = criteria.list();
        int count = results.size();
        session.close();
        return count;
    }

    public <T> List<T> AuteurAritcle(Class<T> clazz, int offset, int size, int status, int idAuteur) {
        List<T> results;
        Session session = sessionFactory.openSession();
        System.out.println("Status = " + status);
        results = session.createCriteria(clazz)
                .add(Restrictions.and(Restrictions.eq("idAuteur", idAuteur), Restrictions.or(Restrictions.sqlRestriction("datepublication < '" + Timestamp.valueOf(LocalDateTime.now()) + "'"), Restrictions.sqlRestriction("datepublication  IS NULL")), Restrictions.eq("status", String.valueOf(status))))
                .addOrder(Order.desc("importance"))
                .setFirstResult(offset)
                .setMaxResults(size).list();
        session.close();
        return results;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
