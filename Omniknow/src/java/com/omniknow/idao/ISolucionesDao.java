package com.omniknow.idao;

import com.omniknow.Modelos.Soluciones;
import java.util.List;

/**
 *
 * @author Perez Rosales
 */
public interface ISolucionesDao extends Plantilla<Soluciones>{

    @Override
    public boolean Create(Soluciones t);

    @Override
    public boolean Delete(int k);

    @Override
    public List<Soluciones> Read();

    @Override
    public Soluciones Read(int k);

    @Override
    public boolean Update(Soluciones t);
    
}
