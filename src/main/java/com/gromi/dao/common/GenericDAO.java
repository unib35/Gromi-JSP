package com.gromi.dao.common;

import java.util.List;

public interface GenericDAO<T, ID> {
    void insert(T entity) throws Exception;
    T findById(ID id) throws Exception;
    List<T> findAll() throws Exception;
    void update(ID id, T entity) throws Exception;
    void delete(T entity) throws Exception;
    void deleteById(ID id) throws Exception;
} 