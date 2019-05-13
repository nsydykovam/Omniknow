package com.omniknow.idao;

import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface Plantilla <T>{
    boolean Create(T t);
    List<T> Read();
    T Read(int k);
    boolean Update(T t);
    boolean Delete(int k);
}
