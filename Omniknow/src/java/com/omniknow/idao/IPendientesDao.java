package com.omniknow.idao;

import com.omniknow.Modelos.Pendientes;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IPendientesDao extends Plantilla<Pendientes>{

    @Override
    public boolean Create(Pendientes t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Pendientes> Read();

    @Override
    public Pendientes Read(int k);

    @Override
    public boolean Update(Pendientes t);
    
}
