/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Tan Phat
 */
public interface GenericDAO<T> {

    void insert(T t) throws SQLException;

    T getById(int id) throws SQLException;

    List<T> getAll() throws SQLException;

    void update(T t) throws SQLException;

    void delete(int id) throws SQLException;
}
