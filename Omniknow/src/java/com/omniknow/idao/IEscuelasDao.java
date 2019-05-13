package com.omniknow.idao;

import com.omniknow.Modelos.Escuelas;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IEscuelasDao extends Plantilla<Escuelas>{

    @Override
    public boolean Create(Escuelas t);

    @Override
    public List<Escuelas> Read();

    @Override
    public Escuelas Read(int k);

    @Override
    public boolean Update(Escuelas t);

    @Override
    public boolean Delete(int k);
    
}
