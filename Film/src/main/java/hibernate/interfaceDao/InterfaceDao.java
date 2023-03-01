/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package hibernate.interfaceDao;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author i.m.a
 */
public interface InterfaceDao {
    public <T> T create(T entity);
    public <T> T findById(Class<T> clazz,Serializable id);
    public <T> List<T> findAll(Class<T> tClass);
    public <T> List<T> findWhere(T entity);
    public <T> List<T> paginateWhere (T entity, int offset, int size);
    public <T> List<T> paginate(Class<T> clazz, int offset, int size);
    public <T> List<T> paginate(Class<T> clazz, int offset, int size,int status);
    public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc);
    public void deleteById(Class tClass, Serializable id);
    public void delete(Object entity);
    public <T> T update(T entity);
}
