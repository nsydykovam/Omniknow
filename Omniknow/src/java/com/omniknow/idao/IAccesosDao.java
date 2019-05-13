package com.omniknow.idao;

import com.omniknow.Modelos.Accesos;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IAccesosDao extends Plantilla<Accesos>{ 

    @Override
    public boolean Create(Accesos t);

    @Override
    public List<Accesos> Read();

    @Override
    public Accesos Read(int k);

    @Override
    public boolean Update(Accesos t);

    @Override
    public boolean Delete(int k);
    
}
