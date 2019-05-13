package com.omniknow.idao;

import com.omniknow.Modelos.Puntajes;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface IPuntajesDao extends Plantilla<Puntajes>{

    @Override
    public boolean Create(Puntajes t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Puntajes> Read();

    @Override
    public Puntajes Read(int k);

    @Override
    public boolean Update(Puntajes t);
   
}
