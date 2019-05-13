package com.omniknow.idao;

import com.omniknow.Modelos.Entrenadores;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IEntrenadoresDao extends Plantilla<Entrenadores>{

    @Override
    public boolean Create(Entrenadores t);

    @Override
    public List<Entrenadores> Read();

    @Override
    public Entrenadores Read(int k);

    @Override
    public boolean Update(Entrenadores t);

    @Override
    public boolean Delete(int k);
    
}
