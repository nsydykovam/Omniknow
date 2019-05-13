package com.omniknow.idao;

import com.omniknow.Modelos.Tareas;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface ITareasDao extends Plantilla<Tareas>{

    @Override
    public boolean Create(Tareas t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Tareas> Read();

    @Override
    public Tareas Read(int k);

    @Override
    public boolean Update(Tareas t);
    
}
